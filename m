From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] resolver.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 11 Jun 2015 10:04:29 +0800
Message-ID: <1433988270-8599-9-git-send-email-zenglg.jy@cn.fujitsu.com>
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
* res_ninit(),
* res_nquery(),
* res_nsearch(),
* res_nquerydomain(),
* res_nmkquery(),
* res_nsend(),
* dn_comp(),
* dn_expand()
are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/resolver.3 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/man3/resolver.3 b/man3/resolver.3
index ef12b4f..996b1ab 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -431,6 +431,28 @@ of the compressed name, or \-1 if an error occurs.
 /etc/resolv.conf          resolver configuration file
 /etc/host.conf            resolver configuration file
 .fi
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw19 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR res_ninit (),
+.BR res_nquery (),
+.BR res_nsearch (),
+.BR res_nquerydomain (),
+.BR res_nsend ()
+T}	Thread safety	MT-Safe locale
+T{
+.BR res_nmkquery (),
+.BR dn_comp (),
+.BR dn_expand ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 4.3BSD.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
