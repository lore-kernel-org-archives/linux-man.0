From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] iconvconfig.8: New page for iconvconfig(8)
Date: Tue, 10 Jun 2014 11:39:09 +0300
Message-ID: <5396C42D.9070806@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

while writing the iconv(1) page I noticed there was no page for iconvconfig(8) so I wrote one, please see below.

>From 566561b63db0fe709570d3c5aca6262065d64f71 Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 9 Jun 2014 17:10:12 +0300
Subject: [PATCH] iconvconfig.8: New page for iconvconfig(8)

---
 man8/iconvconfig.8 |   86 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 man8/iconvconfig.8

diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
new file mode 100644
index 0000000..db7d926
--- /dev/null
+++ b/man8/iconvconfig.8
@@ -0,0 +1,86 @@
+'\" t -*- coding: UTF-8 -*-
+.\"
+.\" Copyright (C) 2014 Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
+.TH ICONVCONFIG 8 2014-06-09 "GNU" "Linux System Administration"
+.SH NAME
+iconvconfig \- create iconv module configuration cache
+.SH SYNOPSIS
+.B iconvconfig
+.RI [ options ]
+.RI [ directory ]...
+.SH DESCRIPTION
+The
+.B iconvconfig
+program reads iconv module configuration files and writes
+a fastloading iconv module configuration cache file.
+Only the system default cache file is used by programs like
+.BR iconv (1),
+caching is disabled when additional gconv module directories
+are specified with the environment variable
+.BR GCONV_PATH .
+.SH OPTIONS
+.TP
+.B "\-\-nostdlib"
+Do not search the system default gconv directory,
+only those provided on the command line.
+.TP
+.BI \-o " outputfile" ", \-\-output=" outputfile
+Use
+.I outputfile
+for output instead of the system default cache location.
+.TP
+.BI \-\-prefix= pathname
+Set the prefix to be prepended to the system pathnames.
+By default, the prefix is empty.
+Setting the prefix to
+.IR foo ,
+the gconv module configuration would be read from
+.IR foo/usr/lib/gconv/gconv-modules
+and the cache would be written to
+.IR foo/usr/lib/gconv/gconv-modules.cache .
+.TP
+.B "\-\-help"
+Print a usage summary and exit.
+.TP
+.B "\-\-usage"
+Print a short usage summary and exit.
+.TP
+.B "\-V, \-\-version"
+Print the version number, license, and disclaimer of warranty for
+.BR iconv .
+.SH EXIT STATUS
+Zero on success, non-zero on errors.
+.SH FILES
+.TP
+.I /usr/lib/gconv
+Usual default gconv module path.
+.TP
+.I /usr/lib/gconv/gconv-modules
+Usual default gconv module configuration.
+.TP
+.I /usr/lib/gconv/gconv-modules.cache
+Usual default gconv module configuration cache.
+.SH "SEE ALSO"
+.BR iconv (1)
-- 
1.7.1

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
