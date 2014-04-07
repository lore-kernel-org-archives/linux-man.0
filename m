From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] isalpha.3, stat.2: tfix
Date: Mon,  7 Apr 2014 19:46:18 +0200
Message-ID: <1396892778-11630-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/stat.2    | 2 +-
 man3/isalpha.3 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/stat.2 b/man2/stat.2
index 7cbf088..0ac48d5 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -547,7 +547,7 @@ field and the file-type component of the
 field of the
 .IR stat
 structure.
-POSIX.-2008 tightens the specification, requiring
+POSIX.1-2008 tightens the specification, requiring
 .BR lstat ()
 to return valid information in all fields except the permission bits in
 .IR st_mode .
diff --git a/man3/isalpha.3 b/man3/isalpha.3
index 4364d52..6ebe741 100644
--- a/man3/isalpha.3
+++ b/man3/isalpha.3
@@ -289,7 +289,7 @@ POSIX.1-2008 marks
 as obsolete,
 noting that it cannot be used portably in a localized application.
 
-POSIX.-1-2008 specifies
+POSIX.1-2008 specifies
 .BR isalnum_l (),
 .BR isalpha_l (),
 .BR isblank_l (),
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
