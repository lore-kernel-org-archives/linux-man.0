From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] proc.5: tfix
Date: Tue,  7 Jun 2016 11:19:23 +0200
Message-ID: <1465291164-5486-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/proc.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index c84319b..2f8b51c 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -133,10 +133,10 @@ whether other users are running any program at all, and so on).
 Specifies the ID of a group whose members are authorized to
 learn process information otherwise prohibited by
 .BR hidepid
-(ie/e/, users in this group behave as though
+(i.e., users in this group behave as though
 .I /proc
 was mounted with
-.IR hidepid=0 .
+.IR hidepid=0 ).
 This group should be used instead of approaches such as putting
 nonroot users into the
 .BR sudoers (5)
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
