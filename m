From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mq_getattr.3: fix section number of mq_overview
Date: Mon, 5 Jan 2015 06:32:11 +0900
Message-ID: <CALhU9tkhPnvRf+qehekifg45S1ppGWe4EAj+1tDusCHmL0OQDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
index 3dc66be..dc6372c 100644
--- a/man3/mq_getattr.3
+++ b/man3/mq_getattr.3
@@ -90,7 +90,7 @@ Both of these fields must have a value greater than zero.
 Two
 .I /proc
 files that place ceilings on the values for these fields are described in
-.BR mq_overview (3).
+.BR mq_overview (7).

 The
 .I mq_curmsgs


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
