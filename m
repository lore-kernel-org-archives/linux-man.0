From: KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Tue, 3 Feb 2009 13:13:47 +0900
Message-ID: <20090203131347.0aa6c5d0.kamezawa.hiroyu@jp.fujitsu.com>
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
> 
Just curious, could you confirm following ?

(following is from RHEL5.3)

It seems page_cache_release() is called before page_cache_get().
Doesn't this break your assumption ? 
(I mean following code is buggy.)
Do we have extra page_count() somewhere before page_cache_release() ?

=
 667 submit_page_section(struct dio *dio, struct page *page,
 668                 unsigned offset, unsigned len, sector_t blocknr)
 669 {
 670         int ret = 0;
 671 
 672         /*
 673          * Can we just grow the current page's presence in the dio?
 674          */
 675         if (    (dio->cur_page == page) &&
 676                 (dio->cur_page_offset + dio->cur_page_len == offset) &&
 677                 (dio->cur_page_block +
 678                         (dio->cur_page_len >> dio->blkbits) == blocknr)) {
 679                 dio->cur_page_len += len;
 680 
 681                 /*
 682                  * If dio->boundary then we want to schedule the IO now to
 683                  * avoid metadata seeks.
 684                  */
 685                 if (dio->boundary) {
 686                         ret = dio_send_cur_page(dio);
 687                         page_cache_release(dio->cur_page);
 688                         dio->cur_page = NULL;
 689                 }
 690                 goto out;
 691         }
 692 
 693         /*
 694          * If there's a deferred page already there then send it.
 695          */
 696         if (dio->cur_page) {
 697                 ret = dio_send_cur_page(dio);
 698                 page_cache_release(dio->cur_page);
 699                 dio->cur_page = NULL;
 700                 if (ret)
 701                         goto out;
 702         }
 703 
 704         page_cache_get(page);           /* It is in dio */
 705         dio->cur_page = page;
 706         dio->cur_page_offset = offset;
 707         dio->cur_page_len = len;
 708         dio->cur_page_block = blocknr;
 709 out:
 710         return ret;
 711 }
==

Regards,
-Kame




--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
