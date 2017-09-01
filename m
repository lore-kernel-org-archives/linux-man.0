From: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] getrlimit.2: Mention unit used by RLIMIT_CORE and RLIMIT_FSIZE
Date: Fri,  1 Sep 2017 17:27:43 -0300
Message-ID: <20170901202743.9678-1-bauerman@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It would have been obvious that these limits are in bytes, except that
"ulimit -a" in at least bash, dash and zsh says that they're in blocks.
This confused me, so I had to check the kernel source code.

My understanding is that they are indeed in bytes, so mention this
information in the man page.

Signed-off-by: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man2/getrlimit.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 84f04d695ea2..f2c5297526d7 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -150,7 +150,7 @@ This is the maximum size of a
 .I core
 file (see
 .BR core (5))
-that the process may dump.
+in bytes that the process may dump.
 When 0 no core dump files are created.
 When nonzero, larger dumps are truncated to this size.
 .TP
@@ -187,7 +187,7 @@ which fail with the error
 upon encountering the soft limit of this resource.
 .TP
 .B RLIMIT_FSIZE
-This is the maximum size of files that the process may create.
+This is the maximum size in bytes of files that the process may create.
 Attempts to extend a file beyond this limit result in delivery of a
 .B SIGXFSZ
 signal.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
