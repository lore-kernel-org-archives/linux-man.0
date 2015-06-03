From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getaddrinfo.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 3 Jun 2015 18:16:26 +0800
Message-ID: <1433326594-25001-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think getaddrinfo(), freeaddrinfo() and
gai_strerror() are thread-safe. But, there are not markings
of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getaddrinfo.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 4e8a55b..b2004fe 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -592,6 +592,23 @@ function translates these error codes to a human readable string,
 suitable for error reporting.
 .SH FILES
 .I /etc/gai.conf
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw15 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getaddrinfo ()
+T}	Thread safety	MT-Safe env locale
+T{
+.BR freeaddrinfo (),
+.BR gai_strerror ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 The
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
