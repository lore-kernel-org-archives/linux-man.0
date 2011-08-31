From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] signal.7: remove out-of-date description
Date: Thu, 01 Sep 2011 00:25:46 +0900
Message-ID: <4E5E527A.2030606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: New description on LinuxThreads and NPTL's reserving of
real-time signals was added at the previous paragraph, so the
out-of-date description should be removed.


diff --git a/man7/signal.7 b/man7/signal.7
--- a/man7/signal.7
+++ b/man7/signal.7
@@ -375,8 +375,6 @@ does not exceed
Unlike standard signals, real-time signals have no predefined meanings:
the entire set of real-time signals can be used for application-defined
purposes.
-(Note, however, that the LinuxThreads implementation uses the first
-three real-time signals.)
.PP
The default action for an unhandled real-time signal is to terminate the
receiving process.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
