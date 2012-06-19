From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], glob(7): Changing 8 bit characters to 7 bit representation
Date: Tue, 19 Jun 2012 19:39:15 +0000
Message-ID: <20120619193915.GA823@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: manpages
Version: 3.41
Severity: minor
Tags: patch

  Patch:

--- glob.7	2012-06-19 00:47:16.000000000 +0000
+++ glob.7.new	2012-06-19 01:07:04.000000000 +0000
@@ -197,9 +197,7 @@
 element from its equivalence class, as defined for the
 current locale.
 For example, "\fI[[=3Da=3D]]\fP" might be equivalent
-.\" FIXME . the accented 'a' characters are not rendering properly
-.\" mtk May 2007
-to "\fI[a=E1=E0=E4=E2]\fP" (warning: Latin-1 here), that is,
+to "\fI[a\('a\(`a\(:a\(^a]\fP", that is,
 to "\fI[a[.a-acute.][.a-grave.][.a-umlaut.][.a-circumflex.]]\fP".
 .SH "SEE ALSO"
 .BR sh (1),

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
