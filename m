From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] malloc: warn about realloc portability pitfall
Date: Thu, 24 Mar 2011 14:47:04 -0600
Message-ID: <1300999624-26917-1-git-send-email-eblake@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---

For more on the portability pitfall, and on the fact that glibc
intentionally does not comply with C99 realloc:

http://austingroupbugs.net/view.php?id=400
http://sourceware.org/bugzilla/show_bug.cgi?id=12547
http://lists.gnu.org/archive/html/bug-gnulib/2011-03/msg00247.html

 man3/malloc.3 |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/man3/malloc.3 b/man3/malloc.3
index 4067aea..32815a1 100644
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -113,8 +113,16 @@ is equal to zero,
 and
 .I ptr
 is not NULL, then the call is equivalent to
-.IR free(ptr) .
-Unless
+.IR free(ptr)
+with a return of NULL, which is compliant to C89 but in violation of
+C99.  C99 semantics result in leaking either the original
+.I ptr
+(if NULL is returned) or an unexpected new zero-size allocation, if
+you are assuming GNU semantics; while GNU semantics result in a double
+free when NULL is returned if you are expecting C99 semantics.  It is
+better to avoid a
+.I size
+of 0.  Unless
 .I ptr
 is NULL, it must have been returned by an earlier call to
 .BR malloc (),
@@ -162,9 +170,15 @@ was equal to 0, either NULL or a pointer suitable to be passed to
 is returned.
 If
 .BR realloc ()
-fails the original block is left untouched; it is not freed or moved.
+fails and
+.I size
+was not 0, the original block is left untouched; it is not freed or
+moved.
 .SH "CONFORMING TO"
-C89, C99.
+C89 (all functions), C99 (only
+.BR malloc ,
+.BR calloc ,
+.BR free ).
 .SH NOTES
 By default, Linux follows an optimistic memory allocation strategy.
 This means that when
-- 
1.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
