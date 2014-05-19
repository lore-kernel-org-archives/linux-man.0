From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 12/20] fpathconf.3: fix prototype
Date: Tue, 20 May 2014 01:02:18 +0200
Message-ID: <1400540546-25578-13-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The path argument to pathconf() is const.
---
 man3/fpathconf.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/fpathconf.3 b/man3/fpathconf.3
index d8d9a1b..0e46f31 100644
--- a/man3/fpathconf.3
+++ b/man3/fpathconf.3
@@ -47,7 +47,7 @@ fpathconf, pathconf \- get configuration values for files
 .sp
 .BI "long fpathconf(int " fd ", int " name );
 .br
-.BI "long pathconf(char *" path ", int " name );
+.BI "long pathconf(const char *" path ", int " name );
 .fi
 .SH DESCRIPTION
 .BR fpathconf ()
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
