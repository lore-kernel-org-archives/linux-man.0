From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: lockf - EBADF also if fd is open for reading
Date: Wed, 14 Sep 2011 08:57:19 +0200
Message-ID: <CAKgNAkhxkA3igju8_h633-S87Mx=4cncGYgM+n-oc2qiCCfEEg@mail.gmail.com>
References: <AANLkTimcFNgz1Bv1H1Q1JJAUZE3c+0O5zTWzNZL2kbFG@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimcFNgz1Bv1H1Q1JJAUZE3c+0O5zTWzNZL2kbFG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikel Ward <mikel-pSK+WyAkGS32eFz/2MeuCQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mikel,

On Wed, Mar 9, 2011 at 11:43 AM, Mikel Ward <mikel-pSK+WyAkGS32eFz/2MeuCQ@public.gmane.org> wrote=
:
> Hi
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/lockf.3.html
> says:
>
> =A0 =A0 =A0 EBADF =A0fd is not an open file descriptor.
>
> However it can also happen if the file descriptor is open, but not fo=
r writing.
>
> The POSIX docs say this
> http://pubs.opengroup.org/onlinepubs/009695399/functions/lockf.html
>
> and a simple test program confirms it is the case.

Yes, thanks for the report! For man-pages-3.33, I applied the patch bel=
ow.

Cheers,

Michael

--- a/man3/lockf.3
+++ b/man3/lockf.3
@@ -19,7 +19,7 @@
 .\" Added section stuff, aeb, 2002-04-22.
 .\" Corrected include file, drepper, 2003-06-15.
 .\"
-.TH LOCKF 3 2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH LOCKF 3 2011-09-11 "GNU" "Linux Programmer's Manual"
 .SH NAME
 lockf \- apply, test or remove a POSIX lock on an open file
 .SH SYNOPSIS
@@ -124,7 +124,15 @@ been memory-mapped by another process.
 .TP
 .B EBADF
 .I fd
-is not an open file descriptor.
+is not an open file descriptor; or
+.I cmd
+is
+.B F_LOCK
+or
+.BR F_TLOCK
+and
+.I fd
+is not a writable file descriptor.
 .TP
 .B EDEADLK
 The command was


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
