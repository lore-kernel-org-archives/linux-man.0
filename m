From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for confstr.3
Date: Sat, 9 Nov 2013 12:43:43 +0400
Message-ID: <20131109124343.1dfb7e9b@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man3/confstr.3        2013-03-23 18:21:19.545674858 +0400
+++ /tmp/confstr.3      2013-11-09 12:37:12.972060495 +0400
@@ -121,7 +121,7 @@
 .SH ERRORS
 .TP
 .B EINVAL
-If the value of
+The value of
 .I name
 is invalid.
 .SH CONFORMING TO


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
