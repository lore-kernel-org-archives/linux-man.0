From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] wcsncmp.3
Date: Sun, 29 Apr 2012 08:46:46 +0400
Message-ID: <20120429084646.25f0dc12@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man3/wcsncmp.3      2011-10-11 21:53:58.862937897 +0400
+++ /tmp/wcsncmp.3      2012-04-29 08:45:26.406282573 +0400
@@ -30,7 +30,7 @@
 wide-character string pointed to by \fIs2\fP, but at most \fIn\fP wide
 characters from each string.
 In each string, the comparison extends only up
-to the first occurrence of a nulll wide character (L\(aq\\0\(aq), if any.
+to the first occurrence of a null wide character (L\(aq\\0\(aq), if any.
 .SH "RETURN VALUE"
 The
 .BR wcsncmp ()


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
