From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc(5): fix indentation for net examples
Date: Sat, 28 Dec 2013 08:26:44 -0500
Message-ID: <1388237204-12791-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man5/proc.5 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 942b833..60829b2 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2023,14 +2023,12 @@ The format is:
 
 .nf
 .ft CW
-.in 1n
 Inter-|   Receive                                                |  Transmit
  face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
     lo: 2776770   11307    0    0    0     0          0         0  2776770   11307    0    0    0     0       0          0
   eth0: 1215645    2751    0    0    0     0          0         0  1782404    4324    0    0    0   427       0          0
   ppp0: 1622270    5552    1    0    0     0          0         0   354130    5669    0    0    0     0       0          0
   tap0:    7714      81    0    0    0     0          0         0     7714      81    0    0    0     0       0          0
-.in
 .ft
 .fi
 .\" .TP
@@ -2126,12 +2124,10 @@ The format is:
 
 .nf
 .ft CW
-.in 1n
 sl  local_address rem_address   st tx_queue rx_queue tr rexmits  tm\->when uid
  1: 01642C89:0201 0C642C89:03FF 01 00000000:00000001 01:000071BA 00000000 0
  1: 00000000:0801 00000000:0000 0A 00000000:00000000 00:00000000 6F000100 0
  1: 00000000:0201 00000000:0000 0A 00000000:00000000 00:00000000 00000000 0
-.in
 .ft
 .fi
 .TP
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
