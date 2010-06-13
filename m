From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] * openpty.3: Use const as appropriate
Date: Sun, 13 Jun 2010 06:52:44 +0200
Message-ID: <AANLkTimh2bnpxp9R2981Jw0xb27kYQSHsA8FuMPX4ilg@mail.gmail.com>
References: <1265403930-5005-1-git-send-email-ebb9@byu.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1265403930-5005-1-git-send-email-ebb9-PGZyUNKar/Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eric,

On Fri, Feb 5, 2010 at 11:05 PM, Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org> wrote:
> Signed-off-by: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
> ---
> Make the openpty/forkpty man page match /usr/include/pty.h as
> included in glibc 2.11.1.

Thanks. Applied for man-pages-3.25, along with some added text that
"const" was added in glibc 2.8.

Thanks

Michael


> =A0man3/openpty.3 | =A0 10 ++++++----
> =A01 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/man3/openpty.3 b/man3/openpty.3
> index e033af0..a36352b 100644
> --- a/man3/openpty.3
> +++ b/man3/openpty.3
> @@ -29,7 +29,7 @@
> =A0.\"
> =A0.\" Added -lutil remark, 030718
> =A0.\"
> -.TH OPENPTY 3 =A02003-07-18 "GNU" "Linux Programmer's Manual"
> +.TH OPENPTY 3 =A02010-02-05 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0openpty, login_tty, forkpty \- tty utility functions
> =A0.SH SYNOPSIS
> @@ -37,10 +37,12 @@ openpty, login_tty, forkpty \- tty utility functi=
ons
> =A0.B #include <pty.h>
> =A0.sp
> =A0.BI "int openpty(int *" amaster ", int *" aslave ", char *" name ,
> -.BI " =A0 =A0 =A0 =A0 =A0 =A0struct termios *" termp ", struct winsi=
ze *" winp );
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0const struct termios *" termp ,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0const struct winsize *" winp );
> =A0.sp
> -.BI "pid_t forkpty(int *" amaster ", char *" name ", struct termios =
*" termp ,
> -.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0struct winsize *" winp );
> +.BI "pid_t forkpty(int *" amaster ", char *" name ,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct termios *" termp ,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct winsize *" winp );
> =A0.sp
> =A0.B #include <utmp.h>
> =A0.sp
> --
> 1.6.6
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
