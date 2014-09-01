From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] re_comp.3: Reformat thread-safety information
Date: Mon, 1 Sep 2014 11:07:52 +0800
Message-ID: <1409540872-27320-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/re_comp.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/re_comp.3 b/man3/re_comp.3
index d027023..9c04dc7 100644
--- a/man3/re_comp.3
+++ b/man3/re_comp.3
@@ -64,12 +64,18 @@ otherwise it returns a pointer to an appropriate error message.
 .BR re_exec ()
 returns 1 for a successful match, zero for failure.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR re_comp ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR re_comp (),
 .BR re_exec ()
-functions are not thread-safe.
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 4.3BSD.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
