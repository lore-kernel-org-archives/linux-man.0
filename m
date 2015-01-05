From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: statfs.2: format fix
Date: Mon, 5 Jan 2015 09:33:47 +0900
Message-ID: <CALhU9tndNX-vuBtL+u0R35_DZwwgxzwzUAqh5KsPYD2YOrPOvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/statfs.2 b/man2/statfs.2
index 490d96d..8269a19 100644
--- a/man2/statfs.2
+++ b/man2/statfs.2
@@ -143,8 +143,8 @@ Filesystem types:
 .in
 .PP
 Most of these MAGIC constants are defined in
-.I /usr/include/linux/magic.h
-some are hardcoded in kernel sources.
+.IR /usr/include/linux/magic.h ,
+and some are hardcoded in kernel sources.
 .PP
 Nobody knows what
 .I f_fsid


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
