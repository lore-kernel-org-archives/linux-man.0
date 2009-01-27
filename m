From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Improve capget manpage
Date: Tue, 27 Jan 2009 01:44:35 +0100
Message-ID: <cfd18e0f0901261644w1b6291d9m49c19c9962844c40@mail.gmail.com>
References: <20090126202942.GA8753@basil.nowhere.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090126202942.GA8753-3rXA9MLqAseW/qJFnhkgxti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: morgan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Mon, Jan 26, 2009 at 9:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>
> While writing a little program using capset
> I found the capset manpage quite light on crucial
> details and I had to resort to RTFS.

Yes, I've always thought that page was a little thin, but had never
got to checking the details.

> This patch improves the points I found unclear
> and also moves one misplaced paragraph around.

Thanks.  I applied this for man-pages-3.18.

Cheers,

Michael

> --- man2/capget.2-o     2009-01-26 21:19:13.000000000 +0100
> +++ man2/capget.2       2009-01-26 21:26:24.000000000 +0100
> @@ -6,6 +6,7 @@
>  .\" Modified 2008-04-28, morgan of kernel.org
>  .\"     Update in line with addition of file capabilities and
>  .\"     64-bit capability sets in kernel 2.6.2[45].
> +.\" Modified 2009-01-26, andi kleen
>  .\"
>  .TH CAPGET 2 2008-07-14 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -36,7 +37,8 @@
>  but the kernel API is likely to change and use of
>  these functions (in particular the format of the
>  .I cap_user_*_t
> -types) is subject to change with each kernel revision.
> +types) is subject to extension with each kernel revision,
> +but old programs will keep working.
>  .sp
>  The portable interfaces are
>  .BR cap_set_proc (3)
> @@ -73,19 +75,19 @@
>  .fi
>  .in -4n
>  .sp
> -The calls will fail with the error
> -.BR EINVAL ,
> -and set the
> -.I version
> -field of
> -.I hdrp
> -to the kernel preferred value of
> -.B _LINUX_CAPABILITY_VERSION_?
> -when an unsupported
> -.I version
> -value is specified.
> -In this way, one can probe what the current
> -preferred capability revision is.
> +.I effective, permitted, inheritable
> +are bitmasks of the capabilities defined in
> +.I capability(7).
> +Note the
> +.I CAP_*
> +defines are bit indexes and need to be shifted up before oring into
> +the bitfields.
> +To define the structures for passing to the syscall you have to use the
> +.I struct __user_cap_header_struct
> +and
> +.I struct __user_cap_data_struct
> +names because the typedefs are only pointers.
> +
>  Kernels prior to 2.6.25 prefer
>  32-bit capabilities with version
>  .BR _LINUX_CAPABILITY_VERSION_1 ,
> @@ -154,6 +156,20 @@
>  On error, \-1 is returned, and
>  .I errno
>  is set appropriately.
> +
> +The calls will fail with the error
> +.BR EINVAL ,
> +and set the
> +.I version
> +field of
> +.I hdrp
> +to the kernel preferred value of
> +.B _LINUX_CAPABILITY_VERSION_?
> +when an unsupported
> +.I version
> +value is specified.
> +In this way, one can probe what the current
> +preferred capability revision is.
>  .SH ERRORS
>  .TP
>  .B EFAULT
>
> --
> ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
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
