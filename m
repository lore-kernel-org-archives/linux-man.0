From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] minor typo fixes in several pages
Date: Wed, 31 Jul 2013 05:34:32 +0900
Message-ID: <CALhU9tkjN=EBf0QBOzOV1exsER_fRxZSVgvh2c869D92NDonoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I found typos in several pages from LDP man-pages 3.52.

_syscall.2
popen.3
tempnam.3
bootparam.7
socket.7

Is it better to split a patch per page?

diff --git a/manual/LDP_man-pages/original/man2/_syscall.2
b/manual/LDP_man-pages/original/man2/_syscall.2
index 9a79108..c29ca55 100644
--- a/manual/LDP_man-pages/original/man2/_syscall.2
+++ b/manual/LDP_man-pages/original/man2/_syscall.2
@@ -105,7 +105,7 @@ System calls are not required to return only
positive or negative error
 codes.
 You need to read the source to be sure how it will return errors.
 Usually, it is the negative of a standard error code,
-for example, i
+for example,
 .RI \- EPERM .
 The _syscall() macros will return the result
 .I r
diff --git a/manual/LDP_man-pages/original/man3/popen.3
b/manual/LDP_man-pages/original/man3/popen.3
index 7d669f4..f7a8afe 100644
--- a/manual/LDP_man-pages/original/man3/popen.3
+++ b/manual/LDP_man-pages/original/man3/popen.3
@@ -141,7 +141,7 @@ function returns \-1 if
 .BR wait4 (2)
 returns an error, or some other error is detected.
 In the event of an error, these functions set
-.I errnro
+.I errno
 to indicate the cause of the error.
 .SH ERRORS
 The
diff --git a/manual/LDP_man-pages/original/man3/tempnam.3
b/manual/LDP_man-pages/original/man3/tempnam.3
index 9b54943..e183257 100644
--- a/manual/LDP_man-pages/original/man3/tempnam.3
+++ b/manual/LDP_man-pages/original/man3/tempnam.3
@@ -85,7 +85,7 @@ is allocated using
 and hence should be freed by
 .BR free (3).
 .SH RETURN VALUE
-On succes, the
+On success, the
 .BR tempnam ()
 function returns a pointer to a unique temporary filename.
 It returns NULL if a unique name cannot be generated, with
diff --git a/manual/LDP_man-pages/original/man7/bootparam.7
b/manual/LDP_man-pages/original/man7/bootparam.7
index ecfd3c5..440fad5 100644
--- a/manual/LDP_man-pages/original/man7/bootparam.7
+++ b/manual/LDP_man-pages/original/man7/bootparam.7
@@ -466,7 +466,7 @@ a "normal" ramdisk, which is mounted read-write as
root device;
 then
 .I /linuxrc
 is executed; afterward the "real" root file system is mounted,
-and the initrd file system is moved over tocw
+and the initrd file system is moved over to
 .IR /initrd ;
 finally
 the usual boot sequence (e.g., invocation of
diff --git a/manual/LDP_man-pages/original/man7/socket.7
b/manual/LDP_man-pages/original/man7/socket.7
index f2213eb..3bf4c55 100644
--- a/manual/LDP_man-pages/original/man7/socket.7
+++ b/manual/LDP_man-pages/original/man7/socket.7
@@ -456,7 +456,7 @@ then the next peek at data queued in the socket
will occur at
 the byte offset specified by the option value.
 At the same time, the "peek offset" will be
 incremented by the number of bytes that were peeked from the queue,
-so that a subsequent peek will return the next data in the queue.i
+so that a subsequent peek will return the next data in the queue.

 If data is removed from the front of the queue via a call to
 .BR recv (2)

-- 
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
