From: Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 1/2] proc.5: ffix
Date: Sun,  5 Nov 2017 20:04:50 +0100
Message-ID: <20171105190451.16059-1-mail@lucaswerkmeister.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index eeba1cfe6..01be63417 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -671,7 +671,7 @@ and
 in
 .IR /proc/self/fd .
 Thus the example command above could be written as:
-.PP
+.IP
 .in +4n
 .EX
 .RB "$" " foobar \-i /dev/stdin \-o /dev/stdout ..."
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
