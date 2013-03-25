From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] scalb.3: fix prototypes for scalbf and scalbl
Date: Mon, 25 Mar 2013 12:04:08 +0100
Message-ID: <CAKgNAkiRLJLTDDFM2sjWMfHT6s+ZZWaZWMcD68OCmvQeN7n5VQ@mail.gmail.com>
References: <87k3oykbec.fsf@tines.lan>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87k3oykbec.fsf-oEj8245dElT/PtFMR13I2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark H Weaver <mhw-StlzRsPvAncdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Mar 23, 2013 at 5:06 AM, Mark H Weaver <mhw-StlzRsPvAncdnm+yROfE0A@public.gmane.org> wrote:
> The prototypes for scalbf and scalbl given in scalb.3 are incorrect.
> If you have doubts, try compiling the following code:
>
>   #include <math.h>
>   double scalb(double x, double exp);
>   float scalbf(float x, double exp);
>   long double scalbl(long double x, double exp);
>
> To gain confidence that the prototypes below are correct, compile the
> following:
>
>   #include <math.h>
>   double scalb(double x, double exp);
>   float scalbf(float x, float exp);
>   long double scalbl(long double x, long double exp);
>
> Or search for man pages from other sources, e.g.:
>
>   http://www.unix.com/man-page/OpenSolaris/3m/scalbf/
>   http://docs.oracle.com/cd/E26505_01/html/816-5172/scalb-3m.html
>
> The patch below fixes these mistakes.

Thanks Mark. Applied.

Cheers,

Michael


> diff --git a/man3/scalb.3 b/man3/scalb.3
> index 990c0bf..a5b2e5b 100644
> --- a/man3/scalb.3
> +++ b/man3/scalb.3
> @@ -33,9 +33,9 @@ by integral power of radix (OBSOLETE)
>  .sp
>  .BI "double scalb(double " x ", double " exp );
>  .br
> -.BI "float scalbf(float " x ", double " exp );
> +.BI "float scalbf(float " x ", float " exp );
>  .br
> -.BI "long double scalbl(long double " x ", double " exp );
> +.BI "long double scalbl(long double " x ", long double " exp );
>  .sp
>  Link with \fI\-lm\fP.
>  .sp



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
