From: Rob Somers <uberkermit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] encrypt.3: changed code for example usage
Date: Sun, 12 Jul 2009 18:37:01 -0400
Message-ID: <4A5A658D.1090200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch is against the 3.21 version of the man pages.  I (and some 
others) found that the original example code
did not seem to work as advertised.  The new code (used by permission of 
the original author, Jens Thoms Toerring) was found
on comp.os.linux.development.

Rob Somers

--- encrypt.3    2009-04-15 12:05:39.000000000 -0400
+++ encrypt.3.new    2009-07-12 18:31:23.000000000 -0400
@@ -129,27 +129,59 @@
 .SH NOTES
 In glibc 2.2 these functions use the DES algorithm.
 .SH EXAMPLE
-You need to link with libcrypt to compile this example with glibc.
-To do useful work the
-.I key[]
-and
-.I txt[]
-arrays must be filled with a useful bit pattern.
+You need to link with libcrypt (-lcrypt) to compile this example with 
glibc.
 .sp
 .nf
+/* Modified from original source code
+ * written by Jens Thoms Toerring.  The original
+ * can be found on comp.os.linux.development.
+ */
+
 #define _XOPEN_SOURCE
-#include <unistd.h>
+#include <stdio.h>
 #include <stdlib.h>
+#include <unistd.h>
+#include <crypt.h>
 
-int
-main(void)
+int main(void)
 {
-    char key[64];      /* bit pattern for key */
-    char txt[64];      /* bit pattern for messages */
+    char key[64];
+    char orig[9] = "eggplant";
+    char buf[64];
+    char txt[9];
+    int i, j;
+
+    for (i = 0; i < 64; i++) {
+        key[i] = rand() & 1;
+    }
+
+    for (i = 0; i < 8; i++) {
+        for (j = 0; j < 8; j++) {
+            buf[i * 8 + j] = orig[i] >> j & 1;
+        }
+        setkey(key);
+    }
+    printf("Before encrypting: %s\n", orig);
+
+    encrypt(buf, 0);
+    for (i = 0; i < 8; i++) {
+        for (j = 0, txt[i] = '\0'; j < 8; j++) {
+            txt[i] |= buf[i * 8 + j] << j;
+        }
+        txt[8] = '\0';
+    }
+    printf("After encrypting:  %s\n", txt);
+
+    encrypt(buf, 1);
+    for (i = 0; i < 8; i++) {
+        for (j = 0, txt[i] = '\0'; j < 8; j++) {
+            txt[i] |= buf[i * 8 + j] << j;
+        }
+        txt[8] = '\0';
+    }
+    printf("After decrypting:  %s\n", txt);
 
-    setkey(key);
-    encrypt(txt, 0);   /* encode */
-    encrypt(txt, 1);   /* decode */
+    return 0;
 }
 .fi
 .SH "SEE ALSO"

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
