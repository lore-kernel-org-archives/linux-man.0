From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for regex.3
Date: Mon, 6 Jan 2014 13:24:35 +0400
Message-ID: <20140106132435.31301ebf@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man3/regex.3  2013-10-12 09:11:41.585233073 +0400
+++ /tmp/regex.3        2014-01-06 13:22:08.015053318 +0400
@@ -146,7 +146,7 @@
 The match-beginning-of-line operator always fails to match (but see the
 compilation flag
 .B REG_NEWLINE
-above)
+above).
 This flag may be used when different portions of a string are passed to
 .BR regexec ()
 and the beginning of the string should not be interpreted as the

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
