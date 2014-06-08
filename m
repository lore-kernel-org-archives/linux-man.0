From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] fanotify_mark.2: tfix fixed
Date: Sun, 8 Jun 2014 18:47:51 +0400
Message-ID: <20140608184751.4837450e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

Sorry, corrected version:

--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -326,7 +326,7 @@ event.
 If
 .BR fanotify_mark (2)
 is called with
-.B FAN_MARK_FLUSH,
+.BR FAN_MARK_FLUSH ,
 .I flags
 is not checked for invalid values.
 .SH SEE ALSO


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
