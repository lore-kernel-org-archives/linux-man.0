From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: get_mempolicy.2 tfix + ipv6.7 wfix
Date: Sun, 5 Jun 2011 02:04:53 +0200
Message-ID: <20110605000453.GE28455@glenfiddich.mraw.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="SkvwRMAIpAhPCcCJ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here are two patches against current git (3.32).

Thanks for your work and best regards.

-- 
Simon Paillard

--SkvwRMAIpAhPCcCJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ipv6.7-wfix-in-address-notation.patch"

>From 1ffdaa56f059bd379915e747f24c4924dcbd90b1 Mon Sep 17 00:00:00 2001
From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Sat, 12 Feb 2011 19:11:43 +0100
Subject: [PATCH 1/2] ipv6.7: wfix in address notation

Reported by Paul LeoNerd Evans at http://bugs.debian.org/604044
---
 man7/ipv6.7 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index 1e3b4c6..3951a2b 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -103,7 +103,7 @@ anycast to address the nearest member of a group of hosts
 (not implemented in Linux), IPv4-on-IPv6 to
 address a IPv4 host, and other reserved address types.
 .PP
-The address notation for IPv6 is a group of 16 2-digit hexadecimal
+The address notation for IPv6 is a group of 8 4-digit hexadecimal
 numbers, separated with a \(aq:\(aq.
 \&"::" stands for a string of 0 bits.
 Special addresses are ::1 for loopback and ::FFFF:<IPv4 address>
-- 
1.7.2.5


--SkvwRMAIpAhPCcCJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0002-man2-get_mempolicy.2-tfix.patch"

>From 4cad619e09dff627d7adc0a7a55775cb753cf2fb Mon Sep 17 00:00:00 2001
From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Sun, 5 Jun 2011 01:57:40 +0200
Subject: [PATCH 2/2] man2/get_mempolicy.2: tfix

---
 man2/get_mempolicy.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/get_mempolicy.2 b/man2/get_mempolicy.2
index bbbbab5..8212d4a 100644
--- a/man2/get_mempolicy.2
+++ b/man2/get_mempolicy.2
@@ -74,7 +74,7 @@ process is allowed to specify in subsequent calls to
 .BR mbind (2)
 or
 .BR set_mempolicy (2)
-[in the absense of any
+[in the absence of any
 .IR "mode flags" ]
 is returned in
 .IR nodemask .
-- 
1.7.2.5


--SkvwRMAIpAhPCcCJ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
