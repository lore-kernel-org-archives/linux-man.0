From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [patch] small improvement for posix_fadvise.2
Date: Sat, 18 Dec 2010 09:04:27 +0300
Message-ID: <20101218090427.60588090@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man2/posix_fadvise.2  2010-11-02 13:41:53.000000000 +0300
+++ /tmp/posix_fadvise.2        2010-12-18 09:02:43.000000000 +0300
@@ -56,7 +56,7 @@
 The \fIadvice\fP applies to a (not necessarily existent) region starting
 at \fIoffset\fP and extending for \fIlen\fP bytes (or until the end of
 the file if \fIlen\fP is 0) within the file referred to by \fIfd\fP.
-The advice is not binding; it merely constitutes an expectation on behalf of
+The \fIadvice\fP is not binding; it merely constitutes an expectation on behalf of
 the application.
 
 Permissible values for \fIadvice\fP include:

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
