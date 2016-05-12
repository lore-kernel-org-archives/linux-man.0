From: "W. Trevor King" <wking-vJI2gpByivqcqzYg7KEe8g@public.gmane.org>
Subject: [PATCH] unix.7: tfix 'ret' check after accept populates 'data_socket'
Date: Thu, 12 May 2016 01:24:26 -0700
Message-ID: <df1c8881c6f1632e714aa3a99ce6656e944be74c.1463041407.git.wking@tremily.us>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, "W. Trevor King" <wking-vJI2gpByivqcqzYg7KEe8g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A typo from 15545eb6 (unix.7: Add example, 2016-01-06).

Signed-off-by: W. Trevor King <wking-vJI2gpByivqcqzYg7KEe8g@public.gmane.org>
---
 man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/unix.7 b/man7/unix.7
index 64f7610..ca6a621 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -735,7 +735,7 @@ main(int argc, char *argv[])
         /* Wait for incoming connection. */
 
         data_socket = accept(connection_socket, NULL, NULL);
-        if (ret == \-1) {
+        if (data_socket == \-1) {
             perror("accept");
             exit(EXIT_FAILURE);
         }
-- 
2.1.0.60.g85f0837

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
