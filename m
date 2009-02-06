From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Fri, 6 Feb 2009 19:38:33 +0100
Message-ID: <20090206183833.GU14011@random.random>
References: <20090128213322.GA15789@kroah.com> <20090129141338.34e44a1f.kamezawa.hiroyu@jp.fujitsu.com> <20090129160826.701E.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090130061714.GC31209@kroah.com> <20090202220856.GY20323@random.random> <20090204234153.GA32244@kroah.com> <20090206175414.GQ14011@random.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090206175414.GQ14011-ulAA2RpUuRJvbPj5LQlJ3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nick Piggin <npiggin-l3A5Bk7waGM@public.gmane.org>, Izik Eidus <ieidus-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hugh Dickins <hugh-DTz5qymZ9yRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Feb 06, 2009 at 06:54:14PM +0100, Andrea Arcangeli wrote:
> +	if (is_cow_mapping(vm_flags)) {
> +		if (pte_write(pte)) {
> +			ptep_set_wrprotect(src_mm, addr, src_pte);
> +			pte = pte_wrprotect(pte);
> +		}

While working on the mainline version that will definitely require a
tlb flush here if forcecow/PageGUP is set, I just realized to provide
an atomic per-page copy in the fork_pre_cow an explicit tlb flush is
needed in the pre-gup-fast version too.

	if (is_cow_mapping(vm_flags)) {
		if (pte_write(pte)) {
			ptep_set_wrprotect(src_mm, addr, src_pte);
			pte = pte_wrprotect(pte);
			if (forcecow)
				flush_tlb_page(src_vma, addr);
		}
	}

However to flush the 'src_mm' I feel I can't pass the 'dst_vma' that
fork is passing to copy_page_range. OTOH the dst_vma is needed to be
passed to the fork_pre_cow which is why fork.c was changed in the
patch to pass dst_vma instead of src_vma.

So I think I want to avoid all further confusion if the 'vma' belongs
to the src_mm or the dst_mm by passing both src_vma, and dst_vma from
fork to copy_page_tables. In the pre-gup-fast version the tlb flush is
mostly a nitpick and it would never lead to any practical issue, but
for mostly theoretical reasons it may be good idea to have the
per-page atomic copy there too, comments?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
