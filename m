From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for ptrace.2
Date: Wed, 23 Feb 2011 10:53:55 +0300
Message-ID: <20110223105355.1ae142f1@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- ptrace.2    2010-12-26 12:01:43.615106727 +0300
+++ /tmp/ptrace.2       2011-02-23 10:52:27.371001084 +0300
@@ -206,7 +206,7 @@
 .TP
 .BR PTRACE_O_TRACESYSGOOD " (since Linux 2.4.6)"
 When delivering syscall traps, set bit 7 in the signal number
-(i.e., deliver \fI(SIGTRAP | 0x80)\fP
+(i.e., deliver \fI(SIGTRAP | 0x80)\fP.
 This makes it easy for the tracer to tell the difference
 between normal traps and those caused by a syscall.
 .RB ( PTRACE_O_TRACESYSGOOD

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
