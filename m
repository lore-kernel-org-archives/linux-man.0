From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 06/20] argz_*: Fix prototypes
Date: Tue, 20 May 2014 01:02:12 +0200
Message-ID: <1400540546-25578-7-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Update the prototypes of argz_{delete,extract,next} to agree with
glibc headers and manual.
---
 man3/argz_add.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/argz_add.3 b/man3/argz_add.3
index 3d07fc0..a28f9e2 100644
--- a/man3/argz_add.3
+++ b/man3/argz_add.3
@@ -33,14 +33,14 @@ argz_next, argz_replace, argz_stringify \- functions to handle an argz list
 .BI "error_t argz_create_sep(const char *" str ", int " sep ", char **" argz ,
 .BI "                     size_t *" argz_len );
 .sp
-.BI "error_t argz_delete(char **" argz ", size_t *" argz_len ", char *" entry );
+.BI "void argz_delete(char **" argz ", size_t *" argz_len ", char *" entry );
 .sp
-.BI "void argz_extract(char *" argz ", size_t " argz_len ", char  **" argv );
+.BI "void argz_extract(const char *" argz ", size_t " argz_len ", char  **" argv );
 .sp
 .BI "error_t argz_insert(char **" argz ", size_t *" argz_len ", char *" before ,
 .BI "                     const char *" entry );
 .sp
-.BI "char *argz_next(char *" argz ", size_t " argz_len ", const char *" entry );
+.BI "char *argz_next(const char *" argz ", size_t " argz_len ", const char *" entry );
 .sp
 .BI "error_t argz_replace(char **" argz ", size_t *" argz_len \
 ", const char *" str ,
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
