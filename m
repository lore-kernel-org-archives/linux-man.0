From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: charmap.5: remove accidental ISO C compliance reference
Date: Wed, 18 Jun 2014 14:11:38 +0300
Message-ID: <53A173EA.3050809@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

a horrible braino slipped to charmap(5) introduction, it's probably best just to remove it (alternatively something could be stated about locales and charsets but perhas this is not the right place for it).

>From 46d2c698320125eb5e12a9dba2179931717a172f Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Wed, 18 Jun 2014 10:52:34 +0300
Subject: [PATCH] charmap.5: remove accidental ISO C compliance reference

glibc refers in locale/programs/charmap.c to ISO C 99 section 7.17.(2)
and ISO C 99 section 5.2.1.(3) that if a character map is not ASCII
compatible then the locale using it is not ISO C compliant. This does
not state anything about the character set itself.
---
 man5/charmap.5 |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/man5/charmap.5 b/man5/charmap.5
index b9b2084..463e72d 100644
--- a/man5/charmap.5
+++ b/man5/charmap.5
@@ -22,8 +22,6 @@ charmap \- characters to define character sets
 .SH DESCRIPTION
 A character set description (charmap) defines all available characters
 and their encodings in a character set.
-All ISO C compliant character sets should have
-the ASCII character set as a proper subset.
 .SS Syntax
 The charmap file starts with a header that may consist of the
 following keywords:
-- 
1.7.1

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
