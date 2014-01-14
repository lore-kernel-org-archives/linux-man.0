From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for recno.3
Date: Tue, 14 Jan 2014 20:27:27 +0400
Message-ID: <20140114202727.2e922c9e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- recno.3     2013-10-12 09:11:41.585233073 +0400
+++ /tmp/recno.3        2014-01-14 20:26:13.867829543 +0400
@@ -186,7 +186,7 @@
 .I data
 field of the key should be a pointer to a memory location of type
 .IR recno_t ,
-as defined in th
+as defined in the
 .I <db.h>
 include file.
 This type is normally the largest unsigned integral type available to

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
