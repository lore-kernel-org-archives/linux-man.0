From: Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
Subject: [PATCH] getaddrinfo.3: fix ai_flags ai_family mixup
Date: Wed, 16 Jun 2010 15:26:59 +0200
Message-ID: <20100616132659.GA16973@ts2server.com>
Reply-To: nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Please CC me in list replies as I am not subscribed to this list.

Signed-off-by: Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
---
 man3/getaddrinfo.3 |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index d33b8ab..82ffa73 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -35,6 +35,8 @@
 .\" 2008-06-18, mtk: many parts rewritten
 .\" 2008-12-04, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
 .\"	Describe results ordering and reference /etc/gai.conf.
+.\" 2010-06-16, Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
+.\"	Fixed a bug where ai_flags and ai_family got mixed up.
 .\" FIXME . glibc's 2.9 NEWS file documents DCCP and UDP-lite support
 .\"           and is SCTP support now also there?
 .\"
@@ -393,7 +395,7 @@ If both
 and
 .B AI_ALL
 are specified in
-.IR hints.ai_family ,
+.IR hints.ai_flags ,
 then return both IPv6 and IPv4-mapped IPv6 addresses
 in the list pointed to by
 .IR res .
-- 
1.5.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
