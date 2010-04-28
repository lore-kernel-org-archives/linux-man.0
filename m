From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] msgsnd(2): msg_bytes -> msg_qbytes
Date: Wed, 28 Apr 2010 23:59:35 +0000
Message-ID: <1272503151-6937-1-git-send-email-mfwitten@gmail.com>
References: <4bce5f4c.0d67f10a.33b0.ffff9e3e@mx.google.com> <838959.52751.qm@web45611.mail.sp1.yahoo.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4bce5f4c.0d67f10a.33b0.ffff9e3e-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mihail Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> reported
here:

    http://marc.info/?l=linux-man&m=127160667709342&w=2
    http://www.spinics.net/lists/linux-man/msg01271.html

the following:

    "The queue capacity is defined by the msg_bytes field in
    the associated data structure for the message queue."

    If I'm not wrong, the exact name of that field in the
    msqid_ds structure is msg_qbytes. The same thing appears
    also on the online [POSIX] manual pages, I checked it
    already.

I provided a detailed confirmation with quotes from the
Linux kernel sources:

    http://marc.info/?l=linux-man&m=127181601631737&w=2
    http://www.spinics.net/lists/linux-man/msg01273.html

This patch (requested by Mihail) makes the correction and
removes unnecessary implementation details.
---
 man2/msgop.2 |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/man2/msgop.2 b/man2/msgop.2
index 2b29cac..f236c5a 100644
--- a/man2/msgop.2
+++ b/man2/msgop.2
@@ -102,14 +102,14 @@ by
 .PP
 If sufficient space is available in the queue,
 .BR msgsnd ()
-succeeds immediately.
+succeeds immediately;
-(The queue capacity is defined by the
-.I msg_bytes
-field in the associated data structure for the message queue.
-During queue creation this field is initialized to
-.B MSGMNB
-bytes, but this limit can be modified using
-.BR msgctl (2).)
+the queue capacity can be queried and set via
+.BR msgctl (2)
+by using the
+.I msg_qbytes
+field of that function's
+.I msqid_ds
+pointer parameter.
 If insufficient space is available in the queue, then the default
 behavior of
 .BR msgsnd ()
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
