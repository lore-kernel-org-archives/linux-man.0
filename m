From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: log*.3: add cross-references to other-base logarithmic functions
Date: Sun, 13 Jun 2010 07:45:55 +0200
Message-ID: <AANLkTikCKxl_DxNKqc_fC9WWZRXpuaK_yv6Ow3Pf2gsC@mail.gmail.com>
References: <alpine.LSU.2.00.0910161248010.6221@obet.zrqbmnf.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.0910161248010.6221-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jan,

On Fri, Oct 16, 2009 at 12:48 PM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> w=
rote:
>
> parent 576b0bccd1d120880c5d3bbf252c8ac66245103a ()
> commit c351c2b325fd365da02e8437053fc2d2b5e7d69a
> Author: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
> Date: =A0 Fri Oct 16 12:47:56 2009 +0200
>
> log*.3: add cross-references to other-base logarithmic functions

Applied for man-pages-3.25.

Thanks,

Michael

> Signed-off-by: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
> ---
> =A0man3/log.3 =A0 | =A0 =A02 ++
> =A0man3/log10.3 | =A0 =A02 ++
> =A0man3/log2.3 =A0| =A0 =A02 ++
> =A03 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/man3/log.3 b/man3/log.3
> index d0426c2..8a41306 100644
> --- a/man3/log.3
> +++ b/man3/log.3
> @@ -133,5 +133,7 @@ exception.
> =A0.SH "SEE ALSO"
> =A0.BR cbrt (3),
> =A0.BR clog (3),
> +\fBlog2\fP(3),
> +\fBlog10\fP(3),
> =A0.BR log1p (3),
> =A0.BR sqrt (3)
> diff --git a/man3/log10.3 b/man3/log10.3
> index 5528d94..a6dcca3 100644
> --- a/man3/log10.3
> +++ b/man3/log10.3
> @@ -88,4 +88,6 @@ SVr4, 4.3BSD, C89.
> =A0.BR cbrt (3),
> =A0.BR clog10 (3),
> =A0.BR exp10 (3),
> +\fBlog\fP(3),
> +\fBlog2\fP(3),
> =A0.BR sqrt (3)
> diff --git a/man3/log2.3 b/man3/log2.3
> index 6a86b9a..8e10fed 100644
> --- a/man3/log2.3
> +++ b/man3/log2.3
> @@ -90,4 +90,6 @@ SVr4, 4.3BSD, C89.
> =A0.SH "SEE ALSO"
> =A0.BR cbrt (3),
> =A0.BR clog2 (3),
> +\fBlog\fP(3),
> +\fBlog10\fP(3),
> =A0.BR sqrt (3)
> --
> # Created with git-export-patch
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
