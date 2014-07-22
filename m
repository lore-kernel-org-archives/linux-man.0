From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrouplist.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Tue, 22 Jul 2014 11:52:38 +0800
Message-ID: <1406001158-28463-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getgrouplist() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getgrouplist.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/getgrouplist.3 b/man3/getgrouplist.3
index 3d28eed..b24532a 100644
--- a/man3/getgrouplist.3
+++ b/man3/getgrouplist.3
@@ -95,6 +95,18 @@ can be used to resize the buffer passed to a further call
 .BR getgrouplist ().
 .SH VERSIONS
 This function is present since glibc 2.2.4.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getgrouplist ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 This function is nonstandard; it appears on most BSDs.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
