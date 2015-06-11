From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getrpcent_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 11 Jun 2015 10:04:25 +0800
Message-ID: <1433988270-8599-5-git-send-email-zenglg.jy@cn.fujitsu.com>
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
* getrpcent_r(),
* getrpcbyname_r(),
* getrpcbynumber_r(),
are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getrpcent_r.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/getrpcent_r.3 b/man3/getrpcent_r.3
index 56609ac..53452c7 100644
--- a/man3/getrpcent_r.3
+++ b/man3/getrpcent_r.3
@@ -127,6 +127,21 @@ is too small.
 Try again with a larger buffer
 (and increased
 .IR buflen ).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw19 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getrpcent_r (),
+.BR getrpcbyname_r (),
+.BR getrpcbynumber_r ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions.
 Functions with similar names exist on some other systems,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
