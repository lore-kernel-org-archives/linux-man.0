From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: copy is not exclusive in LC_CTYPE and LC_COLLATE
Date: Tue, 12 May 2015 16:58:32 +0300
Message-ID: <55520708.5030306@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. da_DK for reference.

---
 man5/locale.5 |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index b0dca21..9a32fa0 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -57,6 +57,13 @@ the only valid keyword in the definition is
 .B copy
 followed by the name of the locale in double quotes which should be
 copied.
+The exceptions for this rule are
+.B LC_COLLATE
+and
+.B LC_CTYPE
+where a
+.B copy
+statement can be followed by locale specific rules and selected overrides.
 .PP
 When defining a category from scratch, all field descriptors and strings
 should be defined as Unicode code points in angle brackets, unless
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
