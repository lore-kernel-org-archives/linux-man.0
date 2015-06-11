From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setaliasent.3: ATTRIBUTES: Note functions that are/aren't thread-safe
Date: Thu, 11 Jun 2015 10:04:30 +0800
Message-ID: <1433988270-8599-10-git-send-email-zenglg.jy@cn.fujitsu.com>
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
* setaliasent(),
* endaliasent(),
* getaliasent_r(),
* getaliasbyname_r(),
are thread-safe. And
* getaliasent(),
* getaliasbyname(),
are not thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setaliasent.3 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/man3/setaliasent.3 b/man3/setaliasent.3
index d78fd43..c8dd7d3 100644
--- a/man3/setaliasent.3
+++ b/man3/setaliasent.3
@@ -98,6 +98,26 @@ The default alias database is the file
 This can be changed in the
 .I /etc/nsswitch.conf
 file.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw19 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR setaliasent (),
+.BR endaliasent (),
+.BR getaliasent_r (),
+.BR getaliasbyname_r ()
+T}	Thread safety	MT-Safe locale
+T{
+.BR getaliasent (),
+.BR getaliasbyname ()
+T}	Thread safety	MT-Unsafe
+.TE
+
 .SH CONFORMING TO
 These routines are glibc-specific.
 The NeXT system has similar routines:
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
