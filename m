From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] popen.3: RETURN VALUE: describe successful case
Date: Thu, 28 Apr 2016 16:54:29 +0200
Message-ID: <1461855269.3095.1.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Reference:
http://pubs.opengroup.org/onlinepubs/9699919799/functions/popen.html
http://pubs.opengroup.org/onlinepubs/9699919799/functions/pclose.html

Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man3/popen.3 | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/man3/popen.3 b/man3/popen.3
index f075581..bafa42c 100644
--- a/man3/popen.3
+++ b/man3/popen.3
@@ -123,17 +123,18 @@ function waits for the associated process to term=
inate and returns the exit
 status of the command as returned by
 .BR wait4 (2).
 .SH RETURN VALUE
-The
-.BR popen ()
-function returns NULL if the
+.BR popen ():
+on success, returns a pointer to an open stream that
+can be used to read or write to the pipe;
+if the
 .BR fork (2)
 or
 .BR pipe (2)
-calls fail, or if it cannot allocate memory.
-.PP
-The
-.BR pclose ()
-function returns \-1 if
+calls fail, or if the function cannot allocate memory,
+NULL is returned.
+
+.BR pclose ():
+on success, returns the exit status of the command; if
 .\" These conditions actually give undefined results, so I commented
 .\" them out.
 .\" .I stream
@@ -141,10 +142,12 @@ function returns \-1 if
 .\".I stream
 .\" already "pclose()d", or if
 .BR wait4 (2)
-returns an error, or some other error is detected.
-In the event of an error, these functions set
+returns an error, or some other error is detected,
+\-1 is returned.
+.PP
+Both functions set
 .I errno
-to indicate the cause of the error.
+to an appropriate value in the case of an error.
 .SH ERRORS
 The
 .BR popen ()
--=20
2.4.11


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
