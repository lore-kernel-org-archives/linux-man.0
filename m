From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] socket.2: update documentation reference for AF_ALG
Date: Sun, 14 Jun 2015 15:01:08 +0200
Message-ID: <1512015.DlDWklcC4u@tauon.atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
---
 man2/socket.2 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man2/socket.2 b/man2/socket.2
index 38cd84f..411e8b9 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -387,8 +387,9 @@ standards use AF_* everywhere.
 The
 .B AF_ALG
 protocol type was added in Linux 2.6.38.
-More information on this interface is provided in the kernel source file,
-.IR Documentation/crypto/crypto-API-userspace.txt .
+More information on this interface is provided with the kernel HTML
+documentation at
+.IR https://www.kernel.org/doc/htmldocs/crypto-API/User.html .
 .SH EXAMPLE
 An example of the use of
 .BR socket ()
-- 
2.4.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
