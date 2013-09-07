From: James Cloos <cloos-GRsvFm/Gh/pBDgjK7y7TUQ@public.gmane.org>
Subject: Wrong coding tags for 8859 pages
Date: Sat, 07 Sep 2013 09:00:39 -0400
Message-ID: <m3k3is3hwv.fsf@carbon.jhcloos.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain

iso_8859-13.7 claims to be:

    '\" t -*- coding: ISO-8859-7 -*-

Obviously that should be ISO-8859-13.

Fixing it enables groff -k to guess the coding system and accurately
typeset the document.

A signed commit can be pulled from:

   git://people.freedesktop.org/~cloos/man-pages.git

or it is inlined below:


--=-=-=
Content-Type: text/diff; charset=utf-8
Content-Disposition: inline;
 filename=0001-iso_8859-13.7-Fix-coding-system-tag.patch
Content-Transfer-Encoding: 8bit

>From 40c3f24fe3f1850ee90f3c32dc77ada33b09fa62 Mon Sep 17 00:00:00 2001
From: James Cloos <cloos-GRsvFm/Gh/pBDgjK7y7TUQ@public.gmane.org>
Date: Sat, 7 Sep 2013 08:51:21 -0400
Subject: [PATCH] iso_8859-13.7: Fix coding system tag.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Groff’s preconv(1) uses the coding tag to guess the file’s encoding.
Otherwise, groff(1) generates bogus output from this file.

Signed-off-by: James Cloos <cloos-GRsvFm/Gh/pBDgjK7y7TUQ@public.gmane.org>
---
 man7/iso_8859-13.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/iso_8859-13.7 b/man7/iso_8859-13.7
index 87797bb..82a6263 100644
--- a/man7/iso_8859-13.7
+++ b/man7/iso_8859-13.7
@@ -1,4 +1,4 @@
-'\" t -*- coding: ISO-8859-7 -*-
+'\" t -*- coding: ISO-8859-13 -*-
 .\" Copyright 2009   Lefteris Dimitroulakis (edimitro-6VGm6rrshF0@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
-- 
1.8.3.2


--=-=-=
Content-Type: text/plain


-JimC
-- 
James Cloos <cloos-GRsvFm/Gh/pBDgjK7y7TUQ@public.gmane.org>         OpenPGP: 1024D/ED7DAEA6

--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
