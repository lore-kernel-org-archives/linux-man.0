From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] stdin.3: tfix
Date: Wed, 8 Nov 2017 16:07:57 +0900
Message-ID: <af7f4589-ac90-c0e9-e6b7-2e1f323f48cf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Added missing parenthesis.

---
 man3/stdin.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/stdin.3 b/man3/stdin.3
index bc4d1b01d..1d5f44815 100644
--- a/man3/stdin.3
+++ b/man3/stdin.3
@@ -27,7 +27,7 @@ for it when it starts up, one for input, one for output, and one for
 printing diagnostic or error messages.
 These are typically attached to
 the user's terminal (see
-.BR tty (4)
+.BR tty (4))
 but might instead refer to files or other devices, depending on what
 the parent process chose to set up.
 (See also the "Redirection" section of
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
