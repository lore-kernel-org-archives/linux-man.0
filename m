From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], cp1251(7): table too wide
Date: Wed, 9 May 2012 19:46:51 +0000
Message-ID: <20120509194651.GA23531@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: man-pages
Version: 3.40
Severity: minor
Tags: patch

  From "nroff -ww -t ...":

warning: around line 44: table wider than line width

  Columns are made narrower (column gutter decreased).

  Patch:

--- cp1251.7	2012-04-26 22:58:39.000000000 +0000
+++ cp1251.7.new	2012-05-09 02:05:59.000000000 +0000
@@ -37,7 +37,7 @@
 The fourth column will only show the proper glyphs
 in an environment configured for CP\ 1251.
 .TS
-l l l c lp-1.
+l2 l2 l2 c2 lp-1.
 Oct	Dec	Hex	Char	Description
 _
 200	128	80	=80	CYRILLIC CAPITAL LETTER DJE

--=20
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
