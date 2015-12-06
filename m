From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 16/19] scripts/markup_check.sh: tfix
Date: Sun,  6 Dec 2015 19:47:29 +0100
Message-ID: <1449427652-3585-16-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 scripts/markup_check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/markup_check.sh b/scripts/markup_check.sh
index fdf047a..4dddd3a 100644
--- a/scripts/markup_check.sh
+++ b/scripts/markup_check.sh
@@ -26,7 +26,7 @@ pagename_pattern='[a-z_A-Z][^ ]*'
     grep "$pattern" $file_list | sed 's/^/        /' | tee -a $LOG
 
     echo ""
-    echo "Checking for misformmatted punctuation in .BR xrefs"
+    echo "Checking for misformatted punctuation in .BR xrefs"
     pattern='^\.BR  *'"$pagename_pattern"'  *([1-8a-zA-Z]*) [^ ]'
     echo "    Pattern: '$pattern'"
     grep "$pattern" $file_list | sed 's/^/        /' | tee -a $LOG
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
