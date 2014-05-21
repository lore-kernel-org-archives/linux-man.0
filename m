From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 14/24] re_comp.3: Fix prototypes
Date: Wed, 21 May 2014 16:57:45 +0200
Message-ID: <1400684275-20972-15-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

re_comp and re_exec take const char* arguments.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/re_comp.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/re_comp.3 b/man3/re_comp.3
index c1199a8..0e15598 100644
--- a/man3/re_comp.3
+++ b/man3/re_comp.3
@@ -34,9 +34,9 @@ re_comp, re_exec \- BSD regex functions
 .br
 .B #include <regex.h>
 .sp
-.BI "char *re_comp(char *" regex );
+.BI "char *re_comp(const char *" regex );
 .sp
-.BI "int re_exec(char *" string );
+.BI "int re_exec(const char *" string );
 .SH DESCRIPTION
 .BR re_comp ()
 is used to compile the null-terminated regular expression pointed to by
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
