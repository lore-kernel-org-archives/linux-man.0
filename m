From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 16/20] getnameinfo.3: fix prototype
Date: Tue, 20 May 2014 01:02:22 +0200
Message-ID: <1400540546-25578-17-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The hostlen and servlen parameters to getnameinfo() have type
socklet_t.
---
 man3/getnameinfo.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index db72bd7..16c8d4f 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -16,8 +16,8 @@ getnameinfo \- address-to-name translation in protocol-independent manner
 .B #include <netdb.h>
 .sp
 .BI "int getnameinfo(const struct sockaddr *" "sa" ", socklen_t " "salen" ,
-.BI "                char *" "host" ", size_t " "hostlen" ,
-.BI "                char *" "serv" ", size_t " "servlen" ", int " "flags" );
+.BI "                char *" "host" ", socklen_t " "hostlen" ,
+.BI "                char *" "serv" ", socklen_t " "servlen" ", int " "flags" );
 .fi
 .sp
 .in -4n
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
