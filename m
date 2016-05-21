From: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] open.2: refer to correct functions in description of O_TMPFILE
Date: Sat, 21 May 2016 18:00:15 -0500
Message-ID: <1463871615-1982-1-git-send-email-ebiggers3@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/open.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/open.2 b/man2/open.2
index 012d0c4..6403776 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -726,8 +726,8 @@ functionality: race-free creation of temporary files that
 .IP *
 Creating a file that is initially invisible, which is then populated
 with data and adjusted to have appropriate filesystem attributes
-.RB ( chown (2),
-.BR chmod (2),
+.RB ( fchown (2),
+.BR fchmod (2),
 .BR fsetxattr (2),
 etc.)
 before being atomically linked into the filesystem
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
