From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 15/20] getaddrinfo_a.3: fix prototype
Date: Tue, 20 May 2014 01:02:21 +0200
Message-ID: <1400540546-25578-16-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The pointer arguments to gai_suspend() are const.
---
 man3/getaddrinfo_a.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getaddrinfo_a.3 b/man3/getaddrinfo_a.3
index 768fc97..1873307 100644
--- a/man3/getaddrinfo_a.3
+++ b/man3/getaddrinfo_a.3
@@ -38,8 +38,8 @@ network address and service translation
 .BI "int getaddrinfo_a(int " "mode" ", struct gaicb *" "list[]" ,
 .BI "                int " "nitems" ", struct sigevent *" "sevp" );
 .sp
-.BI "int gai_suspend(struct gaicb *" "list[]" ", int " "nitems" ,
-.BI "                struct timespec *" "timeout" );
+.BI "int gai_suspend(const struct gaicb * const " "list[]" ", int " "nitems" ,
+.BI "                const struct timespec *" "timeout" );
 .sp
 .BI "int gai_error(struct gaicb *" "req" );
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
