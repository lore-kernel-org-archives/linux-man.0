From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] math_error.7: fix typo
Date: Wed, 31 Aug 2011 23:49:11 +0900
Message-ID: <4E5E49E7.8070207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: just a typo.


diff --git a/man7/math_error.7 b/man7/math_error.7
--- a/man7/math_error.7
+++ b/man7/math_error.7
@@ -169,7 +169,7 @@ positive number in the specified type").
.I errno
may be set to
.BR ERANGE ,
-and an "overflow"
+and an "underflow"
.RB ( FE_UNDERFLOW )
floating-point exception may be raised.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
