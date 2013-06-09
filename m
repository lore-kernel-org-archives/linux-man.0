From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small fix for fallocate.2
Date: Sun, 9 Jun 2013 12:13:52 +0400
Message-ID: <20130609121352.18a390a7@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- fallocate.2 2013-06-06 21:38:12.037409549 +0400
+++ /tmp/fallocate.2    2013-06-09 12:12:52.935899273 +0400
@@ -110,7 +110,7 @@
 .BR FALLOC_FL_PUNCH_HOLE ;
 if a file system doesn't support the operation, an error is returned.
 .SH RETURN VALUE
-On error,
+On success,
 .BR fallocate ()
 returns zero.
 On error, \-1 is returned and

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
