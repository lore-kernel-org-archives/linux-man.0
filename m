From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconvconfig.8: New page for iconvconfig(8)
Date: Wed, 11 Jun 2014 12:29:12 +0200
Message-ID: <53982F78.5090504@gmail.com>
References: <5396C42D.9070806@redhat.com> <53975FC5.9060305@gmail.com> <53980ECB.7000307@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53980ECB.7000307-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/11/2014 10:09 AM, Marko Myllynen wrote:
> Hi,
> 
> On 2014-06-10 22:43, Michael Kerrisk (man-pages) wrote:
>> On 06/10/2014 10:39 AM, Marko Myllynen wrote:
>>>
>>> while writing the iconv(1) page I noticed there was no page for
>>> iconvconfig(8) so I wrote one, please see below.
>>
>> Again, some comments below. Could you address and send a v2, please.
> 
> ok, please see below, hopefully the explanation are now clearer
> without going into too low level details.
> 
>>From 01f14067fc7769b750c431c0c0b0f60a43e001d6 Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 11 Jun 2014 08:40:05 +0300
> Subject: [PATCH] iconvconfig.8: New page for iconvconfig(8)
> 
> ---
>  man8/iconvconfig.8 |  101 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 101 insertions(+), 0 deletions(-)
>  create mode 100644 man8/iconvconfig.8
> 
> diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
> new file mode 100644
> index 0000000..0c3afe8
> --- /dev/null
> +++ b/man8/iconvconfig.8
> @@ -0,0 +1,101 @@
> +'\" t -*- coding: UTF-8 -*-
> +.\"
> +.\" Copyright (C) 2014 Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> +.TH ICONVCONFIG 8 2014-06-09 "GNU" "Linux System Administration"
> +.SH NAME
> +iconvconfig \- create iconv module configuration cache
> +.SH SYNOPSIS
> +.B iconvconfig
> +.RI [ options ]
> +.RI [ directory ]...
> +.SH DESCRIPTION
> +The
> +.BR iconv(3)
> +function internally uses
> +.I gconv
> +modules to convert to and from a character set.
> +A configuration file is used to determine the needed modules
> +for a conversion.
> +Loading and parsing such a configuration file would slow down
> +.BR iconv(3)
> +using programs so a caching mechanism has been introduced.
> +
> +The
> +.B iconvconfig
> +program reads iconv module configuration files and writes
> +a fastloading gconv module configuration cache file.

I see that since you wrote the last version, you did a s/iconv/gconv/
in the above line. That typo really confused me before; now things make 
more sense.

Patch applied. Thanks for the new page!

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
