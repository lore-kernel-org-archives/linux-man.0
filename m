From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 09/20] dl_iterate_phdr.3: tfix
Date: Tue, 20 May 2014 01:02:15 +0200
Message-ID: <1400540546-25578-10-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/dl_iterate_phdr.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/dl_iterate_phdr.3 b/man3/dl_iterate_phdr.3
index d57bf66..be06d1f 100644
--- a/man3/dl_iterate_phdr.3
+++ b/man3/dl_iterate_phdr.3
@@ -32,8 +32,8 @@ dl_iterate_phdr \- walk through list of shared objects
 
 .BI "int dl_iterate_phdr("
 .BI "          int (*" callback ") (struct dl_phdr_info *" info ,
-.BI "                           size_t " size ", void *" data ,
-.BI "          void *" data ;
+.BI "                           size_t " size ", void *" data "),"
+.BI "          void *" data ");"
 .fi
 .SH DESCRIPTION
 The
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
