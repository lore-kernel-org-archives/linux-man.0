From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 04/10] Fix prototypes for [sg]etpriority()
Date: Wed, 30 Apr 2014 21:42:36 +0200
Message-ID: <1398886962-10633-5-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The who argument has type id_t (which happens to be u32 on linux).

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/getpriority.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getpriority.2 b/man2/getpriority.2
index a448a0f..daedf4c 100644
--- a/man2/getpriority.2
+++ b/man2/getpriority.2
@@ -53,9 +53,9 @@ getpriority, setpriority \- get/set program scheduling priority
 .br
 .B #include <sys/resource.h>
 .sp
-.BI "int getpriority(int " which ", int " who );
+.BI "int getpriority(int " which ", id_t " who );
 .br
-.BI "int setpriority(int " which ", int " who ", int " prio );
+.BI "int setpriority(int " which ", id_t " who ", int " prio );
 .SH DESCRIPTION
 The scheduling priority of the process, process group, or user, as
 indicated by
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
