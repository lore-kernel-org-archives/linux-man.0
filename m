From: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] prctl.2: Correct description of null-termination in
 PR_[GS]ET_NAME
Date: Tue, 21 Oct 2014 12:58:27 +0200
Message-ID: <mvmr3y1u1t8.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The size of the process name has always been at most 16 byte _including_
the null terminator.  This also means that the name returned by
PR_GET_NAME is always null-terminated.

Signed-off-by: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
---
 man2/prctl.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 1199891..4351ff9 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -240,7 +240,7 @@ using the value in the location pointed to by
 .IR "(char\ *) arg2" .
 The name can be up to 16 bytes long,
 .\" TASK_COMM_LEN in include/linux/sched.h
-and should be null-terminated if it contains fewer bytes.
+including the terminating null byte.
 This is the same attribute that can be set via
 .BR pthread_setname_np (3)
 and retrieved using
@@ -256,7 +256,7 @@ Return the name of the calling thread,
 in the buffer pointed to by
 .IR "(char\ *) arg2" .
 The buffer should allow space for up to 16 bytes;
-the returned string will be null-terminated if it is shorter than that.
+the returned string will be null-terminated.
 .TP
 .BR PR_SET_NO_NEW_PRIVS " (since Linux 3.5)"
 Set the calling process's
-- 
2.1.2

-- 
Andreas Schwab, SUSE Labs, schwab-l3A5Bk7waGM@public.gmane.org
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
