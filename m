From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] iso_8859-6.7: charset pages unification, minor cleanups
Date: Tue, 30 Sep 2014 13:30:06 +0300
Message-ID: <542A862E.1080408@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

- adjust references
- remove stray comments
- cosmetics
---
 man7/iso_8859-6.7 |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/man7/iso_8859-6.7 b/man7/iso_8859-6.7
index dcbe58f..84799f8 100644
--- a/man7/iso_8859-6.7
+++ b/man7/iso_8859-6.7
@@ -29,7 +29,8 @@ and hexadecimal
 .SH DESCRIPTION
 The ISO 8859 standard includes several 8-bit extensions to the ASCII
 character set (also known as ISO 646-IRV).
-ISO 8859-6 encodes the characters used in the Arabic language.
+ISO 8859-6 encodes the
+characters used in the Arabic language.
 .SS ISO 8859 alphabets
 The full set of ISO 8859 alphabets includes:
 .TS
@@ -55,8 +56,6 @@ The following table displays the characters in ISO 8859-6, which
 are printable and unlisted in the
 .BR ascii (7)
 manual page.
-.\" The fourth column will only show the proper glyphs
-.\" in an environment configured for ISO 8859-6.
 .TS
 l l l c lp-1.
 Oct	Dec	Hex	Char	Description
@@ -117,4 +116,6 @@ _
 ISO 8859-6 lacks the glyphs required for many related languages,
 such as Urdu and Persian (Farsi).
 .SH SEE ALSO
-.BR ascii (7)
+.BR ascii (7),
+.BR charsets (7),
+.BR utf-8 (7)
-- 
1.7.1

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
