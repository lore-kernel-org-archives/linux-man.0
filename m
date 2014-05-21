From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 15/24] rexec.3: Fix prototypes
Date: Wed, 21 May 2014 16:57:46 +0200
Message-ID: <1400684275-20972-16-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The user, passwd and cmd arguments to rexec and rexec_af are all
const.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/rexec.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/rexec.3 b/man3/rexec.3
index b62897b..12ba477 100644
--- a/man3/rexec.3
+++ b/man3/rexec.3
@@ -46,11 +46,11 @@ rexec, rexec_af \- return stream to a remote command
 .BR "#define _BSD_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <netdb.h>
 .sp
-.BI "int rexec(char **" ahost ", int " inport ", char *" user ", "
-.BI "          char *" passwd ", char *" cmd ", int *" fd2p );
+.BI "int rexec(char **" ahost ", int " inport ", const char *" user ", "
+.BI "          const char *" passwd ", const char *" cmd ", int *" fd2p );
 .sp
-.BI "int rexec_af(char **" ahost ", int " inport ", char *" user ", "
-.BI "             char *" passwd ", char *" cmd ", int *" fd2p ,
+.BI "int rexec_af(char **" ahost ", int " inport ", const char *" user ", "
+.BI "             const char *" passwd ", const char *" cmd ", int *" fd2p ,
 .BI "             sa_family_t " af  );
 .fi
 .SH DESCRIPTION
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
