From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getaddrinfo_a.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 11 Jun 2015 10:04:22 +0800
Message-ID: <1433988270-8599-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think
* getaddrinfo_a(),
* gai_suspend(),
* gai_error(),
* gai_cancel(),
are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getaddrinfo_a.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/getaddrinfo_a.3 b/man3/getaddrinfo_a.3
index 3bbf6aa..7673b16 100644
--- a/man3/getaddrinfo_a.3
+++ b/man3/getaddrinfo_a.3
@@ -302,6 +302,22 @@ The
 .BR gai_strerror (3)
 function translates these error codes to a human readable string,
 suitable for error reporting.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw31 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getaddrinfo_a (),
+.BR gai_suspend (),
+.BR gai_error (),
+.BR gai_cancel ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions;
 they first appeared in glibc in version 2.2.3.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
