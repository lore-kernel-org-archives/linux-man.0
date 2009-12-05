From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] getline(3) was added to POSIX 2008
Date: Sat, 5 Dec 2009 16:01:29 +0100
Message-ID: <cfd18e0f0912050701x6c95d564q8de6a3bc1df8bc72@mail.gmail.com>
References: <1257370830-12899-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1257370830-12899-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike, Andi

On Wed, Nov 4, 2009 at 10:40 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man3/getline.3 | =A0 =A04 +---
> =A01 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/man3/getline.3 b/man3/getline.3
> index 2687809..622b5c8 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -26,7 +26,6 @@
> =A0getline, getdelim \- delimited string input
> =A0.SH SYNOPSIS
> =A0.nf
> -.B #define _GNU_SOURCE
> =A0.B #include <stdio.h>
> =A0.sp
> =A0.BI "ssize_t getline(char **" lineptr ", size_t *" n ", FILE *" st=
ream );
> @@ -113,11 +112,10 @@ Both
> =A0.BR getline ()
> =A0and
> =A0.BR getdelim ()
> -are GNU extensions.
> +were added in POSIX.1-2008.
> =A0They are available since libc 4.6.27.
> =A0.SH "EXAMPLE"
> =A0.nf
> -#define _GNU_SOURCE
> =A0#include <stdio.h>
> =A0#include <stdlib.h>

As pointed out in the follow-ups, this wouldn't be sufficient. I
applied the following for 2.34. Okay?

Cheers,

Michael

--- a/man3/getline.3
+++ b/man3/getline.3
@@ -21,12 +21,11 @@
 .\" Formatted or processed versions of this manual, if unaccompanied b=
y
 .\" the source, must acknowledge the copyright and authors of this wor=
k.
 .\" License.
-.TH GETLINE 3  2006-05-17 "GNU" "Linux Programmer's Manual"
+.TH GETLINE 3  2009-12-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getline, getdelim \- delimited string input
 .SH SYNOPSIS
 .nf
-.B #define _GNU_SOURCE
 .B #include <stdio.h>
 .sp
 .BI "ssize_t getline(char **" lineptr ", size_t *" n ", FILE *" stream=
 );
@@ -34,6 +33,23 @@ getline, getdelim \- delimited string input
 .BI "ssize_t getdelim(char **" lineptr ", size_t *" n ", int " delim \
 ", FILE *" stream );
 .fi
+.sp
+.in -4n
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+
+Before glibc 2.10:
+.br
+.BR getline (),
+.BR getdelim ():
+_GNU_SOURCE
+
+Since glibc 2.10:
+.br
+.BR getline (),
+.BR getdelim ():
+_POSIX_C_SOURCE >=3D 200809 || _XOPEN_SOURCE >=3D 700
 .SH DESCRIPTION
 .BR getline ()
 reads an entire line from \fIstream\fP,
@@ -108,13 +124,15 @@ or
 is NULL, or
 .I stream
 is not valid).
+.SH VERSIONS
+These functions are available since libc 4.6.27.
 .SH "CONFORMING TO"
 Both
 .BR getline ()
 and
 .BR getdelim ()
-are GNU extensions.
-They are available since libc 4.6.27.
+were originally GNU extensions.
+They were standardized in POSIX.1-2008.
 .SH "EXAMPLE"
 .nf
 #define _GNU_SOURCE


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
