From: Vitaly Sinilin <vs-K1BYk//aQ7Y@public.gmane.org>
Subject: [PATCH] signalfd.2: Prefer puts() to printf() in EXAMPLE
Date: Thu, 15 Dec 2016 01:14:57 +0300
Message-ID: <20161215011457.6b7fe950385d87b450919095@kp4.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

puts() is saddened when printf() is used instead of it.
---
 man2/signalfd.2 |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/signalfd.2 b/man2/signalfd.2
index 11eceee..33addbd 100644
--- a/man2/signalfd.2
+++ b/man2/signalfd.2
@@ -440,12 +440,12 @@ main(int argc, char *argv[])
             handle_error("read");

         if (fdsi.ssi_signo == SIGINT) {
-            printf("Got SIGINT\\n");
+            puts("Got SIGINT");
         } else if (fdsi.ssi_signo == SIGQUIT) {
-            printf("Got SIGQUIT\\n");
+            puts("Got SIGQUIT");
             exit(EXIT_SUCCESS);
         } else {
-            printf("Read unexpected signal\\n");
+            puts("Read unexpected signal");
         }
     }
 }
-- 
Vitaly Sinilin <vs-K1BYk//aQ7Y@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
