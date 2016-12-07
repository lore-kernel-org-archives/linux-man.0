From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/3] Document NETLINK_SOCK_DIAG interface
Date: Wed, 7 Dec 2016 16:59:30 +0300
Message-ID: <20161207135930.GB1100@altlinux.org>
References: <20160315172551.GA2903@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160315172551.GA2903-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Pavel Emelyanov (1):
  sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface

Dmitry V. Levin (2):
  netlink.7: Document NETLINK_INET_DIAG rename to NETLINK_SOCK_DIAG
  netlink.7: Add references to sock_diag(7)

 man7/netlink.7   |  10 +-
 man7/sock_diag.7 | 865 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 871 insertions(+), 4 deletions(-)
 create mode 100644 man7/sock_diag.7

-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
