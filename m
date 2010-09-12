From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rand.3: Clarify the lowest and highest return values
Date: Sun, 12 Sep 2010 16:29:35 +0200
Message-ID: <AANLkTimEoUtCYkqK_oTq-W6ExSv5-yoHh9zLee1tMwqK@mail.gmail.com>
References: <1284298208-3861-1-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1284298208-3861-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Sun, Sep 12, 2010 at 3:30 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> Commit 7155eb9 gives the range of return values, but the definition
> of 'range' is unclear. Indicate clearly that RAND_MAX is included in
> the set of possible return values.
>
> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man3/rand.3 | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/man3/rand.3 b/man3/rand.3
> index e65e69e..d1e14d8 100644
> --- a/man3/rand.3
> +++ b/man3/rand.3
> @@ -35,7 +35,7 @@
> =A0.\" =A0 =A0 =A0 =A0 =A0with contribution from Francesco Potorti <F=
=2EPotorti-Z3/l7hFotWqRIi+8W+d3eg@public.gmane.org>
> =A0.\" Modified 2003-11-15, aeb, added rand_r
> =A0.\"
> -.TH RAND 3 2008-08-29 "" "Linux Programmer's Manual"
> +.TH RAND 3 2010-09-12 "" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0rand, rand_r, srand \- pseudo-random number generator
> =A0.SH SYNOPSIS
> @@ -59,8 +59,8 @@ _POSIX_C_SOURCE\ >=3D\ 1 || _XOPEN_SOURCE || _POSIX=
_SOURCE
> =A0.SH DESCRIPTION
> =A0The
> =A0.BR rand ()
> -function returns a pseudo-random integer in
> -the range [0,\ \fBRAND_MAX\fR].
> +function returns a pseudo-random integer between 0
> +and \fBRAND_MAX\fR (inclusive).
> =A0.PP
> =A0The
> =A0.BR srand ()
> --
> 1.7.1

The "[x..y]" notation in mathematics is used to express an inclusive
range, so I don't want to eliminate that notation. But I agree that
not everyone may be aware of this deail. I made the change below.

Thanks,

Michael

diff --git a/man3/rand.3 b/man3/rand.3
index 4587c8b..fdd2b70 100644
--- a/man3/rand.3
+++ b/man3/rand.3
@@ -60,7 +60,9 @@ _POSIX_C_SOURCE\ >=3D\ 1 || _XOPEN_SOURCE || _POSIX_S=
OURCE
 The
 .BR rand ()
 function returns a pseudo-random integer in
-the range [0,\ \fBRAND_MAX\fR].
+the range 0 to
+.BR RAND_MAX
+inclusive (i.e., the mathematical range [0,\ \fBRAND_MAX\fR]).
 .PP
 The
 .BR srand ()



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
