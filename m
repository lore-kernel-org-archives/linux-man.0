From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 01/24] inet.3: Fix prototype
Date: Wed, 21 May 2014 16:57:32 +0200
Message-ID: <1400684275-20972-2-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The parameters to inet_makeaddr have type in_addr_t.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---

Notes:
    The glibc header seems to have changed in ad483238a1ef, while the
    implementation followed two years later in bf2cc5fb028f.

 man3/inet.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/inet.3 b/man3/inet.3
index fff0308..0c61b49 100644
--- a/man3/inet.3
+++ b/man3/inet.3
@@ -57,7 +57,7 @@ inet_netof \- Internet address manipulation routines
 .sp
 .BI "char *inet_ntoa(struct in_addr " in );
 .sp
-.BI "struct in_addr inet_makeaddr(int " net ", int " host );
+.BI "struct in_addr inet_makeaddr(in_addr_t " net ", in_addr_t " host );
 .sp
 .BI "in_addr_t inet_lnaof(struct in_addr " in );
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
