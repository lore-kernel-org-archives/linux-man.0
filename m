From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getent.1: ffix
Date: Fri,  9 Mar 2012 18:07:01 -0400
Message-ID: <1331330821-25895-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man1/getent.1 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/man1/getent.1 b/man1/getent.1
index 47e790c..8caf8aa 100644
--- a/man1/getent.1
+++ b/man1/getent.1
@@ -24,7 +24,8 @@
 .SH NAME
 getent \- get entries from Name Service Switch libraries
 .SH SYNOPSIS
-.BI "getent " database " [ " key " ... ]"
+.B getent
+.IR database " [" key " ...]"
 .SH DESCRIPTION
 The
 .I getent
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
