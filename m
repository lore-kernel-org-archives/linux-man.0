From: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 2/2] eventfd.2: correction on preserving across execve(2)
Date: Fri, 20 Aug 2010 15:30:43 +0300
Message-ID: <1282307443-28511-2-git-send-email-virtuoso@slind.org>
References: <1282307443-28511-1-git-send-email-virtuoso@slind.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1282307443-28511-1-git-send-email-virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
---
 man2/eventfd.2 |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/man2/eventfd.2 b/man2/eventfd.2
index 2071e48..1b4f752 100644
--- a/man2/eventfd.2
+++ b/man2/eventfd.2
@@ -186,7 +186,10 @@ eventfd object.
 File descriptors created by
 .BR eventfd ()
 are preserved across
-.BR execve (2).
+.BR execve (2)
+unless
+.BR EFD_CLOEXEC
+flag has been used.
 .SH "RETURN VALUE"
 On success,
 .BR eventfd ()
-- 
1.7.2.1.45.gb66c2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
