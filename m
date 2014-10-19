From: Florian Westphal <fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2] proc.5: Document /proc/net/netfilter/nfnetlink_queue
Date: Sun, 19 Oct 2014 22:21:37 +0200
Message-ID: <1413750097-9875-1-git-send-email-fw@strlen.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Westphal <fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 Changes since v1:
 made a minor edit to better explain the difference between
 'dropped' and 'user dropped' counters.

 man5/proc.5 | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 7ca2226..da4b5b6 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2770,6 +2770,63 @@ not yet supported in the kernel).
 \&"St" is the internal state of the
 socket and Path is the bound path (if any) of the socket.
 .TP
+.I /proc/net/netfilter/nfnetlink_queue
+This file contains information about netfilter userspace queueing, if used.
+Each line represents a queue.  Queues that have not been subscribed to
+by userspace are not shown.
+.nf
+
+   1   4207     0  2 65535     0     0        0  1
+  (1)   (2)    (3)(4)  (5)    (6)   (7)      (8)
+.fi
+.IP
+The fields in each line are:
+.RS 7
+.TP 5
+(1)
+The ID of the queue.  This matches what is specified in the
+.B \-\-queue\-num
+or
+.B \-\-queue\-balance
+options to the
+.BR iptables (8)
+NFQUEUE target.  See
+.BR iptables-extensions (8)
+for more information.
+.TP
+(2)
+The netlink port id subscribed to the queue.
+.TP
+(3)
+The number of packets currently queued and waiting to be processed by
+the application.
+.TP
+(4)
+The copy mode of the queue. It is either 1 (metadata only) or 2
+(also copy payload data to userspace).
+.TP
+(5)
+Copy range, i.e. how many bytes of packet payload should be copied to
+userspace at most.
+.TP
+(6)
+queue dropped.  Number of packets that had to be dropped by the kernel because
+too many packets are already waiting for userspace to send back the mandatory
+accept/drop verdicts.
+.TP
+(7)
+queue user dropped.  Number of packets that were dropped within the netlink
+subsystem.  Such drops usually happen when the corresponding socket buffer is
+full, i.e.  userspace is not able to read messages fast enough.
+.TP
+(8)
+sequence number. Every queued packet is associated with a (32-bit)
+monotonically-increasing sequence number.
+This shows the ID of the most recent packet queued.
+.RE
+.IP
+The last number only exists for compatibility reasons and is always 1.
+.TP
 .I /proc/partitions
 Contains the major and minor numbers of each partition as well as the number
 of 1024-byte blocks and the partition name.
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
