From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpwnam.3: ffix
Date: Mon, 15 Sep 2014 11:57:37 +0800
Message-ID: <1410753457-21041-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fenv.3     | 2 +-
 man3/getpwnam.3 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/fenv.3 b/man3/fenv.3
index 6884202..6db7c86 100644
--- a/man3/fenv.3
+++ b/man3/fenv.3
@@ -270,7 +270,7 @@ For an explanation of the terms used in this section, see
 .TS
 allbox;
 lb lb lb
-lw38 l l.
+lw37 l l.
 Interface	Attribute	Value
 T{
 .BR feclearexcept (),
diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
index f14a637..512ca9e 100644
--- a/man3/getpwnam.3
+++ b/man3/getpwnam.3
@@ -219,7 +219,7 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw22 lb lb
+lbw26 lb lb
 l l l.
 Interface	Attribute	Value
 T{
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
