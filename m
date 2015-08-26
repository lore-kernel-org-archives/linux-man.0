From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: [PATCH man] tcp.7: improve paragraphs on tcp_ecn and add tcp_ecn_fallback bullet
Date: Wed, 26 Aug 2015 14:02:29 +0200
Message-ID: <381a72e4388904195a6b4bae56e40fed965f9cd8.1440590425.git.daniel@iogearbox.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Improve description around tcp_ecn, fix the RFC number and it's not a
boolean anymore since long time, and add a description for tcp_ecn_fallback.

See also kernel doc under Documentation/networking/ip-sysctl.txt on
tcp_ecn and tcp_ecn_fallback.

Signed-off-by: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
---
 man7/tcp.7 | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 2f290a2..0409a66 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -396,12 +396,37 @@ option.
 .\" Since 2.4.0-test7
 Enable RFC\ 2883 TCP Duplicate SACK support.
 .TP
-.IR tcp_ecn " (Boolean; default: disabled; since Linux 2.4)"
+.IR tcp_ecn " (Integer; default: 2; since Linux 2.4)"
 .\" Since 2.4.0-test7
-Enable RFC\ 2884 Explicit Congestion Notification.
-When enabled, connectivity to some
-destinations could be affected due to older, misbehaving
-routers along the path causing connections to be dropped.
+Enable RFC\ 3168 Explicit Congestion Notification.
+
+This file can have one of the following values:
+.RS
+.IP 0
+Disable ECN.
+Neither initiate nor accept ECN.
+.IP 1
+Enable ECN when requested by incoming connections and also
+request ECN on outgoing connection attempts.
+.IP 2
+Enable ECN when requested by incoming connections,
+but do not request ECN on outgoing connections.
+.RE
+.IP
+When enabled, connectivity to some destinations could be affected
+due to older, misbehaving middle boxes along the path, causing
+connections to be dropped.
+However, to facilitate and encourage deployment with option 1, and
+to work around such buggy equipment,
+.B tcp_ecn_fallback
+option has been introduced.
+.TP
+.IR tcp_ecn_fallback " (Boolean; default: enabled; since Linux 4.1)"
+.\" commit 492135557dc090a1abb2cfbe1a412757e3ed68ab
+Enable RFC\ 3168, Section 6.1.1.1. fallback.
+When enabled, outgoing ECN-setup SYNs that time out within the
+normal SYN retransmission timeout will be resent with CWR and
+ECE cleared.
 .TP
 .IR tcp_fack " (Boolean; default: enabled; since Linux 2.2)"
 .\" Since 2.1.92
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
