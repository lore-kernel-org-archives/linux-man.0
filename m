From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: restart_syscall.2: remove section number
Date: Tue, 27 Jan 2015 01:21:59 +0900
Message-ID: <CALhU9t=kM7Z7uO==e6vQ8eZJx1Vq9Gx+T1idTx8k80qMk0whrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man2/restart_syscall.2 b/original/man2/restart_syscall.2
index a71b618..33081b7 100644
--- a/man2/restart_syscall.2
+++ b/man2/restart_syscall.2
@@ -115,7 +115,7 @@ In the case of system calls that take a timeout argument and
 automatically restart after a stop signal plus
 .BR SIGCONT ,
 but which do not have the
-.BR restart_syscall (2)
+.BR restart_syscall ()
 mechanism built in, then, after the process resumes execution,
 the time that the process spent in the stop state is
 .I not
@@ -127,7 +127,7 @@ and
 .BR pselect (2).

 From user space, the operation of
-.BR restart_syscall (2)
+.BR restart_syscall ()
 is largely invisible:
 to the process that made the system call that is restarted,
 it appears as though that system call executed and


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
