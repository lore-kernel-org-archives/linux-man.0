From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: mlock(2) man page modifications
Date: Thu, 25 Sep 2008 11:16:01 +0200
Message-ID: <cfd18e0f0809250216o7a12899du5e62a1ca049439cb@mail.gmail.com>
References: <9debc4410809240747h5e74e3eft39f4231db0d9cf2c@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9debc4410809240747h5e74e3eft39f4231db0d9cf2c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Maxin, Kosaki,

>    As per the mlock(2) implementation bugfix which is present in
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
>    Some or all of the address range specified by the addr and
>    len arguments does not correspond to valid mapped pages
>    in the address space of the process.
>
> [EAGAIN]
>    Some or all of the memory identified by the operation could not
>    be locked when the call was made.

Thanks for your patch!  (Kosaki, thanks for your additional comments.)

A few pointers for future patches:

* Your subject line was good, but could have been even more
descriptive.  I changed the patch title to: mlock.2: Add EAGAIN error.

* It's best to make the patch the very last piece of the message: put
the Signed-off-by and other text above the patch.  This makes the mail
easier for me to read, and to process in git.

I've applied your patch for 3.11.

Cheers,

Michael

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
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
