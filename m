From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wctrans.3: Reformat thread-safety information
Date: Wed, 25 Jun 2014 10:41:17 +0800
Message-ID: <1403664077-9474-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wctrans.3 | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/man3/wctrans.3 b/man3/wctrans.3
index abc9603..5828d4b 100644
--- a/man3/wctrans.3
+++ b/man3/wctrans.3
@@ -60,13 +60,17 @@ is valid.
 Otherwise, it returns
 .IR "(wctrans_t)\ 0" .
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR wctrans ()
-function is thread-safe with exceptions.
-It can be safely used in multithreaded applications, as long as
-.BR setlocale (3)
-is not called to change the locale during its execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
