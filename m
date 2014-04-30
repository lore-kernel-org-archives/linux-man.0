From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 08/10] Add <signal.h> to synopsis for ppoll()
Date: Wed, 30 Apr 2014 21:42:40 +0200
Message-ID: <1398886962-10633-9-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

One needs to #include <signal.h> to get the definition of the
type (sigset_t) of the mask argument to ppoll().

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/poll.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/poll.2 b/man2/poll.2
index f034001..4967869 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -38,6 +38,7 @@ poll, ppoll \- wait for some event on a file descriptor
 .BI "int poll(struct pollfd *" fds ", nfds_t " nfds ", int " timeout );
 .sp
 .BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
+.B #include <signal.h>
 .B #include <poll.h>
 .sp
 .BI "int ppoll(struct pollfd *" fds ", nfds_t " nfds ", "
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
