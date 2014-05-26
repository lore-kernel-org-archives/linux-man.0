From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] localedef.1: add new page based on Debian localedef(1)
Date: Mon, 26 May 2014 17:22:35 +0300
Message-ID: <53834E2B.1040100@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010301040709090800030804"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Braakman <richard.braakman-4y2FMlU5MS8onNqTyK5kxQ@public.gmane.org>, Alastair McKinstry <mckinstry-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------010301040709090800030804
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

as discussed off-list, below is a slightly updated localedef(1) man based on Debian localedef(1). Richard, Alastair, and Lars all agreed to license their previous work under GPL2+ and I've added the license text to the page as a comment.

The actual patch is below, I've also attached the diff between this proposal and the current Debian version. I18NPATH handling was clarified (based on strace(1) output and in a way which should not need changes after the fix for https://sourceware.org/bugzilla/show_bug.cgi?id=16984 start to show up in downstreams), FILES section was updated to match recent short descriptions in other locale-related man pages, and the other example was slightly changed to better illustrate using LOCPATH.

>From 27791e8581fce43381cb138e9010298b6ddb7e67 Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 26 May 2014 17:13:00 +0300
Subject: [PATCH] localedef.1: add new page based on Debian localedef(1)

---
 man1/localedef.1 |  353 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 353 insertions(+), 0 deletions(-)
 create mode 100644 man1/localedef.1

diff --git a/man1/localedef.1 b/man1/localedef.1
new file mode 100644
index 0000000..4702cd4
--- /dev/null
+++ b/man1/localedef.1
@@ -0,0 +1,353 @@
+.\" Copyright (C) 2001 Richard Braakman
+.\" Copyright (C) 2004 Alastair McKinstry
+.\" Copyright (C) 2005 Lars Wirzenius
+.\" Copyright (C) 2014 Marko Myllynen
+.\" 
+.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 2 of
+.\" the License, or (at your option) any later version.
+.\" 
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.\" %%%LICENSE_END
+.\"
+.TH LOCALEDEF 1 2014-05-26 "Linux" "Linux Programmer's Manual"
+.SH NAME
+localedef \- compile locale definition files
+.SH SYNOPSIS
+.ad l
+.nh
+.B localedef
+.RI [ options ]
+.I outputpath
+.br
+.B "localedef \-\-list\-archive"
+.RI [ options ]
+.br
+.B "localedef \-\-delete\-from\-archive"
+.RI [ options ]
+.IR localename " ..."
+.br
+.B "localedef \-\-add\-to\-archive"
+.RI [ options ]
+.IR compiledpath
+.br
+.B "localedef \-\-version"
+.br
+.B "localedef \-\-help"
+.br
+.B "localedef \-\-usage"
+.ad b
+.hy
+.SH DESCRIPTION
+The
+.B localedef
+program reads the indicated
+.I charmap
+and
+.I input
+files, compiles them to a binary form quickly usable by the
+.BR locale (7)
+functions in the C library, and places the output in 
+.IR outputpath .
+.PP
+If
+.I outputpath
+contains a slash character ('/'), it is directly the name of the output
+directory.
+In this case, there is a separate output file for each locale category
+(LC_CTIME, LC_NUMERIC, and so on).
+.PP
+Otherwise, if the 
+.B \-\-no\-archive
+option is used,
+.I outputpath
+is the name of a subdirectory in
+.B /usr/lib/locale
+where per-category compiled files are placed.
+.PP
+Otherwise, 
+.I outputpath
+is the name of a locale and the compiled locale data is added to the
+archive file 
+.BR /usr/lib/locale/locale-archive .
+Locale archive is a memory mapped file which contains all the system 
+provided locales and it is used by all localized programs when the 
+environment variable
+.B LOCPATH
+is not set.
+.PP
+In any case,
+.B localedef
+aborts if the directory in which it tries to write locale files has
+not already been created.
+.PP
+If no
+.I charmapfile
+is given, the value
+.I ANSI_X3.4-1968
+(for ASCII) is used by default.
+If no
+.I inputfile
+is given, or if it is given as a dash
+.RB ( \- ),
+.B localedef
+reads from standard input.
+.SH OPTIONS
+Most options can have either short or long forms.  If multiple short
+options are used, they can be combined in one word (for example,
+.B \-cv 
+is identical to
+.BR "\-c \-v" ).
+.PP
+If a short option takes an argument, the argument can be given separately
+as the next word
+.RB ( "\-f foo" ), 
+or it can be written together with the option letter
+.RB ( \-ffoo ).
+If a long option takes an argument, the argument can be given separately
+as the next word, or it can be written as option=argument 
+.RB ( \-\-charmap=foo ).
+.SS "Operation selection options"
+A few options direct 
+.B localedef
+to do something else than compile locale definitions.
+Only one of these should be used at a time.
+.TP
+.B \-\-delete\-from\-archive
+Delete the named locales from the locale archive file.
+.TP
+.B \-\-list\-archive
+List the locales contained in the locale archive file.
+.TP
+.B \-\-add\-to\-archive
+Add the 
+.I compiledpath
+directories to the locale archive file.
+The directories should have been created by previous runs of 
+.BR localedef ,
+using 
+.BR \-\-no\-archive .
+.SS "Other options"
+Some of the following options are only sensible for some operations; 
+hopefully it is self-evident which ones.
+.TP
+.BI \-f " charmapfile" ", \-\-charmap=" charmapfile
+Specify the file that defines the symbolic character names that are
+used by the input file.  If
+.I charmapfile
+contains a slash character ('/'), it is directly the name of the 
+character map.  Otherwise, the file is searched from the local directory 
+and the default directory.  If the environment variable
+.B I18NPATH
+is set, 
+.B I18NPATH/charmaps/
+and
+.B I18NPATH/
+are also searched after the local directory.  This default directory is 
+printed by
+.BR "localedef \-\-help" .
+.TP
+.BI \-i " inputfile" ", \-\-inputfile=" inputfile
+Specify the locale definition file to compile.  The file is searched 
+from the local directory and the default directory.  If the environment 
+variable
+.B I18NPATH
+is set, 
+.B I18NPATH/locales/
+and
+.B I18NPATH
+are also searched after the local directory.  This default directory is 
+printed by
+.BR "localedef \-\-help" .
+.TP
+.BI \-u " repertoirefile" ", \-\-repertoire-map=" repertoirefile
+Read mappings from symbolic names to Unicode UCS4 values from
+.IR repertoirefile .
+If
+.I repertoirefile
+contains a slash character ('/'), it is directly the name of the 
+repertoire map.  Otherwise, the file is searched from the local 
+directory and the default directory.  If the environment variable
+.B I18NPATH
+is set, 
+.B I18NPATH/repertoiremaps/
+and
+.B I18NPATH
+are also searched after the local directory.  This default directory is 
+printed by
+.BR "localedef \-\-help" .
+.TP
+.BI \-A " aliasfile" ", \-\-alias\-file=" aliasfile
+Use 
+.I aliasfile
+to look up aliases for locale names.
+There is no default aliases file.
+.TP
+.BI \-\-prefix= pathname
+Set prefix to be prepended to the full archive pathname.
+By default, the prefix is empty.
+Setting the prefix to 
+.IR foo ,
+the archive would be placed in
+.BR foo/usr/lib/locale/locale-archive .
+.TP
+.B "\-c, \-\-force"
+Write the output files even if warnings were generated about the input
+file.
+.TP
+.B \-\-old\-style
+Create old-style hash tables instead of 3-level access tables.
+.TP
+.B "\-v, \-\-verbose"
+Generate extra warnings about errors that are normally ignored.
+.TP
+.B \-\-quiet
+Suppress all notifications and warnings, and report only fatal errors.
+.TP
+.B \-\-posix
+Conform strictly to POSIX.  Implies
+.BR \-\-verbose .
+This option currently has no other effect.  POSIX conformance is
+assumed if the environment variable
+.B POSIXLY_CORRECT
+is set.
+.TP
+.B \-\-replace
+Replace a locale in the locale archive file.
+Without this option, if the locale is in the archive file already,
+an error occurs.
+.TP
+.B \-\-no\-archive
+Do not use the locale archive file, instead create 
+.I outputpath
+as a subdirectory in the same directory as the locale archive file,
+and create separate output files for locale categories in it.
+.TP
+.B "\-\-help"
+Print a usage summary and exit.  Also prints the default paths used by
+.BR localedef .
+.TP
+.B "\-\-usage"
+Print a short usage summary and exit.
+.TP
+.B "\-V, \-\-version"
+Print the version number, license, and disclaimer of warranty for
+.BR localedef .
+.SH ENVIRONMENT
+.TP
+.B POSIXLY_CORRECT
+The
+.B \-\-posix
+flag is assumed if this environment variable is set.
+.TP
+.B I18NPATH
+A colon separated list of search directories for files.
+.SH FILES
+.TP
+.B /usr/share/i18n/charmaps
+Usual default charmap path.
+.TP
+.B /usr/share/i18n/locales
+Usual default path for locale source files.
+.TP
+.B /usr/share/i18n/repertoiremaps
+Usual default repertoire map path.
+.TP
+.B /usr/lib/locale/locale-archive
+Usual default locale archive location.
+.TP
+.IB outputpath/ LC_ADDRESS
+One of the output files.  It contains information about formatting
+of addresses and geography-related items.
+.TP
+.IB outputpath/ LC_COLLATE
+One of the output files.  It contains information about the rules
+for comparing strings.
+.TP
+.IB outputpath/ LC_CTYPE
+One of the output files.  It contains information about character
+classes.
+.TP
+.IB outputpath/ LC_IDENTIFICATION
+One of the output files.  It contains metadata about the locale.
+.TP
+.IB outputpath/ LC_MEASUREMENT
+One of the output files.  It contains information about locale
+measurements (metric versus US customary).
+.TP
+.IB outputpath/ LC_MESSAGES/SYS_LC_MESSAGES
+One of the output files.  It contains information about the language
+messages should be printed in, and what an affirmative or negative
+answer looks like.
+.TP
+.IB outputpath/ LC_MONETARY
+One of the output files.  It contains information about formatting
+of monetary values.
+.TP
+.IB outputpath/ LC_NAME
+One of the output files.  It contains information about salutations
+for persons.
+.TP
+.IB outputpath/ LC_NUMERIC
+One of the output files.  It contains information about formatting
+of nonmonetary numeric values.
+.TP
+.IB outputpath/ LC_PAPER
+One of the output files.  It contains information about settings
+related to standard paper size.
+.TP
+.IB outputpath/ LC_TELEPHONE
+One of the output files.  It contains information about formats
+to be used with telephone services.
+.TP
+.IB outputpath/ LC_TIME
+One of the output files.  It contains information about formatting
+of data and time values.
+.SH EXAMPLES
+Compile the locale files for Finnish in the UTF\-8 character set
+and add it to the default locale archive with the name 
+.BR fi_FI.UTF\-8 :
+.PP
+.RS
+localedef \-f UTF\-8 \-i fi_FI fi_FI.UTF\-8
+.RE
+.PP
+The same, but generate files into the 
+.B fi_FI.UTF\-8
+directory which can then be used by programs when the environment
+variable
+.B LOCPATH
+is set to the current directory (note that the last argument must 
+contain a slash):
+.PP
+.RS
+localedef \-f UTF\-8 \-i fi_FI ./fi_FI.UTF\-8
+.RE
+.SH "SEE ALSO"
+.BR locale "(5), " locale "(7), " locale (1)
+.SH AUTHOR
+The program was written by Ulrich Drepper.
+.PP
+This manual page was written by Richard Braakman <dark-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> on
+behalf of the Debian GNU/Linux Project and anyone else who wants it.
+It was amended by Alastair McKinstry <mckinstry-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org> to 
+explain new ISO 14652 elements,
+and amended further by Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org> to document new
+functionality (as of GNU C library 2.3.5).
+The manpage is not supported by the GNU libc maintainers.
+.SH STANDARDS
+This program conforms to the POSIX standard P1003.2.
-- 
1.7.1

Thanks,

-- 
Marko Myllynen

--------------010301040709090800030804
Content-Type: text/x-patch;
 name="localedef-diff.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="localedef-diff.patch"

--- a/localedef.1.debian
+++ b/localedef.1
@@ -1,4 +1,30 @@
-.TH LOCALEDEF 1 "May 20, 2005"
+.\" Copyright (C) 2001 Richard Braakman
+.\" Copyright (C) 2004 Alastair McKinstry
+.\" Copyright (C) 2005 Lars Wirzenius
+.\" Copyright (C) 2014 Marko Myllynen
+.\" 
+.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 2 of
+.\" the License, or (at your option) any later version.
+.\" 
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.\" %%%LICENSE_END
+.\"
+.TH LOCALEDEF 1 2014-05-26 "Linux" "Linux Programmer's Manual"
 .SH NAME
 localedef \- compile locale definition files
 .SH SYNOPSIS
@@ -58,6 +84,11 @@
 is the name of a locale and the compiled locale data is added to the
 archive file 
 .BR /usr/lib/locale/locale-archive .
+Locale archive is a memory mapped file which contains all the system 
+provided locales and it is used by all localized programs when the 
+environment variable
+.B LOCPATH
+is not set.
 .PP
 In any case,
 .B localedef
@@ -67,8 +98,8 @@
 If no
 .I charmapfile
 is given, the value
-.I POSIX
-is used by default.
+.I ANSI_X3.4-1968
+(for ASCII) is used by default.
 If no
 .I inputfile
 is given, or if it is given as a dash
@@ -111,29 +142,54 @@
 using 
 .BR \-\-no\-archive .
 .SS "Other options"
-Some of the following options are only sensible for some operations; hopefully it is self-evident which ones.
+Some of the following options are only sensible for some operations; 
+hopefully it is self-evident which ones.
 .TP
 .BI \-f " charmapfile" ", \-\-charmap=" charmapfile
 Specify the file that defines the symbolic character names that are
-used by the input file.  If the file is in the default directory for
-character maps, it is not necessary to specify the full pathname.
-This default directory is printed by
+used by the input file.  If
+.I charmapfile
+contains a slash character ('/'), it is directly the name of the 
+character map.  Otherwise, the file is searched from the local directory 
+and the default directory.  If the environment variable
+.B I18NPATH
+is set, 
+.B I18NPATH/charmaps/
+and
+.B I18NPATH/
+are also searched after the local directory.  This default directory is 
+printed by
 .BR "localedef \-\-help" .
 .TP
 .BI \-i " inputfile" ", \-\-inputfile=" inputfile
-Specify the locale definition file to compile.  If
-.I inputfile
-is not absolute,
-.B localedef
-will also look in the directories specified by the environment variable
+Specify the locale definition file to compile.  The file is searched 
+from the local directory and the default directory.  If the environment 
+variable
+.B I18NPATH
+is set, 
+.B I18NPATH/locales/
+and
 .B I18NPATH
-and in the default directory for locale definition files.  This default
-directory is printed by
+are also searched after the local directory.  This default directory is 
+printed by
 .BR "localedef \-\-help" .
 .TP
 .BI \-u " repertoirefile" ", \-\-repertoire-map=" repertoirefile
 Read mappings from symbolic names to Unicode UCS4 values from
 .IR repertoirefile .
+If
+.I repertoirefile
+contains a slash character ('/'), it is directly the name of the 
+repertoire map.  Otherwise, the file is searched from the local 
+directory and the default directory.  If the environment variable
+.B I18NPATH
+is set, 
+.B I18NPATH/repertoiremaps/
+and
+.B I18NPATH
+are also searched after the local directory.  This default directory is 
+printed by
+.BR "localedef \-\-help" .
 .TP
 .BI \-A " aliasfile" ", \-\-alias\-file=" aliasfile
 Use 
@@ -154,7 +210,7 @@
 file.
 .TP
 .B \-\-old\-style
-Create old-style tables.
+Create old-style hash tables instead of 3-level access tables.
 .TP
 .B "\-v, \-\-verbose"
 Generate extra warnings about errors that are normally ignored.
@@ -165,7 +221,7 @@
 .B \-\-posix
 Conform strictly to POSIX.  Implies
 .BR \-\-verbose .
-This option currently has no other effect.  Posix conformance is
+This option currently has no other effect.  POSIX conformance is
 assumed if the environment variable
 .B POSIXLY_CORRECT
 is set.
@@ -199,7 +255,7 @@
 flag is assumed if this environment variable is set.
 .TP
 .B I18NPATH
-A colon separated list of default directories for locale definition files.
+A colon separated list of search directories for files.
 .SH FILES
 .TP
 .B /usr/share/i18n/charmaps
@@ -214,67 +270,72 @@
 .B /usr/lib/locale/locale-archive
 Usual default locale archive location.
 .TP
+.IB outputpath/ LC_ADDRESS
+One of the output files.  It contains information about formatting
+of addresses and geography-related items.
+.TP
 .IB outputpath/ LC_COLLATE
-One of the output files.  It describes the rules for comparing strings
-in the locale's alphabet.
+One of the output files.  It contains information about the rules
+for comparing strings.
 .TP
 .IB outputpath/ LC_CTYPE
 One of the output files.  It contains information about character
-cases and case conversions for the locale.
+classes.
 .TP
-.IB outputpath/ LC_MONETARY
-One of the output files.  It describes the way monetary values should
-be formatted in the locale.
+.IB outputpath/ LC_IDENTIFICATION
+One of the output files.  It contains metadata about the locale.
+.TP
+.IB outputpath/ LC_MEASUREMENT
+One of the output files.  It contains information about locale
+measurements (metric versus US customary).
 .TP
 .IB outputpath/ LC_MESSAGES/SYS_LC_MESSAGES
 One of the output files.  It contains information about the language
 messages should be printed in, and what an affirmative or negative
 answer looks like.
 .TP
-.IB outputpath/ LC_NUMERIC
-One of the output files.  It describes the rules for formatting
-numbers in the locale.
-.TP
-.IB outputpath/ LC_TIME
-One of the output files.  It describes the rules for formatting
-times and dates in the locale.
-.TP
-.IB outputpath/ LC_PAPER
-One of the output files. It describes the default paper size 
-in the locale.
+.IB outputpath/ LC_MONETARY
+One of the output files.  It contains information about formatting
+of monetary values.
 .TP
 .IB outputpath/ LC_NAME
-One of the output files. It describes the rules for formatting
-names in the locale.
+One of the output files.  It contains information about salutations
+for persons.
 .TP
-.IB outputpath/ LC_ADDRESS
-One of the output files. It describes the rules for formatting
-addresses, and other location information in the locale.
+.IB outputpath/ LC_NUMERIC
+One of the output files.  It contains information about formatting
+of nonmonetary numeric values.
 .TP
-.IB outputpath/ LC_TELEPHONE
-One of the output files. It describes the rules for formatting
-telephone numbers in the locale.
+.IB outputpath/ LC_PAPER
+One of the output files.  It contains information about settings
+related to standard paper size.
 .TP
-.IB outputpath/ LC_MEASUREMENT
-One of the output files. It describes the rules for measurement in the
-locale, e.g. Metric or other units.
+.IB outputpath/ LC_TELEPHONE
+One of the output files.  It contains information about formats
+to be used with telephone services.
 .TP
-.IB outputpath/ LC_IDENTIFICATION
-One of the output files. It identifies the elements within the locale.
+.IB outputpath/ LC_TIME
+One of the output files.  It contains information about formatting
+of data and time values.
 .SH EXAMPLES
-Compile the locale files for Finnish in the UTF-8 character set
+Compile the locale files for Finnish in the UTF\-8 character set
 and add it to the default locale archive with the name 
-.BR fi_FI.UTF-8 :
+.BR fi_FI.UTF\-8 :
 .PP
 .RS
 localedef \-f UTF\-8 \-i fi_FI fi_FI.UTF\-8
 .RE
 .PP
-The same, but generate files into the current directory (note that the
-last argument must then contain a slash):
+The same, but generate files into the 
+.B fi_FI.UTF\-8
+directory which can then be used by programs when the environment
+variable
+.B LOCPATH
+is set to the current directory (note that the last argument must 
+contain a slash):
 .PP
 .RS
-localedef \-f UTF\-8 \-i fi_FI ./
+localedef \-f UTF\-8 \-i fi_FI ./fi_FI.UTF\-8
 .RE
 .SH "SEE ALSO"
 .BR locale "(5), " locale "(7), " locale (1)
@@ -287,7 +348,6 @@
 explain new ISO 14652 elements,
 and amended further by Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org> to document new
 functionality (as of GNU C library 2.3.5).
-The manpage is not supported by the GNU libc maintainers and may be
-out of date.
+The manpage is not supported by the GNU libc maintainers.
 .SH STANDARDS
-This program conforms to the POSIX standard P1003.2
+This program conforms to the POSIX standard P1003.2.

--------------010301040709090800030804--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
