From: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Subject: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Tue, 29 Jan 2013 17:24:43 +0100
Message-ID: <1695270.M7m4ekngnN@storm>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
---
 man3/fclose.3 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man3/fclose.3 b/man3/fclose.3
index 1bdf0a5..6945e89 100644
--- a/man3/fclose.3
+++ b/man3/fclose.3
@@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for example, with
 .BR sync (2)
 or
 .BR fsync (2).
+Also it's undefined behavior to call
+.BR fclose ()
+with a NULL pointer.
+
 .SH "SEE ALSO"
 .BR close (2),
 .BR fcloseall (3),
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
