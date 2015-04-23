From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setlogmask.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Thu, 23 Apr 2015 12:51:48 +0800
Message-ID: <1429764710-8598-8-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- setlogmask: MT-Unsafe race:LogMask

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setlogmask.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/setlogmask.3 b/man3/setlogmask.3
index fe708f4..4d45d98 100644
--- a/man3/setlogmask.3
+++ b/man3/setlogmask.3
@@ -72,6 +72,19 @@ This function returns the previous log priority mask.
 None.
 .\" .SH NOTES
 .\" The glibc logmask handling was broken in versions before glibc 2.1.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw22
+l l l.
+Interface	Attribute	Value
+T{
+.BR setlogmask ()
+T}	Thread safety	MT-Unsafe race:LogMask
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 Note that the description in POSIX.1-2001 is flawed.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
