From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] erfc.3: wfix
Date: Tue, 29 Oct 2013 14:10:59 +0800
Message-ID: <1383027059-31147-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/erfc.3 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man3/erfc.3 b/man3/erfc.3
index 800794d..7ea6eec 100644
--- a/man3/erfc.3
+++ b/man3/erfc.3
@@ -135,7 +135,10 @@ also conforms to
 SVr4, 4.3BSD.
 .SH NOTES
 The
-.BR erfc ()
+.BR erfc (),
+.BR erfcf (),
+and
+.BR erfcl ()
 functions are provided to avoid the loss accuracy that
 would occur for the calculation 1-erf(x) for large values of
 .IR x
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
