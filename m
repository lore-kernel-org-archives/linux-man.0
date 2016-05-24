From: Fabien Siron <fabien.siron-ZrNlpQwM5lQ@public.gmane.org>
Subject: [PATCH] netlink.7 : Change NETLINK_INET_DIAG to NETLINK_SOCK_DIAG
Date: Tue, 24 May 2016 10:42:18 +0000
Message-ID: <1464086539-30865-1-git-send-email-fabien.siron@epita.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

As NETLINK_INET_DIAG should not longer be used, I suggest to change that
to NETLINK_SOCK_DIAG in netlink(7) man.

Cheers,
--
Fabien Siron

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
