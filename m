From: Stephen Hemminger <stephen-OTpzqLSitTUnbdJkjeBofR2eb7JE58TQ@public.gmane.org>
Subject: [PATCH] tcp: remove incorrect and outdated sysctl's
Date: Thu, 27 Oct 2016 17:42:37 -0700
Message-ID: <20161027174237.0d5dca3d@xeon-e3>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Stephen Hemminger <sthemmin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>

Several sysctl values on the TCP man page have been removed from the
upstream Linux kernel for several years. For example, tcp_abc was only
available for a few releases then reverted. The tcp_congestion_control
mechanism replaced earlier per-algorithm values.

Also, fix the release number first found values for several
tcp_congestion control related values.

Signed-off-by: Stephen Hemminger <sthemmin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
---
 man7/tcp.7 | 86 +++-----------------------------------------------------------
 1 file changed, 3 insertions(+), 83 deletions(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 89f2b22..077a045 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -238,29 +238,6 @@ take an integer value, with a nonzero value ("true") meaning that
 the corresponding option is enabled, and a zero value ("false")
 meaning that the option is disabled.
 .TP
-.IR tcp_abc " (Integer; default: 0; since Linux 2.6.15)"
-.\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
-Control the Appropriate Byte Count (ABC), defined in RFC 3465.
-ABC is a way of increasing the congestion window
-.RI ( cwnd )
-more slowly in response to partial acknowledgments.
-Possible values are:
-.RS
-.IP 0 3
-increase
-.I cwnd
-once per acknowledgment (no ABC)
-.IP 1
-increase
-.I cwnd
-once per acknowledgment of full sized segment
-.IP 2
-allow increase
-.I cwnd
-by two if acknowledgment is
-of two segments to compensate for delayed acknowledgments.
-.RE
-.TP
 .IR tcp_abort_on_overflow " (Boolean; default: disabled; since Linux 2.4)"
 .\" Since 2.3.41
 Enable resetting connections if the listening service is too
@@ -298,7 +275,7 @@ The
 default value of 2 implies that the space
 used for the application buffer is one fourth that of the total.
 .TP
-.IR tcp_allowed_congestion_control " (String; default: see text; since Linux 2.4.20)"
+.IR tcp_allowed_congestion_control " (String; default: see text; since Linux 2.6.18)"
 .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
 Show/set the congestion control algorithm choices available to unprivileged
 processes (see the description of the
@@ -328,7 +305,7 @@ Applications can still use the
 socket option to obtain optimal behavior
 when they know how/when to uncork their sockets.
 .TP
-.IR tcp_available_congestion_control " (String; read-only; since Linux 2.4.20)"
+.IR tcp_available_congestion_control " (String; read-only; since Linux 2.6.18)"
 .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
 Show a list of the congestion-control algorithms
 that are registered.
@@ -350,39 +327,12 @@ A value of 0 implies that no amount is reserved.
 .\"
 .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
 .TP
-.IR tcp_base_mss " (Integer; default: 512; since Linux 2.6.17)
+.IR tcp_base_mss " (Integer; default: 512; since Linux 2.6.17)"
 The initial value of
 .I search_low
 to be used by the packetization layer Path MTU discovery (MTU probing).
 If MTU probing is enabled,
 this is the initial MSS used by the connection.
-.\"
-.\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
-.TP
-.IR tcp_bic " (Boolean; default: disabled; Linux 2.4.27/2.6.6 to 2.6.13)"
-Enable BIC TCP congestion control algorithm.
-BIC-TCP is a sender-side-only change that ensures a linear RTT
-fairness under large windows while offering both scalability and
-bounded TCP-friendliness.
-The protocol combines two schemes
-called additive increase and binary search increase.
-When the congestion window is large, additive increase with a large
-increment ensures linear RTT fairness as well as good scalability.
-Under small congestion windows, binary search
-increase provides TCP friendliness.
-.\"
-.\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
-.TP
-.IR tcp_bic_low_window " (integer; default: 14; Linux 2.4.27/2.6.6 to 2.6.13)"
-Set the threshold window (in packets) where BIC TCP starts to
-adjust the congestion window.
-Below this threshold BIC TCP behaves the same as the default TCP Reno.
-.\"
-.\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
-.TP
-.IR tcp_bic_fast_convergence " (Boolean; default: enabled; Linux 2.4.27/2.6.6 to 2.6.13)"
-Force BIC TCP to more quickly respond to changes in congestion window.
-Allows two flows sharing the same connection to converge more rapidly.
 .TP
 .IR tcp_congestion_control " (String; default: see text; since Linux 2.4.13)"
 .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
@@ -391,13 +341,6 @@ The algorithm "reno" is always available,
 but additional choices may be available depending on kernel configuration.
 The default value for this file is set as part of kernel configuration.
 .TP
-.IR tcp_dma_copybreak " (integer; default: 4096; since Linux 2.6.24)"
-Lower limit, in bytes, of the size of socket reads that will be
-offloaded to a DMA copy engine, if one is present in the system
-and the kernel was configured with the
-.B CONFIG_NET_DMA
-option.
-.TP
 .IR tcp_dsack " (Boolean; default: enabled; since Linux 2.4)"
 .\" Since 2.4.0-test7
 Enable RFC\ 2883 TCP Duplicate SACK support.
@@ -847,29 +790,6 @@ It should not be changed without advice/request of technical experts.
 .\"
 .\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
 .TP
-.IR tcp_vegas_cong_avoid  " (Boolean; default: disabled; Linux 2.2 to 2.6.13)"
-.\" Since 2.1.8; removed in 2.6.13
-Enable TCP Vegas congestion avoidance algorithm.
-TCP Vegas is a sender-side-only change to TCP that anticipates
-the onset of congestion by estimating the bandwidth.
-TCP Vegas adjusts the sending rate by modifying the congestion window.
-TCP Vegas should provide less packet loss, but it is
-not as aggressive as TCP Reno.
-.\"
-.\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
-.TP
-.IR tcp_westwood " (Boolean; default: disabled; Linux 2.4.26/2.6.3 to 2.6.13)"
-Enable TCP Westwood+ congestion control algorithm.
-TCP Westwood+ is a sender-side-only modification of the TCP Reno
-protocol stack that optimizes the performance of TCP congestion control.
-It is based on end-to-end bandwidth estimation to set
-congestion window and slow start threshold after a congestion episode.
-Using this estimation, TCP Westwood+ adaptively sets a
-slow start threshold and a congestion window which takes into
-account the bandwidth used at the time congestion is experienced.
-TCP Westwood+ significantly increases fairness with respect to
-TCP Reno in wired networks and throughput over wireless links.
-.TP
 .IR tcp_window_scaling " (Boolean; default: enabled; since Linux 2.2)"
 .\" Since 2.1.36
 Enable RFC\ 1323 TCP window scaling.
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
