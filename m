From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] getline.3: fix memory leak in example
Date: Fri,  1 Aug 2014 22:37:35 +0530
Message-ID: <1406912855-8085-1-git-send-email-rahulbedarkar89@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

close opened file at the end

Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/getline.3 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man3/getline.3 b/man3/getline.3
index c0b77d3..4b9c452 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -167,6 +167,7 @@ main(void)
     }
 
     free(line);
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
