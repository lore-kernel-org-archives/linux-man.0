From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND][PATCH] sendfile.2: Fix description of the out_fd
Date: Sun, 11 Sep 2011 18:00:40 +0200
Message-ID: <CAKgNAkiSkgjEKDwk6R6RPhGDfJayXZGnxrfRVFcQ9t7K_S3eZQ@mail.gmail.com>
References: <4D771705.1020408@rs.jp.nec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D771705.1020408-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akira,

2011/3/9 Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>:
> commit cc56f7de7f00d188c7c4da1e9861581853b9e92f made
> sendfile(2) can work with any output file.
> Therefore the out_fd of sendfile(2) can refer to any file,
> but current manual (man-pages-3.32) has not been changed so far.

Thank you for this report! Some notes below.

> Signed-off-by: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
> ---
> =A0sendfile.2 | =A0 16 +++++++++-------
> =A01 file changed, 9 insertions(+), 7 deletions(-)
> --- man-pages-3.32-a/man2/sendfile.2 =A0 =A02010-12-03 16:01:59.00000=
0000 +0900
> +++ man-pages-3.32-b/man2/sendfile.2 =A0 =A02011-03-09 10:34:53.00000=
0000 +0900
> @@ -87,15 +87,17 @@ and the file offset will be updated by t
> =A0.I count
> =A0is the number of bytes to copy between the file descriptors.
>
> -Presently (Linux 2.6.9):
> -.IR in_fd ,
> +.IR in_fd
> =A0must correspond to a file which supports
> =A0.BR mmap (2)-like
> =A0operations
> -(i.e., it cannot be a socket);

You removed that piece, but I believe nothing changed for 'in_fd', so
I kept that piece.

> -and
> -.I out_fd
> -must refer to a socket.
> +(i.e., it cannot be a socket).
> +
> +.IR out_fd
> +was required to be a socket, but since Linux 2.6.33 it can be
> +any file. If it is a regular file, then
> +.BR sendfile()
> +changes its offset appropriately.
>
> =A0Applications may wish to fall back to
> =A0.BR read (2)/ write (2)
> @@ -165,7 +167,7 @@ to minimize the number of packets and to
>
> =A0In Linux 2.4 and earlier,
> =A0.I out_fd
> -could refer to a regular file, and
> +could also refer to a regular file, and
> =A0.BR sendfile ()
> =A0changed the current offset of that file.

=46or 3.33 I applied a slightly modified version of you patch; see belo=
w.

Cheers,

Michael

--- a/man2/sendfile.2
+++ b/man2/sendfile.2
@@ -92,10 +92,14 @@ The
 argument must correspond to a file which supports
 .BR mmap (2)-like
 operations
-(i.e., it cannot be a socket);
-and
+(i.e., it cannot be a socket).
+In Linux kernels before 2.6.33,
 .I out_fd
 must refer to a socket.
+Since Linux 2.6.33 it can be any file.
+If it is a regular file, then
+.BR sendfile()
+changes the file offset offset appropriately.

 Applications may wish to fall back to
 .BR read (2)/ write (2)
@@ -165,7 +169,7 @@ to minimize the number of packets and to tune perfo=
rmance.

 In Linux 2.4 and earlier,
 .I out_fd
-could refer to a regular file, and
+could also refer to a regular file, and
 .BR sendfile ()
 changed the current offset of that file.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
