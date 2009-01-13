From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Wed, 14 Jan 2009 12:14:20 +1300
Message-ID: <cfd18e0f0901131514i2f7be7f1t2c6275c26dbb6874@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
	 <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>
	 <20090113224941.36F19FC3DD@magilla.sf.frob.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090113224941.36F19FC3DD-nL1rrgvulkc2UH6IwYuUx0EOCMrvLtNR@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 14, 2009 at 11:49 AM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> It's always been invalid to call waitid() with a NULL pointer.  It was an
> oversight that it was allowed (and acts like a wait4() call instead).
>
> Signed-off-by: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Modulo the observation that this change will break any Linux-specific
application that violate POSIX.1's requirement that infop not be NULL
(*), and rely on the existing Linux behavior for
waitd(idtype,id,NULL,options):

Acked-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

(*) It seems unlikely that such applications exist, and we really
should make this change for POSIX.1 conformance.

> ---
>  kernel/exit.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/kernel/exit.c b/kernel/exit.c
> index c7740fa..fa25790 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -1760,6 +1760,8 @@ asmlinkage long sys_waitid(int which, pid_t upid,
>        enum pid_type type;
>        long ret;
>
> +       if (unlikely(!infop))
> +               return -EFAULT;
>        if (options & ~(WNOHANG|WNOWAIT|WEXITED|WSTOPPED|WCONTINUED))
>                return -EINVAL;
>        if (!(options & (WEXITED|WSTOPPED|WCONTINUED)))
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
