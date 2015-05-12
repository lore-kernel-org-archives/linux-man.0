From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document character transliteration
Date: Tue, 12 May 2015 16:58:58 +0300
Message-ID: <55520722.5040800@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. da_DK for reference.

(Not sure should we actually provide an example here?)

---
 man5/locale.5 |   31 ++++++++++++++++++++++++++++---
 1 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 16bf39c..ae60879 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -249,9 +249,6 @@ The definition starts with the string
 in the first column.
 
 The following keywords are allowed:
-.\" FIXME The following LC_CTYPE keywords are not documented:
-.\"	translit_start + translit_end
-.\"	include
 .TP
 .I upper
 followed by a list of uppercase letters.
@@ -460,6 +457,34 @@ for input digits for the locale.
 followed by a list of mapping pairs of
 alternate separators
 for output for the locale.
+.TP
+.I translit_start
+marks the start of the transliteration rules section.
+The section can contain the
+.I include
+keyword in the beginning followed by
+locale specific rules and overrides.
+Any rule specified in the locale file
+will override any rule
+copied or included from other files.
+In case of duplicate rule definitions in the locale file,
+only the first rule is used.
+
+A transliteration rule consist of a character to be transliterated
+followed by a list of transliteration targets separated by semicolons.
+The first target which can be presented in the target character set
+is used, if none of them can be used the
+.I default_missing
+character will be used instead.
+.TP
+.I include
+in the transliteration rules section includes
+a transliteration rule file
+(and optionally a repertoire map file)
+.
+.TP
+.I translit_end
+marks the end of the transliteration rules.
 .PP
 The
 .B LC_CTYPE
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
