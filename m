From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] a64l.3: Fix a function name mixup: s/a64l/l64a/
Date: Fri, 02 Jul 2010 17:03:07 +0800
Message-ID: <4C2DAB4B.4080200@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/a64l.3 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/a64l.3 b/man3/a64l.3
index dbcb897..f0d7d64 100644
--- a/man3/a64l.3
+++ b/man3/a64l.3
@@ -3,7 +3,7 @@
 .\"
 .\" Corrected, aeb, 2002-05-30
 .\"
-.TH A64L 3 2007-07-26 "" "Linux Programmer's Manual"
+.TH A64L 3 2010-07-02 "" "Linux Programmer's Manual"
 .SH NAME
 a64l, l64a \- convert between long and base-64
 .SH SYNOPSIS
@@ -54,7 +54,7 @@ So 123 = 59*64^0 + 1*64^1 = "v/".
 POSIX.1-2001.
 .SH NOTES
 The value returned by
-.BR a64l ()
+.BR l64a ()
 may be a pointer to a static buffer, possibly overwritten
 by later calls.
 .LP
-- 
1.6.0.1


-- 
Regards
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
