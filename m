From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 3/3] ld.so.8: tfix
Date: Sat, 13 May 2017 12:37:47 +0200
Message-ID: <20170513103747.1341-3-jwilk@jwilk.net>
References: <20170513103747.1341-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513103747.1341-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Removed duplicated words.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man8/ld.so.8 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index c0e2bca3e..e13b7a6bb 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -307,7 +307,7 @@ The objects are searched for using the rules given under DESCRIPTION.
 In secure-execution mode,
 preload pathnames containing slashes are ignored.
 Furthermore, shared objects are preloaded only
-from the standard search directories and and only
+from the standard search directories and only
 if they have set-user-ID mode bit enabled (which is not typical).
 
 Within the names specified in the
@@ -471,7 +471,7 @@ then it would instead use that definition.
 then the dynamic linker would use the weak symbol that it initially found.)
 
 The old glibc behavior was nonstandard.
-(Standard practice is that the distinction between between
+(Standard practice is that the distinction between
 weak and strong symbols should have effect only at static link time.)
 In glibc 2.2,
 .\" More precisely 2.1.92
-- 
2.13.0.rc2.291.g57267f2277

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
