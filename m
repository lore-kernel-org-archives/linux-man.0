From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
Date: Wed, 20 Apr 2016 12:31:09 +0100
Message-ID: <5717687D.2060300@gmail.com>
References: <20160418164908.GR5369@vapier.lan>
 <1461045163-21248-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461045163-21248-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hi Mike,

I don't object to the patch, but...

On 04/19/2016 06:52 AM, Mike Frysinger wrote:
> Defining these functions via sys/types.h violates POSIX namespace
> requirements, 

What do the previous lines mean? Violate namespace requirements how?

Cheers,

Michael


> so we want to disentangle it from that header.  Since
> glibc has basically always used this header, update the docs to have
> people include that instead.
>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man3/makedev.3 | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/man3/makedev.3 b/man3/makedev.3
> index f91f4b5..3d26d15 100644
> --- a/man3/makedev.3
> +++ b/man3/makedev.3
> @@ -28,23 +28,13 @@
>  makedev, major, minor \- manage a device number
>  .SH SYNOPSIS
>  .nf
> -.B #include <sys/types.h>
> +.B #include <sys/sysmacros.h>
>  
>  .BI "dev_t makedev(unsigned int " maj ", unsigned int " min );
>  
>  .BI "unsigned int major(dev_t " dev );
>  .BI "unsigned int minor(dev_t " dev );
>  .fi
> -.sp
> -.BR makedev (),
> -.BR major (),
> -.BR minor ():
> -.nf
> -    Since glibc 2.19:
> -        _DEFAULT_SOURCE
> -    In glibc up to and including 2.19:
> -        _BSD_SOURCE
> -.fi
>  .SH DESCRIPTION
>  A device ID consists of two parts:
>  a major ID, identifying the class of the device,
> @@ -90,7 +80,9 @@ and
>  .BR minor ()
>  functions are not specified in POSIX.1,
>  but are present on many other systems.
> -.\" The BSDs, HP-UX, Solaris, AIX, Irix
> +.\" The BSDs, HP-UX, Solaris, AIX, Irix.
> +.\" The header location is inconsistent:
> +.\" Could be sys/mkdev.h, sys/sysmacros.h, or sys/types.h.
>  .SH NOTES
>  These interfaces are defined as macros.
>  Since glibc 2.3.3,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
