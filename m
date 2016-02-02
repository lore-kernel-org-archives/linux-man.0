From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 5/5] wavelan.4: tfix
Date: Tue,  2 Feb 2016 21:50:48 +0100
Message-ID: <1454446248-448-5-git-send-email-jwilk@jwilk.net>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man4/wavelan.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/wavelan.4 b/man4/wavelan.4
index ebc4100..3ebdb7c 100644
--- a/man4/wavelan.4
+++ b/man4/wavelan.4
@@ -118,7 +118,7 @@ This distribution might be used to calculate the mean value
 and standard deviation of the signal level.
 .SS Specific notes
 This driver will fail to detect some
-.B non-NCR/ATT&T/Lucent
+.B non-NCR/AT&T/Lucent
 Wavelan cards.
 If this happens for you, you must look in the source code on
 how to add your card to the detection routine.
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
