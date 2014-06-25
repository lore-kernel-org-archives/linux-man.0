From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] des_crypt.3: tfix
Date: Wed, 25 Jun 2014 09:31:35 +0800
Message-ID: <1403659895-4567-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/basename.3  | 2 +-
 man3/des_crypt.3 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/basename.3 b/man3/basename.3
index 48e8bd3..3d90e31 100644
--- a/man3/basename.3
+++ b/man3/basename.3
@@ -131,7 +131,7 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw22 lb lb
+lbw21 lb lb
 l l l.
 Interface	Attribute	Value
 T{
diff --git a/man3/des_crypt.3 b/man3/des_crypt.3
index 9a4ee56..5dfe345 100644
--- a/man3/des_crypt.3
+++ b/man3/des_crypt.3
@@ -136,12 +136,12 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw24 lb lb
+lbw25 lb lb
 l l l.
 Interface	Attribute	Value
 T{
 .BR ecb_crypt (),
-.BR cbc_crypt ()
+.BR cbc_crypt (),
 .BR des_setparity ()
 T}	Thread safety	MT-Safe
 .TE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
