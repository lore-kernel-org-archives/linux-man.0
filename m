From: Simon Newton <nomis52-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] pthread_setschedparam.3: Invalid free() in example code
Date: Sat, 29 Nov 2014 09:41:56 -0800
Message-ID: <CAPQm1=PpBDnu9jW=0zuYF5X853F1HHomn3Po9vLMZ78LHq=thg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The example program will crash if -A is used, since attr is uninitialized.

$ ./a.out  -A
*** Error in `./a.out': free(): invalid pointer: 0xb779c3c4 ***
Aborted (core dumped)



diff --git a/man3/pthread_setschedparam.3 b/man3/pthread_setschedparam.3
index 971bc0c..36b00bd 100644
--- a/man3/pthread_setschedparam.3
+++ b/man3/pthread_setschedparam.3
@@ -424,9 +424,11 @@ main(int argc, char *argv[])

     /* Destroy unneeded thread attributes object */

-    s = pthread_attr_destroy(&attr);
-    if (s != 0)
-        handle_error_en(s, "pthread_attr_destroy");
+    if (!use_null_attrib) {
+      s = pthread_attr_destroy(&attr);
+      if (s != 0)
+          handle_error_en(s, "pthread_attr_destroy");
+    }

     s = pthread_join(thread, NULL);
     if (s != 0)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
