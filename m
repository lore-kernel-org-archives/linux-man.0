From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] keyctl.2: tfix
Date: Fri, 17 Mar 2017 00:31:01 +0100
Message-ID: <20170316233101.1343-2-jwilk@jwilk.net>
References: <20170316233101.1343-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170316233101.1343-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Remove duplicated word.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/keyctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index 3da3489d5..a9bc4d571 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -136,7 +136,7 @@ does not exist depends on the value of
 If
 .I arg3
 contains a non-zero value, then\(emif it is appropriate to do so
-(e.g., when looking up the the user, user-session, or session key)\(ema new key is created and its real key ID returned as the function result.
+(e.g., when looking up the user, user-session, or session key)\(ema new key is created and its real key ID returned as the function result.
 .\" The keyctl_get_keyring_ID.3 page says that a new key
 .\" "will be created *if it is appropriate to do so**. What is the
 .\" determiner for appropriate?
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
