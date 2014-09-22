From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] isalpha.3: tfix
Date: Mon, 22 Sep 2014 17:17:09 +0800
Message-ID: <1411377429-20255-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/isalpha.3 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man3/isalpha.3 b/man3/isalpha.3
index a7f3b0c..346cc7f 100644
--- a/man3/isalpha.3
+++ b/man3/isalpha.3
@@ -223,13 +223,12 @@ The values returned are nonzero if the character
 .I c
 falls into the tested class, and zero if not.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
 For an explanation of the terms used in this section, see
 .BR attributes (7).
 .ad l
 .TS
 allbox;
-lbw33 lb lb
+lbw32 lb lb
 l l l.
 Interface	Attribute	Value
 T{
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
