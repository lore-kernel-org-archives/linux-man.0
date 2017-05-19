From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] tcp.7: change default value of tcp_frto
Date: Fri, 19 May 2017 12:03:09 +0200
Message-ID: <20170519100309.4110-1-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The default changed in c96fd3d461fa495400df24be3b3b66f0e0b152f9.

Signed-off-by: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
---
 man7/tcp.7 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 67dbed49a..ee78d3132 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -472,7 +472,7 @@ In Linux 2.2, the default value was 180.
 .\"
 .\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
 .TP
-.IR tcp_frto " (integer; default: 0; since Linux 2.4.21/2.6)"
+.IR tcp_frto " (integer; default: see below; since Linux 2.4.21/2.6)"
 .\" Since 2.4.21/2.5.43
 Enable F-RTO, an enhanced recovery algorithm for TCP retransmission
 timeouts (RTOs).
@@ -485,13 +485,16 @@ This file can have one of the following values:
 .RS
 .IP 0 3
 Disabled.
+This was the default up to and including Linux 2.6.23.
 .IP 1
 The basic version F-RTO algorithm is enabled.
 .IP 2
+.\" commit c96fd3d461fa495400df24be3b3b66f0e0b152f9
 Enable SACK-enhanced F-RTO if flow uses SACK.
 The basic version can be used also when
 SACK is in use though in that case scenario(s) exists where F-RTO
 interacts badly with the packet counting of the SACK-enabled TCP flow.
+This value is the default since Linux 2.6.24.
 .RE
 .IP
 Before Linux 2.6.22, this parameter was a Boolean value,
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
