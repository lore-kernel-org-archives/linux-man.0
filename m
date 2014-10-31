From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fenv.3: tfix in thread-safety information
Date: Fri, 31 Oct 2014 16:31:53 +0800
Message-ID: <1414744313-6972-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

fegetexceptflag() should be modified to feraiseexcept().

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fenv.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/fenv.3 b/man3/fenv.3
index 6db7c86..bea73f9 100644
--- a/man3/fenv.3
+++ b/man3/fenv.3
@@ -270,12 +270,12 @@ For an explanation of the terms used in this section, see
 .TS
 allbox;
 lb lb lb
-lw37 l l.
+lw35 l l.
 Interface	Attribute	Value
 T{
 .BR feclearexcept (),
 .BR fegetexceptflag (),
-.BR fegetexceptflag (),
+.BR feraiseexcept (),
 .BR fesetexceptflag (),
 .BR fetestexcept (),
 .BR fegetround (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
