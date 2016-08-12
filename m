From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] pipe.2: mention fcntl and F_GETPIPE_SZ/F_SETPIPE_SZ
Date: Fri, 12 Aug 2016 17:35:11 +0200
Message-ID: <1471016112-18025-1-git-send-email-vegard.nossum@oracle.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 man2/pipe.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git man2/pipe.2 man2/pipe.2
index 88835ca..e817ba9 100644
--- man2/pipe.2
+++ man2/pipe.2
@@ -130,6 +130,14 @@ file status flag on the two new open file descriptions.
 Using this flag saves extra calls to
 .BR fcntl (2)
 to achieve the same result.
+.P
+On Linux, the size of the pipe buffer can be obtained or changed using
+.B F_GETPIPE_SZ
+and
+.B F_SETPIPE_SZ;
+see
+.BR fcntl (2)
+for more information.
 .SH RETURN VALUE
 On success, zero is returned.
 On error, \-1 is returned, and
@@ -244,6 +252,7 @@ main(int argc, char *argv[])
 }
 .fi
 .SH SEE ALSO
+.BR fcntl (2),
 .BR fork (2),
 .BR read (2),
 .BR socketpair (2),
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
