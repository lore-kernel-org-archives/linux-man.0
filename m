From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] cmsg.3: fix typo
Date: Wed, 31 Aug 2011 23:17:37 +0900
Message-ID: <4E5E4281.4070205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository


diff --git a/man3/cmsg.3 b/man3/cmsg.3
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -105,7 +105,7 @@ Use
on the
.I msghdr
to get the first control message and
-.BR CMSG_NEXTHDR ()
+.BR CMSG_NXTHDR ()
to get all subsequent ones.
In each control message, initialize
.I cmsg_len

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
