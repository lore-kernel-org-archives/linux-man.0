From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] wordexp.3: Make it clear that WRDE_NOCMD prevents command
 substitution.
Date: Wed, 19 Nov 2014 14:45:12 -0500
Message-ID: <546CF348.5080400@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The use of WRDE_NOCMD prevents command substitution. If the flag
WRDE_NOCMD is set then no command substitution shall occur and
the error WRDE_CMDSUB will be returned if such substitution is
requested when processing the words.

The manual page as-is makes it seem like the command substitution
occurs, and an error is returned *after* the substitution.

This patch clarifies that.

Patch against trunk.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man3/wordexp.3 b/man3/wordexp.3
index c695c08..e457943 100644
--- a/man3/wordexp.3
+++ b/man3/wordexp.3
@@ -169,7 +169,7 @@ flag
 told us to consider this an error.
 .TP
 .B WRDE_CMDSUB
-Command substitution occurred, and the
+Command substitution requested, but the
 .B WRDE_NOCMD
 flag told us to consider this an error.
 .TP
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
