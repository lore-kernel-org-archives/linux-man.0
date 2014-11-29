From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 1/2] adjtimex.2: remove nonexisting reference to adjtimex(8)
Date: Sat, 29 Nov 2014 10:17:48 +0100
Message-ID: <CAKgNAkhVxy9J4dQCGwEBNwWFj_vwj=xN0JNtBx=sECgP-GiusA@mail.gmail.com>
References: <54788059.6020209@supelec.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54788059.6020209-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On Fri, Nov 28, 2014 at 3:02 PM, Laurent Georget
<laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org> wrote:
> Hello,
>
> This is a patch I sent to mtk.manpages-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org It didn't make its way
> to this mailing-list the first time. It's a trivial fix for an undefined
> reference to adjtimex(8). Patch you received before (adjtimex.2: add
> explanation about ADJ_TAI action) is patch 2/2 for adjtimex.2.

This does not seem correct to me. Certainly on my Fedora system, there
is an "adjtimex" package that installs adjtimex(8) page. So, this
reference seems okay to me. Did I miss something?

Thanks,

Michael


> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index eb3fda1..20a2f0b 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -24,6 +24,7 @@
>  .\" Modified 1997-01-31 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
>  .\" Modified 1997-07-30 by Paul Slootman <paul-pqePwCal/LhZiXb3D+6dPA@public.gmane.org>
>  .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +.\" Modified 2014-11-28 by Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
>  .\"
>  .\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
>  .\"            commit 153b5d054ac2d98ea0d86504884326b6777f683d
> @@ -163,5 +164,4 @@ method of adjusting the system clock.
>  .BR settimeofday (2),
>  .BR adjtime (3),
>  .BR capabilities (7),
> -.BR time (7),
> -.BR adjtimex (8)
> +.BR time (7)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
