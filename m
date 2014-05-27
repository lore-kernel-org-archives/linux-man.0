From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] localedef.1: add new page based on Debian localedef(1)
Date: Tue, 27 May 2014 10:10:45 +0200
Message-ID: <53844885.6010603@gmail.com>
References: <53834E2B.1040100@redhat.com> <53835782.10204@gmail.com> <53837379.8030600@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53837379.8030600-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Braakman <richard.braakman-4y2FMlU5MS8onNqTyK5kxQ@public.gmane.org>, Alastair McKinstry <mckinstry-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/26/2014 07:01 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> On 2014-05-26 18:02, Michael Kerrisk (man-pages) wrote:
>>
>> Thanks for doing the work needed to get this page toward man-pages.
> 
> thanks for the detailed review. I think I've addressed now all your
> comments. Wrt POSIX conformance, my reading of
> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/localedef.html
> makes me think we can state it is conforming to POSIX.1-2008.> 
> Let me know if there's anything else that needs to be adjusted.

Great stuff, Marko. I've merged this page.

I made a few minor fixes, and have one comment below.

>>From c066dbbb5f547c3b212377920e0914280a76853d Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon, 26 May 2014 19:53:13 +0300
> Subject: [PATCH] localedef.1: add new page based on Debian localedef(1)
> 
> ---
>  man1/localedef.1 |  357 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 357 insertions(+), 0 deletions(-)
>  create mode 100644 man1/localedef.1
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> new file mode 100644
> index 0000000..f5f20b8
> --- /dev/null
> +++ b/man1/localedef.1
> @@ -0,0 +1,357 @@
> +.\" Copyright (C) 2001 Richard Braakman
> +.\" Copyright (C) 2004 Alastair McKinstry
> +.\" Copyright (C) 2005 Lars Wirzenius
> +.\" Copyright (C) 2014 Marko Myllynen
> +.\" 
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\" 
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.\"
> +.\" This manual page was initially written by Richard Braakman
> +.\" on behalf of the Debian GNU/Linux Project and anyone else
> +.\" who wants it. It was amended by Alastair McKinstry to 
> +.\" explain new ISO 14652 elements, and amended further by
> +.\" Lars Wirzenius to document new functionality (as of GNU
> +.\" C library 2.3.5).
> +.\"
> +.TH LOCALEDEF 1 2014-05-26 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +localedef \- compile locale definition files
> +.SH SYNOPSIS
> +.ad l
> +.nh
> +.B localedef
> +.RI [ options ]
> +.I outputpath
> +.br
> +.B "localedef \-\-list\-archive"
> +.RI [ options ]
> +.br
> +.B "localedef \-\-delete\-from\-archive"
> +.RI [ options ]
> +.IR localename " ..."
> +.br
> +.B "localedef \-\-add\-to\-archive"
> +.RI [ options ]
> +.IR compiledpath
> +.br
> +.B "localedef \-\-version"
> +.br
> +.B "localedef \-\-help"
> +.br
> +.B "localedef \-\-usage"
> +.ad b
> +.hy
> +.SH DESCRIPTION
> +The
> +.B localedef
> +program reads the indicated
> +.I charmap
> +and
> +.I input
> +files, compiles them to a binary form quickly usable by the
> +.BR locale (7)

I changed 
"locale(7) function sin the C library" 
to 
"locale functions in the C library (setlocale(3), localeconv(3), etc.)"

Okay?

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
