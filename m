From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mount.2: fix: use consistent capitalization in .SS headings
Date: Wed,  6 Mar 2013 22:22:19 +0100
Message-ID: <1362604939-16250-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

First fixed by c634028ab5768, then accidentaly reverted by 2835e6c500298
---
 man2/mount.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/mount.2 b/man2/mount.2
index e979d40..45f18e7 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -435,7 +435,7 @@ would fail with
 Since Linux 2.4 the set-user-ID and set-group-ID bits are
 just silently ignored in this case.
 .\" The change is in patch-2.4.0-prerelease.
-.SS Per-process Namespaces
+.SS Per-process namespaces
 Starting with kernel 2.4.19, Linux provides
 per-process mount namespaces.
 A mount namespace is the set of file system mounts that
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
