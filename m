From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] mmap.2: offset behavior for MAP_ANONYMOUS
Date: Tue,  9 Aug 2016 01:12:31 +0200
Message-ID: <1470697951-9955-1-git-send-email-jann@thejh.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The manpage claimed that the offset argument is ignored, and when I
interpreted that as "I don't need to set that register when doing the
syscall", I got failures. I was able to spot two reasons for that:

What I probably ran into:
At least on x86-64, sys_mmap (in arch/x86/kernel/sys_x86_64.c) always
checks that the offset is page-aligned, even for MAP_ANONYMOUS.

Another one, could probably trigger on 32-bit x86:
In do_mmap(), there is a check to ensure that pgoff together with the
allocation length won't cause an overflow, even for MAP_ANONYMOUS.

Document that userspace should pass in zero, since that's probably what
everyone is doing already. (It would also be possible to describe the
constraints on the offset more carefully, but zero works, and nobody
should need to pass in anything else.)

Signed-off-by: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
---
 man2/mmap.2 | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 3bcfffd..751dd36 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -164,9 +164,7 @@ The mapping is not backed by any file;
 its contents are initialized to zero.
 The
 .I fd
-and
-.I offset
-arguments are ignored;
+argument is ignored;
 however, some implementations require
 .I fd
 to be \-1 if
@@ -175,6 +173,11 @@ to be \-1 if
 .BR MAP_ANON )
 is specified,
 and portable applications should ensure this.
+The
+.I offset
+argument should be zero.
+.\" See the pgoff overflow check in do_mmap().
+.\" See the offset check in sys_mmap in arch/x86/kernel/sys_x86_64.c.
 The use of
 .B MAP_ANONYMOUS
 in conjunction with
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
