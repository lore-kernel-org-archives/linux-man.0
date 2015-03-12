From: Peter Adkins <peter.adkins-1p82Gqdf9CmhyYOOkqQQgw@public.gmane.org>
Subject: [PATCH] tcp.7: Document removal of TCP_SYNQ_HSIZE
Date: Thu, 12 Mar 2015 00:15:12 -0700
Message-ID: <CAA7vvKmzVsKmma=w5Lwx6ujjCcfgSsKSqt1DGEzfjb9naujkVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello there,

Looking over the man page for 'tcp' I came across a reference to
tuning the 'TCP_SYNQ_HSIZE' parameter when increasing
'tcp_max_syn_backlog' above 1024. However, this static sizing was
removed back in Linux 2.6.20 in favour of dynamic scaling - as part of
commit 72a3effaf633bcae9034b7e176bdbd78d64a71db.

I have included a patch below with reference to this commit, and that
the process detailed is not required on >= Linux 2.6.20. This is my
first patch for a man page, as well as groff, so I apologize if
anything is incorrect. If so, please let me know and I will resolve
and resubmit.

This patch was prepared against the current HEAD - at time of writing
- from the Kernel.org man-page repository
(f6d086878485f63e390d10f59b6beae7b96c4120), which looks to be version
3.82.


---
 man7/tcp.7 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 5723bde..794c636 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -530,12 +530,16 @@ The default value of 256 is increased to
 1024 when the memory present in the system is adequate or
 greater (>= 128Mb), and reduced to 128 for those systems with
 very low memory (<= 32Mb).
-It is recommended that if this
-needs to be increased above 1024, TCP_SYNQ_HSIZE in
+
+Prior to Linux 2.6.20,
+.\" commit 72a3effaf633bcae9034b7e176bdbd78d64a71db
+it was recommended that if this needed to be increased above 1024,
+the size of the SYNACK hash table (TCP_SYNQ_HSIZE) in
 .I include/net/tcp.h
 be modified to keep
 TCP_SYNQ_HSIZE*16<=tcp_max_syn_backlog, and the kernel be
-recompiled.
+recompiled. In Linux 2.6.20, the fixed sized TCP_SYNQ_HSIZE was removed
+in favour of dynamic sizing.
 .TP
 .IR tcp_max_tw_buckets " (integer; default: see below; since Linux 2.4)"
 .\" Since 2.3.41
-- 
1.9.1


Thank you for your time.

Regards,
Peter Adkins
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
