From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: recvmmsg.2: ffix
Date: Mon, 5 Jan 2015 06:27:37 +0900
Message-ID: <CALhU9tmF4yLQs_uSYqN7UGk2_aN5aV-2Dakg6PO_vr9FQFnqfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index c902d51..a2b1f43 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -33,7 +33,7 @@
 recvmmsg \- receive multiple messages on a socket
 .SH SYNOPSIS
 .nf
-.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
+.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
 .BI "#include <sys/socket.h>"

 .BI "int recvmmsg(int " sockfd ", struct mmsghdr *" msgvec \

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
