From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 18/24] scandir.3: Fix prototypes
Date: Wed, 21 May 2014 16:57:49 +0200
Message-ID: <1400684275-20972-19-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The alphasort and versionsort functions take arguments of type const
struct dirent **, not const void *.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/scandir.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/scandir.3 b/man3/scandir.3
index aee2c86..7fea26e 100644
--- a/man3/scandir.3
+++ b/man3/scandir.3
@@ -73,9 +73,9 @@ a directory for matching entries
 .BI "int (*" compar ")(const struct dirent **, const struct dirent **));"
 .RE
 .sp
-.BI "int alphasort(const void *" a ", const void *" b );
+.BI "int alphasort(const struct dirent **" a ", const struct dirent **" b );
 .sp
-.BI "int versionsort(const void *" a ", const void *" b );
+.BI "int versionsort(const struct dirent **" a ", const struct dirent **" b );
 
 .BR "#include <fcntl.h>" "          /* Definition of AT_* constants */"
 .B #include <dirent.h>
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
