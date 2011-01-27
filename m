From: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Subject: [PATCH] sendfile.2: Fix description of the out_fd
Date: Thu, 27 Jan 2011 17:48:40 +0900
Message-ID: <4D413168.1080901@rs.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

commit cc56f7de7f00d188c7c4da1e9861581853b9e92f made
sendfile(2) can work with any output file.
Therefore the out_fd of sendfile(2) can refer to any file,
but current manual (man-pages-3.32) has not been changed so far.

Signed-off-by: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
---
 man2/sendfile.2 |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff -Nrup man-pages-3.32-a/man2/sendfile.2 man-pages-3.32-b/man2/sendfile.2
--- man-pages-3.32-a/man2/sendfile.2	2010-12-03 16:01:59.000000000 +0900
+++ man-pages-3.32-b/man2/sendfile.2	2011-01-27 16:03:48.000000000 +0900
@@ -87,15 +87,11 @@ and the file offset will be updated by t
 .I count
 is the number of bytes to copy between the file descriptors.

-Presently (Linux 2.6.9):
-.IR in_fd ,
+.IR in_fd
 must correspond to a file which supports
 .BR mmap (2)-like
 operations
-(i.e., it cannot be a socket);
-and
-.I out_fd
-must refer to a socket.
+(i.e., it cannot be a socket).

 Applications may wish to fall back to
 .BR read (2)/ write (2)
@@ -168,6 +164,9 @@ In Linux 2.4 and earlier,
 could refer to a regular file, and
 .BR sendfile ()
 changed the current offset of that file.
+Since 2.6.33,
+.I out_fd
+can refer to any file.

 The original Linux
 .BR sendfile ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
