From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [PATCH] man-pages.7: srcfix, ffix: some cleaning of the manual
Date: Mon, 12 Feb 2018 20:00:08 +0000
Message-ID: <20180212200008.GA29784@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Test nr. 2: Fix warning from man/groff

<standard input>:484 (macro IR): only 1 argument, but more are expected
<standard input>:728 (macro IR): only 1 argument, but more are expected
<standard input>:771 (macro IR): only 1 argument, but more are expected

chk_manuals: Output is from: test-groff -Tutf8 -b -e -mandoc -rF0 -t -w w -z

####

Test nr. 18: Change \\ to \e to print the escape character

229:following the "\\\-") should be in lowercase,
476:by preceding words with the string "\\%".
527:(Using this format, rather than the use of "\\fB...\\fP()"
816:at either end of this subphrase\(emin *roff is with the macro "\\(em".
879:    \\\-
886:    \\(aqC\\(aq

#####

  NO PATCH PROVIDED

Test nr. 19: Use a macro to change to italic font

39:when writing man pages for the Linux \fIman-pages\fP project,
142:For those few \fIman-pages\fP pages in Sections 1 and 8,
167:the \fIman-pages\fP package, use
215:traditional headings, with some subsections (\fI.SS\fP) within
429:subsections (\fBSS\fP) named \fILinux Notes\fP and \fIGlibc Notes\fP.
446:see \fIExample Programs\fP below.
912:warnings when compiled with \fIcc\ \-Wall\fP.

#####

Test nr. 21: Avoid space at the beginning of a text line, use a request
or a macro to create the indent, or use "\&" where that cannot be used

524:    .BR fcntl ()
593:    .BR intro (2)
632:    .SS Unicode under Linux
653:    .PP
654:    .in +4n
655:    .EX
656:    int
657:    main(int argc, char *argv[])
658:    {
659:        return 0;
660:    }
661:    .EE
662:    .in
663:    .PP
765:     DG/UX
766:     HP-UX
767:     UNIX
768:     UnixWare
801:     BROWSER=firefox man -H pagename
826:    32-bit value
827:    command-line argument
828:    floating-point number
829:    run-time check
830:    user-space function
831:    wide-character string
839:    interprocess
840:    multithreaded
841:    multiprocess
842:    nonblocking
843:    nondefault
844:    nonempty
845:    noninteractive
846:    nonnegative
847:    nonportable
848:    nonzero
849:    preallocated
850:    precreate
851:    prerecorded
852:    reestablished
853:    reinitialize
854:    rearm
855:    reread
856:    subcomponent
857:    subdirectory
858:    subsystem
864:    non-ASCII
865:    non-English
866:    non-NULL
867:    non-real-time
879:    \\\-
886:    \\(aqC\\(aq
925:    indent \-npro \-kr \-i4 \-ts4 \-sob \-l72 \-ss \-nut \-psl prog.c
929:     exit(EXIT_SUCCESS);
930:     exit(EXIT_FAILURE);
934:    exit(0);
935:    exit(1);
936:    return n;
944:    .SS Program source

#####

Test nr. 23: Change a HYPHEN-MINUS (code 0x55, 2D) to a dash
(minus) if it matches " -[:alpha:]" or \(aq-[:alpha:] (for options)

801:     BROWSER=firefox man -H pagename

#####

Test nr. 27: Wrong distance between sentences or protect the indicator.
1) Separate the sentences, each begins on a new line.
See man-pages(7) and "info groff".
Or
2) Adjust space between sentences (two spaces),
3) or protect the indicator by adding "\&" after it.
The "indicator" is an "end-of-sentence character" (.!?).

824:(i.e., to qualify a following noun). Some examples:

#####

  NO PATCH PROVIDED

Test nr. 29: Change a block of comments to a block inside
.ig

..
The .\" at the beginning of each line is then not needed.

  Lines 11 to 29 (inclusive) and 355 to 369 (inclusive)

Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
---
 man7/man-pages.7 | 176 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 99 insertions(+), 77 deletions(-)

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index dbc8f55d9..7373e9b2d 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -226,7 +226,7 @@ See
 for important details of the line(s) that should follow the
 \fB.SH NAME\fP command.
 All words in this line (including the word immediately
-following the "\\\-") should be in lowercase,
+following the "\e\-") should be in lowercase,
 except where English or technical terminological convention
 dictates otherwise.
 .TP
@@ -473,7 +473,7 @@ and
 (don't hyphenate)
 directives.
 Hyphenation of individual page names can be prevented
-by preceding words with the string "\\%".
+by preceding words with the string "\e%".
 .IP
 Given the distributed, autonomous nature of FOSS projects
 and their documentation, it is sometimes necessary\(emand in many cases
@@ -481,7 +481,7 @@ desirable\(emthat the SEE ALSO section includes references to
 manual pages provided by other projects.
 .SH STYLE GUIDE
 The following subsections describe the preferred style for the
-.IR man-pages
+.I man-pages
 project.
 For details not covered below, the Chicago Manual of Style
 is usually a good source;
@@ -519,12 +519,12 @@ For example, in the
 man page, references to the subject of the page would be written as:
 .BR fcntl ().
 The preferred way to write this in the source file is:
-.PP
+.IP "" 4n
 .EX
-    .BR fcntl ()
+\&.BR fcntl ()
 .EE
 .PP
-(Using this format, rather than the use of "\\fB...\\fP()"
+(Using this format, rather than the use of "\efB...\efP()"
 makes it easier to write tools that parse man page source files.)
 .\"
 .SS Formatting conventions (general)
@@ -570,7 +570,8 @@ be specified in italics.
 Again, the use of nonbreaking spaces may be appropriate
 if the expression is inlined with normal text.
 .PP
-When showing example shell sessions, user input should be formatted in bold, for example
+When showing example shell sessions, user input should be formatted in bold,
+for example
 .PP
 .in +4n
 .EX
@@ -588,9 +589,9 @@ formatted in Roman (normal) font, without any
 separating spaces (e.g.,
 .BR intro (2)).
 The preferred way to write this in the source file is:
-.PP
+.IP "" 4n
 .EX
-    .BR intro (2)
+\&.BR intro (2)
 .EE
 .PP
 (Including the section number in cross references lets tools like
@@ -627,9 +628,9 @@ capitalize the first word in the heading, but otherwise use lowercase,
 except where English usage (e.g., proper nouns) or programming
 language requirements (e.g., identifier names) dictate otherwise.
 For example:
-.PP
+.IP "" 4n
 .EX
-    .SS Unicode under Linux
+\&.SS Unicode under Linux
 .EE
 .\"
 .SS Indentation of structure definitions, shell session logs, and so on
@@ -650,17 +651,17 @@ For example:
 .PP
 .in +4n
 .EX
-    .PP
-    .in +4n
-    .EX
-    int
-    main(int argc, char *argv[])
-    {
-        return 0;
-    }
-    .EE
-    .in
-    .PP
+\&.PP
+\&.in +4n
+\&.EX
+int
+main(int argc, char *argv[])
+{
+\&    return 0;
+}
+\&.EE
+\&.in
+\&.PP
 .EE
 .in
 .SS Preferred terms
@@ -721,7 +722,7 @@ zeros	zeroes
 .TE
 .PP
 See also the discussion
-.IR "Hyphenation of attributive compounds"
+.I "Hyphenation of attributive compounds"
 below.
 .SS Terms to avoid
 The following table lists some terms to avoid using in man pages,
@@ -757,14 +758,16 @@ Unixes	UNIX systems
 Use the correct spelling and case for trademarks.
 The following is a list of the correct spellings of various
 relevant trademarks that are sometimes misspelled:
-.PP
-     DG/UX
-     HP-UX
-     UNIX
-     UnixWare
+.IP "" 5n
+.nf
+DG/UX
+HP-UX
+UNIX
+UnixWare
+.fi
 .SS NULL, NUL, null pointer, and null character
 A
-.IR "null pointer"
+.I "null pointer"
 is a pointer that points to nothing,
 and is normally indicated by the constant
 .IR NULL .
@@ -793,8 +796,8 @@ macro pair
 .BR groff_man (7)).
 This produces proper hyperlinks that can be used in a web browser,
 when rendering a page with, say:
-.PP
-     BROWSER=firefox man -H pagename
+.IP "" 5n
+BROWSER=firefox man \-H pagename
 .SS Use of e.g., i.e., etc., a.k.a., and similar
 In general, the use of abbreviations such as "e.g.", "i.e.", "etc.", "a.k.a."
 should be avoided, in favor of suitable full wordings
@@ -808,7 +811,7 @@ Always include periods in such abbreviations, as shown here.
 In addition, "e.g." and "i.e." should always be followed by a comma.
 .SS Em-dashes
 The way to write an em-dash\(emthe glyph that appears
-at either end of this subphrase\(emin *roff is with the macro "\\(em".
+at either end of this subphrase\(emin *roff is with the macro "\e(em".
 (On an ASCII terminal, an em-dash typically renders as two hyphens,
 but in other typographical contexts it renders as a long dash.)
 Em-dashes should be written
@@ -816,50 +819,57 @@ Em-dashes should be written
 surrounding spaces.
 .SS Hyphenation of attributive compounds
 Compound terms should be hyphenated when used attributively
-(i.e., to qualify a following noun). Some examples:
-.PP
-    32-bit value
-    command-line argument
-    floating-point number
-    run-time check
-    user-space function
-    wide-character string
+(i.e., to qualify a following noun).
+Some examples:
+.IP "" 4n
+.nf
+32-bit value
+command-line argument
+floating-point number
+run-time check
+user-space function
+wide-character string
+.fi
 .SS Hyphenation with multi, non, pre, re, sub, and so on
 The general tendency in modern English is not to hyphenate
 after prefixes such as "multi", "non", "pre", "re", "sub", and so on.
 Manual pages should generally follow this rule when these prefixes are
 used in natural English constructions with simple suffixes.
 The following list gives some examples of the preferred forms:
-.PP
-    interprocess
-    multithreaded
-    multiprocess
-    nonblocking
-    nondefault
-    nonempty
-    noninteractive
-    nonnegative
-    nonportable
-    nonzero
-    preallocated
-    precreate
-    prerecorded
-    reestablished
-    reinitialize
-    rearm
-    reread
-    subcomponent
-    subdirectory
-    subsystem
+.IP "" 4n
+.nf
+interprocess
+multithreaded
+multiprocess
+nonblocking
+nondefault
+nonempty
+noninteractive
+nonnegative
+nonportable
+nonzero
+preallocated
+precreate
+prerecorded
+reestablished
+reinitialize
+rearm
+reread
+subcomponent
+subdirectory
+subsystem
+.fi
 .PP
 Hyphens should be retained when the prefixes are used in nonstandard
 English words, with trademarks, proper nouns, acronyms, or compound terms.
 Some examples:
-.PP
-    non-ASCII
-    non-English
-    non-NULL
-    non-real-time
+.IP "" 4n
+.nf
+non-ASCII
+non-English
+non-NULL
+non-real-time
+.fi
 .PP
 Finally, note that "re-create" and "recreate" are two different verbs,
 and the former is probably what you want.
@@ -868,15 +878,15 @@ Where a real minus character is required (e.g., for numbers such as \-1,
 or when writing options that have a leading dash, such as in
 .IR "ls\ \-l"),
 use the following form in the man page source:
-.PP
-    \\\-
+.IP "" 4n
+\e\-
 .PP
 This guideline applies also to code examples.
 .SS Character constants
 To produce single quotes that render well in both ASCII and UTF-8,
 use the following form for character constants in the man page source:
-.PP
-    \\(aqC\\(aq
+.IP "" 4n
+\e(aqC\e(aq
 .PP
 where
 .I C
@@ -915,18 +925,28 @@ Ritchie style, with 4-space indents.
 The following command can be used to format your source code to
 something close to the preferred style:
 .IP
-    indent \-npro \-kr \-i4 \-ts4 \-sob \-l72 \-ss \-nut \-psl prog.c
+.in +4n
+indent \-npro \-kr \-i4 \-ts4 \-sob \-l72 \-ss \-nut \-psl prog.c
+.in
 .IP *
 For consistency, all example programs should terminate using either of:
 .IP
-     exit(EXIT_SUCCESS);
-     exit(EXIT_FAILURE);
+.nf
+.in +5n
+exit(EXIT_SUCCESS);
+exit(EXIT_FAILURE);
+.in
+.fi
 .IP
 Avoid using the following forms to terminate a program:
 .IP
-    exit(0);
-    exit(1);
-    return n;
+.nf
+.in +4n
+exit(0);
+exit(1);
+return n;
+.in
+.fi
 .IP *
 If there is extensive explanatory text before the
 program source code, mark off the source code
@@ -934,7 +954,9 @@ with a subsection heading
 .IR "Program source" ,
 as in:
 .IP
-    .SS Program source
+.in +4n
+\&.SS Program source
+.in
 .IP
 Always do this if the explanatory text includes a shell session log.
 .PP
-- 
2.15.1

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
