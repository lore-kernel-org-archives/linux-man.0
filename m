From: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] bdflush.2, fsync.2, sync.2: rm update(8) reference
Date: Fri, 21 Mar 2014 10:30:27 -0700
Message-ID: <1395423027-29232-1-git-send-email-kir@openvz.org>
References: <1395422752-28712-1-git-send-email-kir@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395422752-28712-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Remove reference to update(8) man page, since there is no such
page. This is an ancient BSD leftover I believe.

[v2: updated to git tip]

Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man2/bdflush.2 | 3 +--
 man2/fsync.2   | 3 +--
 man2/sync.2    | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/man2/bdflush.2 b/man2/bdflush.2
index 796d8f2..b84e5bf 100644
--- a/man2/bdflush.2
+++ b/man2/bdflush.2
@@ -119,5 +119,4 @@ intended to be portable.
 .SH SEE ALSO
 .BR fsync (2),
 .BR sync (2),
-.BR sync (8),
-.BR update (8)
+.BR sync (8)
diff --git a/man2/fsync.2 b/man2/fsync.2
index 66278fa..5578e4c 100644
--- a/man2/fsync.2
+++ b/man2/fsync.2
@@ -166,5 +166,4 @@ to guarantee safe operation.
 .BR sync_file_range (2),
 .BR hdparm (8),
 .BR mount (8),
-.BR sync (8),
-.BR update (8)
+.BR sync (8)
diff --git a/man2/sync.2 b/man2/sync.2
index 11ba1e4..a597d19 100644
--- a/man2/sync.2
+++ b/man2/sync.2
@@ -120,5 +120,4 @@ large caches.)
 .BR bdflush (2),
 .BR fdatasync (2),
 .BR fsync (2),
-.BR sync (8),
-.BR update (8)
+.BR sync (8)
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
