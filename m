From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tempnam.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 14 Jul 2014 15:32:07 +0800
Message-ID: <1405323127-6238-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function tempnam() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tempnam.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/tempnam.3 b/man3/tempnam.3
index caf1867..aad5a0f 100644
--- a/man3/tempnam.3
+++ b/man3/tempnam.3
@@ -102,6 +102,18 @@ set to indicate the cause of the error.
 .TP
 .B ENOMEM
 Allocation of storage failed.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR tempnam ()
+T}	Thread safety	MT-Safe env
+.TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 POSIX.1-2008 marks
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
