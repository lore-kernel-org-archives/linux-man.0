From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.5: document missing keywords, minor updates
Date: Mon, 13 Jun 2016 10:20:14 +0300
Message-ID: <575E5EAE.7060107@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I cross-checked the current locale.5 page against glibc locales are
fixed the following issues:

- mention define/ifdef/else/endif
- mention reorder-sections-{after,end}
- mention script
- section/section-symbol are not used, only mentioned in the ISO TR
- Fix int_currency_symbol -> int_curr_symbol typo
- few formatting fixes

---
 man5/locale.5 | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 4889d39..db20368 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -57,7 +57,7 @@ Each part can be copied from another existing locale or
 can be defined from scratch.
 If the category should be copied,
 the only valid keyword in the definition is
-.B copy
+.I copy
 followed by the name of the locale in double quotes which should be
 copied.
 The exceptions for this rule are
@@ -65,7 +65,7 @@ The exceptions for this rule are
 and
 .B LC_CTYPE
 where a
-.B copy
+.I copy
 statement can be followed by locale-specific rules and selected overrides.
 .PP
 When defining a category from scratch, all field descriptors and strings
@@ -196,7 +196,7 @@ entity.
 .I country_name
 followed by the country name in the language of the current document
 (e.g., "Deutschland" for the
-.IR de_DE
+.B de_DE
 locale).
 .TP
 .I country_post
@@ -504,8 +504,6 @@ The definition starts with the string
 in the first column.
 
 The following keywords are allowed:
-.\" FIXME The following glibc LC_COLLATE keywords are not documented:
-.\" 	script
 .TP
 .I coll_weight_max
 followed by the number representing used collation levels.
@@ -519,18 +517,32 @@ representing a multicharacter collating element.
 followed by the definition of a collating symbol
 that can be used in collation order statements.
 .TP
+.I define
+followed by
+.B string
+to be evaluated in an
+.I ifdef
+.B string
+/
+.I else
+/
+.I endif
+construct.
+.TP
 .I reorder-after
 followed by a redefinition of a collation rule.
 .TP
 .I reorder-end
 marks the end of the redefinition of a collation rule.
 .TP
-.I section
-followed by a section of collation order statements.
+.I reorder-sections-after
+followed by a script name to reorder listed scripts after.
+.TP
+.I reorder-sections-end
+marks the end of the reordering of sections.
 .TP
-.I section-symbol
-followed by a section symbol representing a set of collation order
-statements.
+.I script
+followed by a declaration of a script.
 .TP
 .I symbol-equivalence
 followed by a collating-symbol to be equivalent to another defined
@@ -599,7 +611,8 @@ followed by the name of the country/geographic extent
 to which this document applies.
 .TP
 .I audience
-followed by a description of the audience for which this document is intended.
+followed by a description of the audience for which this document is
+intended.
 .TP
 .I application
 followed by a description of any special application
@@ -833,21 +846,21 @@ The same values are recognized as for
 .TP
 .I int_p_cs_precedes
 followed by an integer that indicates the placement of
-.I int_currency_symbol
+.I int_curr_symbol
 for a nonnegative internationally formatted monetary quantity.
 The same values are recognized as for
 .IR p_cs_precedes .
 .TP
 .I int_n_cs_precedes
 followed by an integer that indicates the placement of
-.I int_currency_symbol
+.I int_curr_symbol
 for a negative internationally formatted monetary quantity.
 The same values are recognized as for
 .IR p_cs_precedes .
 .TP
 .I int_p_sep_by_space
 followed by an integer that indicates the separation of
-.IR int_currency_symbol ,
+.IR int_curr_symbol ,
 the sign string,
 and the value for a nonnegative internationally formatted monetary quantity.
 The same values are recognized as for
@@ -855,7 +868,7 @@ The same values are recognized as for
 .TP
 .I int_n_sep_by_space
 followed by an integer that indicates the separation of
-.IR int_currency_symbol ,
+.IR int_curr_symbol ,
 the sign string,
 and the value for a negative internationally formatted monetary quantity.
 The same values are recognized as for

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
