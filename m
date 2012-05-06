From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], console_codes(4): One table too wide for the line length
Date: Mon, 7 May 2012 09:17:05 +1200
Message-ID: <CAKgNAkgcjLhbUMnxz=j-jAULW4e5BbOOh=pgdMuy-HwU9hyJDg@mail.gmail.com>
References: <20120506195751.GA968@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506195751.GA968-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Mon, May 7, 2012 at 7:57 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
>
> warning: around line 182: table wider than line width
>
> =A0Default length of line in GNU man is 78.
>
> =A0Split longest (last) line into two (or use text block). =A0Reduce
> four "l" to three.

See below.

> --- console_codes.4 =A0 =A0 2012-04-26 22:58:39.000000000 +0000
> +++ console_codes.4.new 2012-05-06 00:54:29.000000000 +0000
> @@ -175,7 +175,7 @@
> =A0.PP
> =A0The action of a CSI sequence is determined by its final character.
> =A0.TS
> -l l l l.
> +l l l.

I made that change.

> =A0@ =A0 =A0 =A0ICH =A0 =A0 Insert the indicated # of blank character=
s.
> =A0A =A0 =A0 =A0CUU =A0 =A0 Move cursor up the indicated # of rows.
> =A0B =A0 =A0 =A0CUD =A0 =A0 Move cursor down the indicated # of rows.
> @@ -203,7 +203,8 @@
> =A0d =A0 =A0 =A0VPA =A0 =A0 Move cursor to the indicated row, current=
 column.
> =A0e =A0 =A0 =A0VPR =A0 =A0 Move cursor down the indicated # of rows.
> =A0f =A0 =A0 =A0HVP =A0 =A0 Move cursor to the indicated row, column.
> -g =A0 =A0 =A0TBC =A0 =A0 Without parameter: clear tab stop at the cu=
rrent position.
> +g =A0 =A0 =A0TBC =A0 =A0 Without parameter: clear tab stop at the cu=
rrent
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 position.

Here, I instead changed "the current" to "current" (and also at two
other places in the table). (It's an acceptable English usage to omit
articles where space is tight.)

Cheers,

Michael


> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ESC [ 3 g: delete all tab stops.
> =A0h =A0 =A0 =A0SM =A0 =A0 =A0Set Mode (see below).
> =A0l =A0 =A0 =A0RM =A0 =A0 =A0Reset Mode (see below).
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
