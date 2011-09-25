From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] lseek.2: Document SEEK_HOLE/SEEK_DATA on FreeBSD and
 DragonFlyBSD
Date: Sun, 25 Sep 2011 06:15:33 +0200
Message-ID: <20110925041533.GA10286@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
---
 man2/lseek.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/lseek.2 b/man2/lseek.2
index 9a59fa6..2f9cd8f 100644
--- a/man2/lseek.2
+++ b/man2/lseek.2
@@ -193,7 +193,7 @@ SVr4, 4.3BSD, POSIX.1-2001.
 .BR SEEK_DATA
 and
 .BR SEEK_HOLE
-are nonstandard extensions also present in Solaris;
+are nonstandard extensions also present in Solaris, FreeBSD and DragonFlyBSD;
 they are proposed for inclusion in the next POSIX revision (Issue 8).
 .\" FIXME . Review http://austingroupbugs.net/view.php?id=415 in the future
 .SH NOTES
-- 
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
