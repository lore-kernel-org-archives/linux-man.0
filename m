From: "Maxin John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: FW: mlock(2) man page modifications
Date: Thu, 25 Sep 2008 15:17:33 +0530
Message-ID: <9debc4410809250247j1d275ed2qd598837537e3ff64@mail.gmail.com>
References: <9debc4410809240747h5e74e3eft39f4231db0d9cf2c@mail.gmail.com>
	 <20080925145503.3552.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080925145503.3552.KOSAKI.MOTOHIRO-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,

          I am forwarding the comments by Mr.Kosaki to the mailing
list. It was due to a mistake from my side as I have used
man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org for my first mail and later corrected it.

Best regards and thanks for the Comments,

Maxin B. John
Sony India Software Center
Bangalore, India


---------- Forwarded message ----------
From: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Date: Thu, Sep 25, 2008 at 11:34 AM
Subject: Re: mlock(2) man page modifications
To: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


Hi Maxin,

Thank you for your attention.
I think your point and your patch are right.

However, my patch is trivial regression fix, not behavior change.
An older kernel can return EAGAIN at memory stavation.
my patch has following hunk.

> +++ b/mm/mlock.c
> @@ -78,8 +78,6 @@ success:
>
>         mm->locked_vm -= pages;
>  out:
> -       if (ret == -ENOMEM)
> -               ret = -EAGAIN;

In addition, 2.6.11 (oldest code of git repository) has following code.


static int mlock_fixup(struct vm_area_struct * vma,
       unsigned long start, unsigned long end, unsigned int newflags)
{
(snip)
       vma->vm_mm->locked_vm -= pages;
out:
       if (ret == -ENOMEM)
               ret = -EAGAIN;
       return ret;
}


that behavior is linux mlock's behavior for long long time.

Thanks!



> Dear Michael,
>
>     As per the mlock(2) implementation bugfix which is present in
> Linux 2.6.27-rc2 git commit,
> (http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=a477097d9c37c1cf289c7f0257dffcfa42d50197),
> the mlock(2) man page should be modified to reflect the latest changes
> in the kernel.
>
> See the LKML thread regarding this commit :
> http://www.nabble.com/mlock()-return-value-issue-in-kernel-2.6.23.17-td18751601.html
>
> This patch modifies the mlock(2) behaviour as per the SUSv3 specification.
>
> [ENOMEM]
>     Some or all of the address range specified by the addr and
>     len arguments does not correspond to valid mapped pages
>     in the address space of the process.
>
> [EAGAIN]
>     Some or all of the memory identified by the operation could not
>     be locked when the call was made.
>
>
> Patch for the mlock.2 to include information about EAGAIN.
> ==========================================================
>
> diff -uNr man-pages-3.10/man2/mlock.2 man-pages-3.10_mlock/man2/mlock.2
> --- man-pages-3.10/man2/mlock.2 2008-09-23 19:22:25.000000000 +0530
> +++ man-pages-3.10_mlock/man2/mlock.2   2008-09-24 19:38:27.786315672 +0530
> @@ -175,6 +175,10 @@
>  .B ENOMEM
>  Some of the specified address range does not correspond to mapped
>  pages in the address space of the process.
> +.TP
> +.B EAGAIN
> +Some of the memory identified by the operation could not be locked when
> +the function call was made.
>  .LP
>  For
>  .BR mlockall ():
>
> =================================================================
>
> Signed-off-by: Maxin B. John <maxin.john-qujY0cBTTHtBDgjK7y7TUQ@public.gmane.org>
>
> Kindly let me know if there are any issues with respect to this modification.
>
> Thanks and Regards,
>
> Maxin B. John
> Sony India Software Center
> Bangalore, India
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
