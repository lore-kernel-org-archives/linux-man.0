From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] Clarify $LANGUAGE description
Date: Thu, 4 Dec 2008 02:53:26 +0100
Message-ID: <20081204015326.GS10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch (against the latest git) attempts to clean up the $LANGUAGE
description, by removing bogus comments from setlocale(3) and expanding
the mention in locale(7).

Maybe you will decide that a more detailed description should be left
to the gettext(3) documentation, but I actually care about the invisible
part of the patch more since the comments have put me off the track
initially ($LANGUAGE has nothing to do with setlocale(3) and is
completely isolated to gettext, as obvious from the glibc sources).

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/setlocale.3 b/man3/setlocale.3
index a5d9896..21eebfb 100644
--- a/man3/setlocale.3
+++ b/man3/setlocale.3
@@ -26,6 +26,7 @@
 .\" Modified Sun Jul  4 14:52:16 1999 by Bruno Haible (haible-dhnC2lb7rBJy/B6EtB590w@public.gmane.org)
 .\" Modified Tue Aug 24 17:11:01 1999 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\" Modified Tue Feb  6 03:31:55 2001 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
+.\" Modified Thu Dec  4 02:34:27 2008 by Petr Baudis (pasky-AlSwsSmVLrQ@public.gmane.org)
 .\"
 .TH SETLOCALE 3  1999-07-04 "GNU" "Linux Programmer's Manual"
 .SH NAME
@@ -88,13 +89,7 @@ is
 each part of the locale that should be modified is set according to the
 environment variables.
 The details are implementation-dependent.
-For glibc, first
-.\" [This is false on my system - must check which library versions do this]
-.\" if
-.\" .I category
-.\" is LC_MESSAGES, the environment variable LANGUAGE is inspected,
-.\" then
-(regardless of
+For glibc, first (regardless of
 .IR category ),
 the environment variable
 .B LC_ALL
@@ -113,8 +108,6 @@ If its value is not a valid locale specification, the locale
 is unchanged, and
 .BR setlocale ()
 returns NULL.
-.\" The environment variable LANGUAGE may contain several, colon-separated,
-.\" locale names.
 .PP
 The locale
 .B """C"""
diff --git a/man7/locale.7 b/man7/locale.7
index 3da0ed7..8236e0f 100644
--- a/man7/locale.7
+++ b/man7/locale.7
@@ -24,6 +24,7 @@
 .\" Modified Sun Jun 01 17:16:34 1997 by Jochen Hein
 .\"   <jochen.hein-JaLWT6YIeqAVwOsi8Avp+rNAH6kLmebB@public.gmane.org>
 .\" Modified Thu Apr 25 00:43:19 2002 by Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
+.\" Modified Thu Dec  4 02:34:27 2008 by Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
 .\"
 .TH LOCALE 7  1993-04-24 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -98,7 +99,10 @@ and
 functions to ease the use of these information.
 The GNU gettext family of
 functions also obey the environment variable
-.BR LANGUAGE .
+.BR LANGUAGE
+(containing a colon-separated list of locales)
+if the category is set to a valid locale other than
+.BR """C""" .
 .TP
 .B LC_NUMERIC
 changes the information used by the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
