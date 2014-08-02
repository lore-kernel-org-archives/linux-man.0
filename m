From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] core.5: fix memory leak in example
Date: Sat,  2 Aug 2014 15:32:57 +0530
Message-ID: <1406973777-3078-1-git-send-email-rahulbedarkar89@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

close opened file at the end

Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/core.5 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man5/core.5 b/man5/core.5
index 074add6..f2c3e36 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -422,6 +422,7 @@ main(int argc, char *argv[])
         tot += nread;
     fprintf(fp, "Total bytes in core dump: %d\\n", tot);
 
+    fclose(fp);
     exit(EXIT_SUCCESS);
 }
 .fi
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
