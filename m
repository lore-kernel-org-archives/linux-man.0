From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iconvconfig.8: New page for iconvconfig(8)
Date: Wed, 11 Jun 2014 11:09:47 +0300
Message-ID: <53980ECB.7000307@redhat.com>
References: <5396C42D.9070806@redhat.com> <53975FC5.9060305@gmail.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53975FC5.9060305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-06-10 22:43, Michael Kerrisk (man-pages) wrote:
> On 06/10/2014 10:39 AM, Marko Myllynen wrote:
>>
>> while writing the iconv(1) page I noticed there was no page for
>> iconvconfig(8) so I wrote one, please see below.
> 
> Again, some comments below. Could you address and send a v2, please.

ok, please see below, hopefully the explanation are now clearer without going into too low level details.

>From 01f14067fc7769b750c431c0c0b0f60a43e001d6 Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Wed, 11 Jun 2014 08:40:05 +0300
Subject: [PATCH] iconvconfig.8: New page for iconvconfig(8)

---
 man8/iconvconfig.8 |  101 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 man8/iconvconfig.8

diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
new file mode 100644
index 0000000..0c3afe8
--- /dev/null
+++ b/man8/iconvconfig.8
@@ -0,0 +1,101 @@
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
+.BR iconv(3)
+function internally uses
+.I gconv
+modules to convert to and from a character set.
+A configuration file is used to determine the needed modules
+for a conversion.
+Loading and parsing such a configuration file would slow down
+.BR iconv(3)
+using programs so a caching mechanism has been introduced.
+
+The
+.B iconvconfig
+program reads iconv module configuration files and writes
+a fastloading gconv module configuration cache file.
+In addition to the system provided gconv modules, user can specify 
+custom gconv module directories with the environment variable
+.BR GCONV_PATH .
+However, iconv module configuration caching is only used when
+the environment variable
+.BR GCONV_PATH
+is not set.
+.SH OPTIONS
+.TP
+.B "\-\-nostdlib"
+Do not search the system default gconv directory,
+only the directories provided on the command line.
+.TP
+.BI \-o " outputfile" ", \-\-output=" outputfile
+Use
+.I outputfile
+for output instead of the system default cache location.
+.TP
+.BI \-\-prefix= pathname
+Set the prefix to be prepended to the system pathnames.
+See FILES, below.
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
+.BR iconv (1),
+.BR iconv (3)
-- 
1.7.1

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
