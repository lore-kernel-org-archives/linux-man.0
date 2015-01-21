From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sigaction.2: tfix and ffix
Date: Thu, 22 Jan 2015 05:41:54 +0900
Message-ID: <CALhU9tmL-LpCewyaXE0QmcffNuKLKHYZOa-42wTQiOz2ub_zQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man2/sigaction.2 b/original/man2/sigaction.2
index 682678c..adfacd6 100644
--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -451,7 +451,7 @@ delivering the trap.
 In the case of
 .BR seccomp (2),
 the tracee will be shown as delivering the event.
-.B BUS_MCERR_*
+.B BUS_MCEERR_*
 and
 .I si_addr_lsb
 are Linux-specific extensions.
@@ -470,7 +470,7 @@ The
 .I si_fd
 field indicates the file descriptor for which the I/O event occurred.
 .IP *
-.BR SIGSYS,
+.BR SIGSYS ,
 generated (since Linux 3.5)
 .\" commit a0727e8ce513fe6890416da960181ceb10fbfae6
 when a seccomp filter returns

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
