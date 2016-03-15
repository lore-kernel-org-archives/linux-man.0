From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/4] Document NETLINK_SOCK_DIAG interface
Date: Tue, 15 Mar 2016 20:25:51 +0300
Message-ID: <20160315172551.GA2903@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Pavel Emelyanov (1):
  sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface

Dmitry V. Levin (3):
  sock_diag.7: Add EXAMPLE program
  netlink.7: Rename NETLINK_INET_DIAG to NETLINK_SOCK_DIAG
  netlink.7: Add references to sock_diag(7)

 man7/netlink.7   |  16 +-
 man7/sock_diag.7 | 820 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 830 insertions(+), 6 deletions(-)
 create mode 100644 man7/sock_diag.7

-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
