From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] getdtablesize.2, attr.5: Move .so directive to first line
Date: Tue, 21 Mar 2017 01:08:35 +0100
Message-ID: <20170321010835.384cad5c.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Improves compatibility with the man and other dumb tools
that process man page files.

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
 man2/getdtablesize.2 | 2 +-
 man5/attr.5          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getdtablesize.2 b/man2/getdtablesize.2
index d9be980..68c2fd8 100644
--- a/man2/getdtablesize.2
+++ b/man2/getdtablesize.2
@@ -1,2 +1,2 @@
-.\" Created 2013-02-05; will eventually be removed
 .so man3/getdtablesize.3
+.\" Created 2013-02-05; will eventually be removed
diff --git a/man5/attr.5 b/man5/attr.5
index 577f0c9..e979971 100644
--- a/man5/attr.5
+++ b/man5/attr.5
@@ -1,2 +1,2 @@
-.\" Page was imported from 'attr' project which had it in Section 5
 .so man7/xattr.7
+.\" Page was imported from 'attr' project which had it in Section 5
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
