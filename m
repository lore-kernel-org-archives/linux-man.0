From: William Allen Simpson <william.allen.simpson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] man7: sysctl_tcp_cookie_size, socket option TCP_COOKIE_TRANSACTIONS
Date: Thu, 10 Dec 2009 06:34:22 -0500
Message-ID: <4B20DCBE.4050308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010503030609060000040607"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------010503030609060000040607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Document new (2.6.33) TCPCT sysctl and socket option.

(already have kernel Documentation/networking/ip-sysctl.txt)

Signed-off-by: William.Allen.Simpson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
---
  man7/tcp.7 |   55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 files changed, 55 insertions(+), 0 deletions(-)

--------------010503030609060000040607
Content-Type: text/plain; x-mac-type="54455854"; x-mac-creator="0";
 name="tcpct+man7v1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tcpct+man7v1.patch"

diff --git a/man7/tcp.7 b/man7/tcp.7
index 9bdf968..b6a13de 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -303,6 +303,16 @@ The algorithm "reno" is always available,
 but additional choices may be available depending on kernel configuration.
 The default value for this file is set as part of kernel configuration.
 .TP
+.IR tcp_cookie_size " (integer; default: 0 (disabled); since Linux 2.6.33)"
+.\" The following is from 2.6.33-rc1: Documentation/networking/ip-sysctl.txt
+Default size of TCP Cookie Transactions (TCPCT) option,
+that may be overridden
+by the TCP_COOKIE_TRANSACTIONS socket option.
+Values greater than the maximum (16) are interpreted as the maximum.
+Values greater than zero and less than the minimum (8) are interpreted
+as the minimum.
+Odd values are interpreted as the next even value.
+.TP
 .IR tcp_dma_copybreak " (integer; default: 4096; since Linux 2.6.24)"
 Lower limit, in bytes, of the size of socket reads that will be
 offloaded to a DMA copy engine, if one is present in the system
@@ -822,6 +832,51 @@ For more information see
 .BR ip (7).
 .\" FIXME Document TCP_CONGESTION (new in 2.6.13)
 .TP
+.BR TCP_COOKIE_TRANSACTIONS " (since Linux 2.6.33)"
+If defined,
+this option can be used to override the system-wide setting in the file
+.I /proc/sys/net/ipv4/tcp_cookie_size
+for this socket.
+Passes \fIstruct tcp_cookie_transactions\fP
+as defined in the file
+.IR /usr/include/linux/tcp.h .
+Intended to be portable.
+.RS
+.TP
+.B tcpct_cookie_desired
+Send the Cookie option with the <SYN> on a per socket basis.
+Values: 0 (default), 8, 10, 12, 14, 16
+.TP
+.B tcpct_s_data_desired
+The maximum amount of data transmitted
+with the <SYN> or <SYN,ACK(SYN)>
+on a per socket basis.
+Wait for data before sending.
+.TP
+.B tcpct_used
+Alternatively,
+send a constant data string
+with the <SYN> or <SYN,ACK(SYN)>
+on a per socket basis.
+On receipt,
+returns cookie(s) exchanged.
+.TP
+.B TCP_COOKIE_IN_ALWAYS
+Silently discard any incoming <SYN> that is missing
+the Cookie option on a per socket basis.
+Default: off.
+.TP
+.B TCP_COOKIE_OUT_NEVER
+Refuse to send (override)
+the Cookie option on a per socket basis.
+Default: off.
+.TP
+.B TCP_EXTEND_TIMESTAMP
+If defined,
+may also send 64-bit timestamps extension.
+Default: off.
+.RE
+.TP
 .BR TCP_CORK " (since Linux 2.2)"
 .\" precisely: since 2.1.127
 If set, don't send out partial frames.
-- 
1.6.3.3


--------------010503030609060000040607--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
