From: Florian Westphal <fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/1] proc.5: Document /proc/net/netfilter/nfnetlink_queue
Date: Mon, 12 Nov 2012 12:53:10 +0100
Message-ID: <1352721190-9549-1-git-send-email-fw@strlen.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Westphal <fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |   53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 64bd09a..384cc6b 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1848,6 +1848,59 @@ not yet supported in the kernel).
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
+NFQUEUE target.
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
+too many packets are already queued.
+.TP
+(7)
+queue user dropped.  Number of packets that were dropped within the netlink
+subsystem.  Such drops usually happen when the socket buffer is full.
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
 Contains major and minor numbers of each partition as well as number
 of blocks and partition name.
-- 
1.7.8.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
