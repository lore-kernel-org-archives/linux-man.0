From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] sigpending(2): fix typos in NOTES
Date: Sun, 12 Apr 2009 20:42:41 -0400
Message-ID: <1239583361-13442-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org> describes:
In NOTES, there is the sentence "The set of signals that is pending for a
thread is the union of the set of signals that is pending for that thread
and the set of threads that is peding for the process as a whole; see
signal(7).".  The word "pending" is misspelt (missing a letter "n"); also,
"the set of threads that is pending" should be "the set of signals that is
pending".

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/sigpending.2 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/sigpending.2 b/man2/sigpending.2
index e70b614..b5a2715 100644
--- a/man2/sigpending.2
+++ b/man2/sigpending.2
@@ -64,8 +64,8 @@ See
 for details on manipulating signal sets.
 
 The set of signals that is pending for a thread
-is the union of the set of signals that is pending for that thread
-and the set of threads that is peding for the process as a whole; see
+is the union of the set of signals that are pending for that thread
+and the set of signals that are pending for the process as a whole; see
 .BR signal (7).
 
 A child created via
-- 
1.6.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
