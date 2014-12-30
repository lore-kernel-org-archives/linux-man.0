From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v3] adjtimex.2: add explanation on ADJ_TAI mode
Date: Tue, 30 Dec 2014 13:54:32 +0100
Message-ID: <54A2A088.3030602@gmail.com>
References: <547AEE19.4040901@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547AEE19.4040901-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On 11/30/2014 11:14 AM, Laurent Georget wrote:
> This patch includes the adjtimex mode ADJ_TAI, intended to update the
> TAI offset. 

Thanks. Applied, with a few rewordings (which you can find in Git).
One point/question below.

> There are other FIXMEs in the man page and it's a bit
> outdated. I'll be on it once those first patches are accepted (to be
> sure to do the right thing).

I would be happy to get more such patches.

> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index 0b919c5..396b8cc 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -24,9 +24,7 @@
>  .\" Modified 1997-01-31 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
>  .\" Modified 1997-07-30 by Paul Slootman <paul-pqePwCal/LhZiXb3D+6dPA@public.gmane.org>
>  .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> -.\"
> -.\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
> -.\"		commit 153b5d054ac2d98ea0d86504884326b6777f683d
> +.\" Modified 2014-11-30 by Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
>  .\"
>  .\" FIXME Document ADJ_MICRO and ADJ_NANO (added in Linux 2.6.26)
>  .\"		commit eea83d896e318bda54be2d2770d2c5d6668d11db
> @@ -101,6 +99,7 @@ combination of zero or more of the following bits:
>  #define ADJ_ESTERROR          0x0008 /* estimated time error */
>  #define ADJ_STATUS            0x0010 /* clock status */
>  #define ADJ_TIMECONST         0x0020 /* pll time constant */
> +#define ADJ_TAI               0x0080 /* TAI offset */
>  #define ADJ_TICK              0x4000 /* tick value */
>  #define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime() */
>  .fi
> @@ -110,6 +109,24 @@ Ordinary users are restricted to a zero value for
>  .IR modes .
>  Only the superuser may set any parameters.
>  .br
> +In the case of
> +.BR ADJ_TAI ,
> +as
> +.I buf->tai
> +is read-only, the new value is passed through
> +.IR buf->constant ,
> +therefore
> +.B ADJ_TIMECONST
> +and
> +.B ADJ_TAI
> +should probably not be used at the same time.

"should probably not" seems a little weak to me. Surely it is rather the
case that they *must not* be used at the same time. I changed it to "must not".

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
