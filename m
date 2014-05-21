From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 20/24] setnetgrent.3: Fix prototype
Date: Wed, 21 May 2014 16:57:51 +0200
Message-ID: <1400684275-20972-21-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The buflen argument to getnetgrent_r has type size_t.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/setnetgrent.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/setnetgrent.3 b/man3/setnetgrent.3
index 2a85a95..25293e6 100644
--- a/man3/setnetgrent.3
+++ b/man3/setnetgrent.3
@@ -22,7 +22,7 @@ handle network group entries
 .BI "int getnetgrent(char **" host ", char **" user ", char **" domain );
 
 .BI "int getnetgrent_r(char **" host ", char **" user ","
-.BI "                  char **" domain ", char *" buf ", int " buflen );
+.BI "                  char **" domain ", char *" buf ", size_t " buflen );
 
 .BI "int innetgr(const char *" netgroup ", const char *" host ","
 .BI "            const char *" user ", const char *" domain );
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
