From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] sigaltstack.2: tfix
Date: Wed, 8 Nov 2017 16:17:16 +0900
Message-ID: <1ff0f184-9625-4cc2-9cc9-49a8a11be3d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Changes.old also contains a reference to the nonexistent POSIX.1-2009. ;-)
---
 man2/sigaltstack.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
index 0a21eb7b4..69d8126a7 100644
--- a/man2/sigaltstack.2
+++ b/man2/sigaltstack.2
@@ -183,7 +183,7 @@ T{
 T}    Thread safety    MT-Safe
 .TE
 .SH CONFORMING TO
-POSIX.1-2001, POSIX.1-2009, SUSv2, SVr4.
+POSIX.1-2001, POSIX.1-2008, SUSv2, SVr4.
 .SH NOTES
 The most common usage of an alternate signal stack is to handle the
 .B SIGSEGV
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
