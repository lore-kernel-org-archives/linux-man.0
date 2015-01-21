From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: fanotify_mark.2: tfix
Date: Thu, 22 Jan 2015 05:40:07 +0900
Message-ID: <CALhU9tn16qUxifE+=te3L7HUHYSzdnYRmJmk58--65cB2qSHVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index 32ecfd5..bab5d2c 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -72,7 +72,7 @@ will occur.
 .B FAN_MARK_FLUSH
 Remove either all mount or all non-mount marks from the fanotify group.
 If
-.I flag
+.I flags
 contains
 .BR FAN_MARK_MOUNT ,
 all marks for mounts are removed from the group.

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
