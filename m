From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] resolv.conf.5: document IPv6 format for nameserver
Date: Thu, 25 Oct 2012 02:15:51 +0200
Message-ID: <1351124151-26798-1-git-send-email-spaillard@debian.org>
References: <20121025001411.GF7609@glenfiddich.mraw.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121025001411.GF7609-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 610036-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Note this format is specified by RFC2373 and implemented in inet_pton().

See http://bugs.debian.org/610036
Reported-by: Witold Baryluk <baryluk-W6Hso+/wx31C2Nf1M/Lcnw@public.gmane.org>
---
 man5/resolv.conf.5 |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index e82ea72..fad39b5 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -41,9 +41,10 @@ and the domain search path is constructed from the domain name.
 .LP
 The different configuration options are:
 .TP
-\fBnameserver\fP Name server IP address
-Internet address (in dot notation) of a name server
-that the resolver should query.
+\fBnameserver\fP Name server address
+that the resolver should query, either
+an IPv4 address (in dot notation),
+or an IPv6 address in colon (and possibly dot) notation as per RFC2373.
 Up to
 .B MAXNS
 (currently 3, see \fI<resolv.h>\fP) name servers may be listed,
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
