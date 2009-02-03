From: KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Tue, 3 Feb 2009 13:38:11 +0900
Message-ID: <20090203133811.47324d80.kamezawa.hiroyu@jp.fujitsu.com>
References: <20090128213322.GA15789@kroah.com>
	<20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com>
	<20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20090130061714.GC31209@kroah.com>
	<20090202220856.GY20323@random.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090202220856.GY20323-ulAA2RpUuRJvbPj5LQlJ3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 2 Feb 2009 23:08:56 +0100
Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Hi Greg!
> 
> > Thanks for the pointers, I'll go read the thread and follow up there.
> 
> If you also run into this final fix is attached below. Porting to
> mainline is a bit hard because of gup-fast... Perhaps we can use mmu
> notifiers to fix gup-fast... need to think more about it then I'll
> post something.
> 
> Please help testing the below on pre-gup-fast kernels, thanks!
> 
> From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Subject: fork-o_direct-race
> 
> Think a thread writing constantly to the last 512bytes of a page, while another
> thread read and writes to/from the first 512bytes of the page. We can lose
> O_DIRECT reads (or any other get_user_pages write=1 I/O not just bio/O_DIRECT),
> the very moment we mark any pte wrprotected because a third unrelated thread
> forks off a child.
> 
> This fixes it by never wprotecting anon ptes if there can be any direct I/O in
> flight to the page, and by instantiating a readonly pte and triggering a COW in
> the child. The only trouble here are O_DIRECT reads (writes to memory, read
> from disk). Checking the page_count under the PT lock guarantees no
> get_user_pages could be running under us because if somebody wants to write to
> the page, it has to break any cow first and that requires taking the PT lock in
> follow_page before increasing the page count. We are guaranteed mapcount is 1 if
> fork is writeprotecting the pte so the PT lock is enough to serialize against
> get_user_pages->get_page.
> 
> The COW triggered inside fork will run while the parent pte is readonly to
> provide as usual the per-page atomic copy from parent to child during fork.
> However timings will be altered by having to copy the pages that might be under
> O_DIRECT.
> 
> The pagevec code calls get_page while the page is sitting in the pagevec
> (before it becomes PageLRU) and doing so it can generate false positives, so to
> avoid slowing down fork all the time even for pages that could never possibly
> be under O_DIRECT write=1, the PG_gup bitflag is added, this eliminates
> most overhead of the fix in fork.
> 
> Patch doesn't break kABI despite introducing a new page flag.
> 
> Fixed version of original patch from Nick Piggin.
> 
> Signed-off-by: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---

Sorry, one more ;)
==
1117                         cond_resched();
1118                         while (!(page = follow_page(vma, start, foll_flags))) {
1119                                 int ret;
1120                                 ret = __handle_mm_fault(mm, vma, start,
1121                                                 foll_flags & FOLL_WRITE);
1122                                 /*
1123                                  * The VM_FAULT_WRITE bit tells us that do_wp_page has
1124                                  * broken COW when necessary, even if maybe_mkwrite
1125                                  * decided not to set pte_write. We can thus safely do
1126                                  * subsequent page lookups as if they were reads.
1127                                  */
1128                                 if (ret & VM_FAULT_WRITE)
1129                                         foll_flags &= ~FOLL_WRITE;
==

>From above, FOLL_WRITE can be dropped and PageGUP() will not be set ?

Thanks,
-Kame


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
