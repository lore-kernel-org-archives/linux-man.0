From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 05/24] mq_getattr.3: Fix prototype
Date: Wed, 21 May 2014 16:57:36 +0200
Message-ID: <1400684275-20972-6-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The newattr parameter to mq_setattr is const.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/mq_getattr.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
index 121faa1..dbe8125 100644
--- a/man3/mq_getattr.3
+++ b/man3/mq_getattr.3
@@ -32,7 +32,7 @@ mq_getattr, mq_setattr \- get/set message queue attributes
 .sp
 .BI "int mq_getattr(mqd_t " mqdes ", struct mq_attr *" attr );
 
-.BI "int mq_setattr(mqd_t " mqdes ", struct mq_attr *" newattr ","
+.BI "int mq_setattr(mqd_t " mqdes ", const struct mq_attr *" newattr ","
 .BI "                 struct mq_attr *" oldattr );
 .fi
 .sp
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
