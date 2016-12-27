From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] prctl.2: Be more precise in what causes dumpable to reset
Date: Tue, 27 Dec 2016 16:52:16 -0500
Message-ID: <20161227215216.GA1211@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 26ac5d4..4e037e4 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -216,7 +216,7 @@ However, it is reset to the current value contained in the file
 in the following circumstances:
 .\" See kernel/cred.c::commit_creds() (Linux 3.18 sources)
 .RS
-.IP * 3
+.IP * 4
 The process's effective user or group ID is changed.
 .IP *
 The process's filesystem user or group ID is changed (see
@@ -224,9 +224,15 @@ The process's filesystem user or group ID is changed (see
 .IP *
 The process executes
 .RB ( execve (2))
-a set-user-ID or set-group-ID program,
-or a program that has capabilities (see
-.BR capabilities (7)).
+a set-user-ID or set-group-ID program, resuling in a change
+of either effective user or group id.
+.IP *
+The process executes
+.RB ( execve (2))
+a program that has file capabilities (see
+.BR capabilities (7)),
+but only if the permitted capabilities
+gained exceed those already permitted for the current process.
 .\" Also certain namespace operations;
 .RE
 .IP
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
