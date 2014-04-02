From: Alexey Samsonov <samsonov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [patch] getline.3: Emphasize that user code should free the allocated
 buffer even if getline() failed.
Date: Wed, 2 Apr 2014 12:30:48 +0400
Message-ID: <CAGSYnCNRKxShgzR=WCLOd4BB_4CqEScNsmk-81eytih84cx9gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>From 4a09a0da31e9b98167e974e05f13f57b53dd41c3 Mon Sep 17 00:00:00 2001
From: Alexey Samsonov <samsonov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Date: Wed, 2 Apr 2014 12:26:44 +0400
Subject: [PATCH] getline.3: Emphasize that user code should free the allocated
 buffer even if getline() failed.

---
 man3/getline.3 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man3/getline.3 b/man3/getline.3
index 806e455..9f403a0 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -69,8 +69,11 @@ is set to NULL and
 .I *n
 is set 0 before the call, then
 .BR getline ()
-will allocate a buffer for storing the line,
-which should be freed by the user program.
+will allocate a buffer for storing the line.
+This buffer should be freed by the user program
+even if
+.BR getline ()
+failed.

 Alternatively, before calling
 .BR getline (),
-- 
1.9.1.423.g4596e3a



Relevant discussion in glibc bugzilla:
https://sourceware.org/bugzilla/show_bug.cgi?id=5666
test program:

$ cat tmp/getline/a.cc
#include <stdio.h>
int main() {
  for (int x = 0; x < 2; x++) {
    char *lineptr = 0;
    size_t size = 0;
    int res = getline(&lineptr, &size, stdin);
    printf("%d\n%p\n", res, lineptr);
  }
  return 0;
}
$ gcc tmp/getline/a.cc && echo -n "xxx" > tmp/getline/input && ./a.out
< tmp/getline/input
3
0x11ae010
-1
0x11ae090


-- 
Alexey Samsonov, MSK
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
