From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug in MEMCMP(3)
Date: Thu, 15 Sep 2011 20:39:03 +0200
Message-ID: <CAKgNAkgT1CGf_LKi2zzaMmgLZwYK+u6Gq3Q3wBArmxFwoTGziw@mail.gmail.com>
References: <AcvYceXMJCtkoTDUSvSzf7suX7bq6A==> <89B12D503DAB481D9D703F0F6B85D313@napa.ad.etn.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89B12D503DAB481D9D703F0F6B85D313-/aGxgi9n+pBDoDG+9UpDGw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Unger <sebunger-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sebastian,

On Wed, Mar 2, 2011 at 1:36 AM, Sebastian Unger <sebunger-hi6Y0CQ0nG0@public.gmane.org> wrot=
e:
> Hi there,
>
>
>
> I just used the above man page and noticed that it did not say whethe=
r
> =93bytes=94 are compared signed or unsigned. This may not be specifie=
d, but in
> this case I would expect the man-page to at least say so.
>
>
>
> I=92m using current ubuntu 10.10
>
> Man-pages version 3.24-1ubuntu1

Thanks. For man-pages-3.33, I applied the patch below.

Cheers,

Michael

--- a/man3/memcmp.3
+++ b/man3/memcmp.3
@@ -37,8 +37,9 @@ memcmp \- compare memory areas
 .SH DESCRIPTION
 The
 .BR memcmp ()
-function compares the first \fIn\fP bytes of the
-memory areas \fIs1\fP and \fIs2\fP.
+function compares the first \fIn\fP bytes (each interpreted as
+.IR "unsigned char" )
+of the memory areas \fIs1\fP and \fIs2\fP.
 It returns an integer less than,
 equal to, or greater than zero if \fIs1\fP is found, respectively, to
 be less than, to match, or be greater than \fIs2\fP.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
