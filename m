From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] keyctl.2: remove www.tmac inclusion
Date: Mon, 11 Sep 2017 05:11:07 +0200
Message-ID: <20170911031107.GA5221@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Commit man-pages-4.12-229-gdf81149 removed the only usage of .URL macro
(introduced in man-pages-4.12-228-ga02cbc7), so www.tmac is not needed
anymore.

* man2/keyctl.2 (.mso www.tmac): Remove it.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/keyctl.2 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index 9f58b71..ed132e5 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -25,7 +25,6 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.mso www.tmac
 .TH KEYCTL 2 2017-03-13 Linux "Linux Key Management Calls"
 .SH NAME
 keyctl \- manipulate the kernel's key management facility
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
