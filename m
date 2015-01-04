From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sendmmsg.2: ffix
Date: Mon, 5 Jan 2015 06:30:57 +0900
Message-ID: <CALhU9tmJcPyPG7OftU1r1uh9VysGEnNCyihtG+LRpM1RG9HVdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index 7ae1c3e..cd5ce66 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -30,7 +30,7 @@
 sendmmsg \- send multiple messages on a socket
 .SH SYNOPSIS
 .nf
-.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
+.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
 .BI "#include <sys/socket.h>"

 .BI "int sendmmsg(int " sockfd ", struct mmsghdr *" msgvec \


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
