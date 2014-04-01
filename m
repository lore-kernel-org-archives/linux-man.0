From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fenv.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 1 Apr 2014 21:48:45 +0200
Message-ID: <CAKgNAkjQ=LQzWn4N7LOO4SXnKUnSc3Um27hord2CxySApxxZSg@mail.gmail.com>
References: <1396345722-9160-1-git-send-email-penght@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396345722-9160-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael



On Tue, Apr 1, 2014 at 11:48 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The functions feclearexcept(), fegetexceptflag(), feraiseexcept(),
> fesetexceptflag(), fetestexcept(), fegetround(), fesetround(),
> fegetenv(), feholdexcept(), fesetenv(), feupdateenv(),
> feenableexcept(), fedisableexcept() and fegetexcept() are thread
> safe.
>
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fenv.3 | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/man3/fenv.3 b/man3/fenv.3
> index 270f754..1f55ff9 100644
> --- a/man3/fenv.3
> +++ b/man3/fenv.3
> @@ -24,7 +24,7 @@
>  .\" 2000-08-14 added GNU additions from Andreas Jaeger
>  .\" 2000-12-05 some changes inspired by acahalan's remarks
>  .\"
> -.TH FENV 3  2010-10-31 "Linux" "Linux Programmer's Manual"
> +.TH FENV 3  2014-04-01 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  feclearexcept, fegetexceptflag, feraiseexcept, fesetexceptflag,
>  fetestexcept, fegetenv, fegetround, feholdexcept, fesetround,
> @@ -262,6 +262,25 @@ These functions return zero on success and nonzero if an error occurred.
>  .\" of the C99 Standard.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR feclearexcept (),
> +.BR fegetexceptflag (),
> +.BR fegetexceptflag (),
> +.BR fesetexceptflag (),
> +.BR fetestexcept (),
> +.BR fegetround (),
> +.BR fesetround (),
> +.BR fegetenv (),
> +.BR feholdexcept (),
> +.BR fesetenv (),
> +.BR feupdateenv (),
> +.BR feenableexcept (),
> +.BR fedisableexcept (),
> +and
> +.BR fegetexcept ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  IEC 60559 (IEC 559:1989), ANSI/IEEE 854, C99, POSIX.1-2001.
>  .SH NOTES
> --
> 1.9.0
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
