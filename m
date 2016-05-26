From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lirc.4: Update after upstreamed lirc.h + updated kernel
 docs.
Date: Thu, 26 May 2016 16:24:05 -0500
Message-ID: <3e4d7b59-a798-0d95-5dc9-6ed8414b437c@gmail.com>
References: <42d49eaf-7f4e-68f3-420e-e5c294488647@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <42d49eaf-7f4e-68f3-420e-e5c294488647-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2016 05:49 AM, Alec Leamas wrote:
> 
> 0001-lirc.4-Update-after-upstreamed-lirc.h-bugfixes.patch

Thanks, Alec! Applied.

Cheers,

Michael


>>From 1d2278cf244a47ed3b8108be319945050a7b9601 Mon Sep 17 00:00:00 2001
> From: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Fri, 20 May 2016 12:28:15 +0200
> Subject: [PATCH] lirc.4: Update after upstreamed lirc.h, bugfixes.
> 
> The lirc.h header has landed in the kernel, and the kernel docs
> has been updated all of which reflected in this patch.
> 
> Here is still an open issue with duplicated info in the kernel
> docs and the manpage. Eventually, this should be addressed but
> I frankly don't know how. In the meantime, acknowledge the fact
> that the kernel docs is the ultimate source
> ---
>  man4/lirc.4 | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/man4/lirc.4 b/man4/lirc.4
> index 78e96412..053c134 100644
> --- a/man4/lirc.4
> +++ b/man4/lirc.4
> @@ -1,4 +1,4 @@
> -.\" Copyright (c) 2015, Alec Leamas
> +.\" Copyright (c) 2015-2016, Alec Leamas
>  .\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>  .\" This is free documentation; you can redistribute it and/or
> @@ -20,7 +20,7 @@
>  .\" License along with this manual; if not, see
>  .\" <http://www.gnu.org/licenses/>.
>  .\" %%%LICENSE_END
> -.TH LIRC 4 "2016-03-17" "Linux" "Linux Programmer's Manual"
> +.TH LIRC 4 "2016-05-20" "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  lirc \- lirc devices
>  .SH DESCRIPTION
> @@ -111,7 +111,18 @@ If more data is provided than the hardware can send, the
>  call fails with the error
>  .BR EINVAL
>  .\"
> -.SH SUPPORTED IOCTL COMMANDS
> +.SH IOCTL COMMANDS
> +.P
> +The complete list of ioctl commands is maintained in the kernel
> +documentation, see SEE ALSO.
> +The ioctl commands presented here is a subset  of the kernel
> +docs.
> +.P
> +The LIRC device's ioctl definition is bound by the ioctl function
> +definition of struct file_operations, leaving us with an unsigned
> +int for the ioctl command and an unsigned long for the arg.
> +For the purposes of ioctl portability across 32-bit and 64-bit,
> +these values are capped to their 32-bit sizes.
>  .P
>  .nf
>  #include <lirc/include/media/lirc.h>    /* But see BUGS */
> @@ -140,6 +151,8 @@ Returns a bit mask of combined features bits; see FEATURES.
>  Some drivers have dynamic features which are not updated until after an
>  .I init()
>  command.
> +If a driver does not announce support of certain features, calling of
> +the corresponding ioctls is undefined.
>  .TP
>  .BR LIRC_GET_REC_MODE
>  Return the receive mode, which will be one of:
> @@ -191,10 +204,16 @@ Currently serves no purpose since only
>  .BR LIRC_MODE_PULSE
>  is supported.
>  .TP
> +.BR LIRC_GET_SEND_CARRIER " (\fIvoid\fP)"
> +Get the modulation frequency (Hz).
> +.TP
>  .BR LIRC_SET_SEND_CARRIER " (\fIint\fP)"
>  Set the modulation frequency.
>  The argument is the frequency (Hz).
>  .TP
> +.BR LIRC_GET_SEND_CARRIER " (\fIvoid\fP)"
> +Get the modulation frequency used when decoding (Hz).
> +.TP
>  .BR SET_SEND_DUTY_CYCLE " (\fIint\fP)"
>  Set the carrier duty cycle.
>  .I val
> @@ -202,6 +221,7 @@ is a number in the range [0,100] which
>  describes the pulse width as a percentage of the total cycle.
>  Currently, no special meaning is defined for 0 or 100, but the values
>  are reserved for future use.
> +
>  .TP
>  .BR LIRC_GET_MIN_TIMEOUT " (\fIvoid\fP)", " "\
>  LIRC_GET_MAX_TIMEOUT " (\fIvoid\fP)"
> @@ -444,9 +464,8 @@ sending.)
>  .SH BUGS
>  Using these devices requires the kernel source header file
>  .IR lirc.h .
> -This file is not (yet) publicly exported by kernel headers.
> -.\" FIXME . https://bugzilla.kernel.org/show_bug.cgi?id=3D75751.
> -For the time being, the file is bundled in the lirc package; see
> +This file is not available before kernel release 4.6. Users of older
> +kernels could use the file bundled in
>  .UR http://www.lirc.org
>  .UE .
>  .\"
> -- 2.5.5
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
