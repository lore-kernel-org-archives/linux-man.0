From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tzset.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Mon, 4 Aug 2014 18:26:13 +0800
Message-ID: <1407147973-29332-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function tzset() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tzset.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 19ef971..e78abef 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -213,6 +213,18 @@ Often
 is a symlink to the file
 .I localtime
 or to the correct timezone file in the system timezone directory.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR tzset ()
+T}	Thread safety	MT-Safe env locale
+.TE
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
