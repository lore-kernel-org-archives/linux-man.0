From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] document new "e" fopen() flag from glibc-2.7
Date: Mon, 19 Nov 2007 17:17:34 +0100
Message-ID: <4741B71E.30800@gmail.com>
References: <200710232000.20800.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200710232000.20800.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike Frysinger wrote:
> per the subject, patch attached
> -mike

Hi Mike,

Thanks.  Applied for 2.67.

Cheers,

Michael

> ------------------------------------------------------------------------
> 
> --- man3/fopen.3.orig	2007-10-23 19:52:39.000000000 -0400
> +++ man3/fopen.3	2007-10-23 19:56:01.000000000 -0400
> @@ -257,6 +257,13 @@
>  or subsequent read and write operations,
>  thread cancellation points.
>  .TP
> +.BR e " (since glibc 2.7)"
> +Open the file with the
> +.B O_CLOEXEC
> +flag.  See
> +.BR open (2)
> +for more information.
> +.TP
>  .BR m " (since glibc 2.3)"
>  Attempt to access the file using
>  .BR mmap (2),

-- 
Michael Kerrisk
maintainer of Linux man pages Sections 2, 3, 4, 5, and 7

Want to help with man page maintenance?  Grab the latest tarball at
http://www.kernel.org/pub/linux/docs/manpages/
read the HOWTOHELP file and grep the source files for 'FIXME'.

-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
