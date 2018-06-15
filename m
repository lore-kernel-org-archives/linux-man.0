From: Anmol Sarma <me@anmolsarma.in>
Subject: [PATCH] socket.7: Clarify that poll() and select() are affected by SO_RCVLOWAT
Date: Fri, 15 Jun 2018 23:08:59 +0530
Message-ID: <20180615173859.8357-1-me@anmolsarma.in>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, linux-man@vger.kernel.org, Anmol Sarma <me@anmolsarma.in>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Anmol Sarma <me@anmolsarma.in>
---
 man7/socket.7 | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/man7/socket.7 b/man7/socket.7
index b1aebfae2..65532bc49 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -777,17 +777,20 @@ fails with the error
 .B SO_RCVLOWAT
 is changeable
 only since Linux 2.4.
-The
+In versions of Linux prior to 2.6.28, the
 .BR select (2)
 and
 .BR poll (2)
-system calls currently do not respect the
+system calls did not respect the
 .B SO_RCVLOWAT
-setting on Linux,
-and mark a socket readable when even a single byte of data is available.
-A subsequent read from the socket will block until
+setting. Since Linux 2.6.28,
+.BR select (2)
+and
+.BR poll (2)
+will not mark a socket readable until
 .B SO_RCVLOWAT
 bytes are available.
+.\" Commit c7004482e8dcb7c3c72666395cfa98a216a4fb70
 .\" See http://marc.theaimsgroup.com/?l=linux-kernel&m=111049368106984&w=2
 .\" Tested on kernel 2.6.14 -- mtk, 30 Nov 05
 .TP
-- 
2.17.1
