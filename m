From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: locale.5: correct variable name
Date: Fri, 16 Jan 2015 02:26:18 +0900
Message-ID: <CALhU9tnv1zWxb6O00=L6TGrWX2Vjmp_wA2hAUW_GGaYhQQu5EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I think "positive_sign" is used.

diff --git a/man5/locale.5 b/man5/locale.5
index 64444e0..e73a471 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -785,7 +785,7 @@ The same values are recognized as for
 .TP
 .I int_p_sign_posn
 followed by an integer that indicates where the
-.I negative_sign
+.I positive_sign
 should be placed for a nonnegative
 internationally formatted monetary quantity.
 The same values are recognized as for

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
