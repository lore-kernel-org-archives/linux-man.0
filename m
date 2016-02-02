From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/5] futex.2: tfix
Date: Tue,  2 Feb 2016 21:50:47 +0100
Message-ID: <1454446248-448-4-git-send-email-jwilk@jwilk.net>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/futex.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 7cf0d0b..4876b97 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -199,7 +199,7 @@ The
 .I futex_op
 argument consists of two parts:
 a command that specifies the operation to be performed,
-bit-wise ORed with zero or or more options that
+bit-wise ORed with zero or more options that
 modify the behaviour of the operation.
 The options that may be included in
 .I futex_op
@@ -456,7 +456,7 @@ ordered with respect to other operations on the same futex word.
 
 Typical values to specify for
 .I val
-are 0 or or 1.
+are 0 or 1.
 (Specifying
 .BR INT_MAX
 is not useful, because it would make the
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
