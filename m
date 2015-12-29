From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_list.2: include/uapi/linux/wireless.h
Date: Wed, 30 Dec 2015 00:28:18 +0100
Message-ID: <1451431698-21046-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add the list of wireless IOCTLs.

We should later add a page ioctl_wireless.2 decribing the usage.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index 8366673..cc3488d 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -505,6 +505,62 @@ l l l l.
 0x000089E3	SIOCNRRTCTL	const int *
 .TE
 
+// <include/uapi/linux/wireless.h>
+.TS
+l l l l.
+x00008b00	SIOCSIWCOMMIT	struct net_device *	// MORE
+x00008b01	SIOCGIWNAME	struct net_device *	// MORE
+x00008b02	SIOCSIWNWID	struct net_device *	// MORE
+x00008b03	SIOCGIWNWID	struct net_device *	// MORE
+x00008b04	SIOCSIWFREQ	struct net_device *	// MORE
+x00008b05	SIOCGIWFREQ	struct net_device *	// MORE
+x00008b06	SIOCSIWMODE	struct net_device *	// MORE
+x00008b07	SIOCGIWMODE	struct net_device *	// MORE
+x00008b08	SIOCSIWSENS	struct net_device *	// MORE
+x00008b09	SIOCGIWSENS	struct net_device *	// MORE
+x00008b0a	SIOCSIWRANGE	struct net_device *	// MORE
+x00008b0b	SIOCGIWRANGE	struct net_device *	// MORE
+x00008b0c	SIOCSIWPRIV	struct net_device *	// MORE
+x00008b0d	SIOCGIWPRIV	struct net_device *	// MORE
+x00008b0e	SIOCSIWSTATS	struct net_device *	// MORE
+x00008b0f	SIOCGIWSTATS	struct net_device *	// MORE
+x00008b10	SIOCSIWSPY	struct net_device *	// MORE
+x00008b11	SIOCGIWSPY	struct net_device *	// MORE
+x00008b12	SIOCSIWTHRSPY	struct net_device *	// MORE
+x00008b13	SIOCGIWTHRSPY	struct net_device *	// MORE
+x00008b14	SIOCSIWAP	struct net_device *	// MORE
+x00008b15	SIOCGIWAP	struct net_device *	// MORE
+x00008b17	SIOCGIWAPLIST	struct net_device *	// MORE
+x00008b18	SIOCSIWSCAN	struct net_device *	// MORE
+x00008b19	SIOCGIWSCAN	struct net_device *	// MORE
+x00008b1a	SIOCSIWESSID	struct net_device *	// MORE
+x00008b1b	SIOCGIWESSID	struct net_device *	// MORE
+x00008b1c	SIOCSIWNICKN	struct net_device *	// MORE
+x00008b1d	SIOCGIWNICKN	struct net_device *	// MORE
+x00008b20	SIOCSIWRATE	struct net_device *	// MORE
+x00008b21	SIOCGIWRATE	struct net_device *	// MORE
+x00008b22	SIOCSIWRTS	struct net_device *	// MORE
+x00008b23	SIOCGIWRTS	struct net_device *	// MORE
+x00008b24	SIOCSIWFRAG	struct net_device *	// MORE
+x00008b25	SIOCGIWFRAG	struct net_device *	// MORE
+x00008b26	SIOCSIWTXPOW	struct net_device *	// MORE
+x00008b27	SIOCGIWTXPOW	struct net_device *	// MORE
+x00008b28	SIOCSIWRETRY	struct net_device *	// MORE
+x00008b29	SIOCGIWRETRY	struct net_device *	// MORE
+x00008b2a	SIOCSIWENCODE	struct net_device *	// MORE
+x00008b2b	SIOCGIWENCODE	struct net_device *	// MORE
+x00008b2c	SIOCSIWPOWER	struct net_device *	// MORE
+x00008b2d	SIOCGIWPOWER	struct net_device *	// MORE
+x00008b30	SIOCSIWGENIE	struct net_device *	// MORE
+x00008b31	SIOCGIWGENIE	struct net_device *	// MORE
+x00008b16	SIOCSIWMLME	struct net_device *	// MORE
+x00008b32	SIOCSIWAUTH	struct net_device *	// MORE
+x00008b33	SIOCGIWAUTH	struct net_device *	// MORE
+x00008b34	SIOCSIWENCODEEXT	struct net_device *	// MORE
+x00008b35	SIOCGIWENCODEEXT	struct net_device *	// MORE
+x00008b36	SIOCSIWPMKSA	struct net_device *	// MORE
+.TE
+
 // <include/linux/sbpcd.h>
 .TS
 l l l.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
