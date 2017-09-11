From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/15] unicode.7: update pointer to in-kernel Unicode
 terminal support documentation
Date: Mon, 11 Sep 2017 05:04:20 +0200
Message-ID: <20170911030420.GA30328@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The location has been changed in Linux commit v4.10-rc1~40^2~86^2~4.

* man7/unicode.7 (.SS Private Use Areas (PUA)): Amend pointer to
Documentation/unicode.txt with change introduced in Linux 4.10
(move to Documentation/admin-guide/unicode.rst).

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/unicode.7 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man7/unicode.7 b/man7/unicode.7
index 934f8ae..a5741ae 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -203,8 +203,12 @@ coordinated among all Linux users.
 The registry of the characters
 assigned to the Linux zone is maintained by LANANA and the registry
 itself is
+.I Documentation/admin\-guide/unicode.rst
+in the Linux kernel sources
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
 .I Documentation/unicode.txt
-in the Linux kernel sources.
+before Linux 4.10).
 .PP
 Two other planes are reserved for private usage, plane 15
 (Supplementary Private Use Area-A, range 0xf0000 to 0xffffd)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
