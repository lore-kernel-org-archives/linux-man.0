From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] getcontext.3: Exemplar structure should use 'ucontext_t'.
Date: Thu, 29 Jun 2017 12:17:15 -0400
Message-ID: <41ce95e3-7d93-a5e7-b186-e4335ee09921@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

getcontext.3: Exemplar structure should use 'ucontext_t'.

In glibc we just finished a round of purging 'struct ucontext' which
is not in the POSIX reserved namespace of *_t tags. This has some
consequences to applications using the non-standard struct ucontext:
https://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27struct_ucontext.27
but it also fixes a namespace conformance issue which is always a longterm
pain for large portable programs.

It was noted by Peter Maydell (https://sourceware.org/bugzilla/show_bug.cgi?id=21457)
that the linux man pages still had references to 'struct ucontext' but only in
the form of an exemplar structure.

The following patch fixes the exemplar to match what is in glibc and therefore
it won't ever suggest users can use 'struct ucontext'.

Applies to master.

Please apply.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
diff --git a/man3/getcontext.3 b/man3/getcontext.3
index c31a46b..de54d12 100644
--- a/man3/getcontext.3
+++ b/man3/getcontext.3
@@ -57,11 +57,11 @@ the following fields:
 .in +4
 .nf
 
-typedef struct ucontext {
-    struct ucontext *uc_link;
-    sigset_t         uc_sigmask;
-    stack_t          uc_stack;
-    mcontext_t       uc_mcontext;
+typedef struct ucontext_t {
+    struct ucontext_t *uc_link;
+    sigset_t          uc_sigmask;
+    stack_t           uc_stack;
+    mcontext_t        uc_mcontext;
     ...
 } ucontext_t;
 
-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
