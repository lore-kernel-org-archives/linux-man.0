From: Izik Eidus <ieidus-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Sat, 07 Feb 2009 15:32:03 +0200
Message-ID: <498D8D53.6030007@redhat.com>
References: <20090128213322.GA15789@kroah.com> <20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com> <20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090130061714.GC31209@kroah.com> <20090202220856.GY20323@random.random> <20090204234153.GA32244@kroah.com> <20090206175414.GQ14011@random.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090206175414.GQ14011-ulAA2RpUuRJvbPj5LQlJ3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nick Piggin <npiggin-l3A5Bk7waGM@public.gmane.org>, Hugh Dickins <hugh-DTz5qymZ9yRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Andrea Arcangeli wrote:
>
> Here the latest patch. Now that I consider the 'production' trouble
> closed I'll be porting it to mainline while addressing gup-fast too
> which is an additional complication I didn't have to take care of
> yet. So expect a patch that works for you in the next few days, either
> that or complains about an unfixable gup-fast ;). But frankly I've
> been thinking it should be possible in a much simpler way that I
> ever thought before, by entirely relaying on the tlb flush.
>
> In short if I simply do the page-count vs page-mapcount check _after_
> ptep_set_wrprotect (which implies a tlb flush and after that any
> gup-fast running in other cpus should be forced through the slow path
> and block) I think I'm done. The code now does:
>
>     check mapcount
>     ptep_set_wrprotect
>
> I think to make the thing working with gup-fast I've only to
> ptep_set_wrprotect before the mapcount check.
>
> The reason why the normal pagetable walking of the cpu is ok with
> current code is that ptep_set_wrprotect done later will block any
> access to the page from the other cpus. Not so if it was gup-fast
> taking reference on the page. So we need to stop with
> ptep_set_wrprotect any subsequential gup-fast _before_ we check count
> vs mapcount and the fact the get_page is run inside the critical
> section with local irq disabled in gup-fast should close the race for
> gup-fast too. Will try that ASAP...
>
>   
Hi Andrea,
Good approach, but I think that it isn't enough to just change the order 
of check mapcount and ptep_set_wrprotect(),
the reason is that gup_fast do the get_page() AFTER it fetched the pte, 
so we are opening here a tiny race:

cpu#1 do get_user_pages_fast and fetch the pte (it think the pte is 
writeable)
cpu#2 do ptep_set_wrprotect()
cpu#2 check the mapcount against pagecount (it think that everything is 
fine and continue)
cpu#1 only now do get_page()

Anyway this is minor issue that can be probably solved by just:
rechecking if the pte isnt read_only in gup_fast after we do the get_page()

Anyway sound like a great idea to fix this issue!
good work.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
