From: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] madvise.2: update the description for MADV_REMOVE
Date: Wed, 25 Jun 2014 07:31:01 +0800
Message-ID: <53AA0A35.9060100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Currently we have more filesystems supporting fallcate, e.g ext4/btrfs,
which can response to MADV_REMOVE gracefully.

Update the MADV_REMOVE description.

Signed-off-by: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/madvise.2 | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
index 032ead7..510530c 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -99,12 +99,8 @@ or zero-fill-on-demand pages for mappings
 without an underlying file.
 .TP
 .BR MADV_REMOVE " (since Linux 2.6.16)"
-Free up a given range of pages
-and its associated backing store.
-Currently,
-.\" 2.6.18-rc5
-only shmfs/tmpfs supports this; other filesystems return with the
-error
+Free up a given range of pages and its associated backing store.
+Filesystems that don't support fallocate will return error
 .BR ENOSYS .
 .\" Databases want to use this feature to drop a section of their
 .\" bufferpool (shared memory segments) - without writing back to
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
