From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] repertoiremap.5: New page for repertoiremap(5)
Date: Thu, 05 Jun 2014 14:30:10 +0200
Message-ID: <539062D2.8090808@gmail.com>
References: <538EB3FE.4050104@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538EB3FE.4050104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/04/2014 07:51 AM, Marko Myllynen wrote:
> Hi,
> 
> the patch description says it all. I guess this page is worth adding
> although nobody should use repertoire maps anymore (they were removed
> from glibc over a decade ago).

Thanks. Applied.

Cheers,

Michael


> 
>>From 700d0744d4ca78d90aad9779ac44f31eb7a10935 Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon, 2 Jun 2014 16:37:01 +0300
> Subject: [PATCH] repertoiremap.5: New page for repertoiremap(5)
> 
> Rather obsolete feature but localedef(1) refers to repertoiremaps.
> ---
>  man5/repertoiremap.5 |   72 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 72 insertions(+), 0 deletions(-)
>  create mode 100644 man5/repertoiremap.5
> 
> diff --git a/man5/repertoiremap.5 b/man5/repertoiremap.5
> new file mode 100644
> index 0000000..fc8cab1
> --- /dev/null
> +++ b/man5/repertoiremap.5
> @@ -0,0 +1,72 @@
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
> +.TH REPERTOIREMAP 5 2014-06-02 "GNU" "Linux User Manual"
> +.SH NAME
> +repertoiremap \- map symbolic character names to Unicode code points
> +.SH DESCRIPTION
> +A repertoire map defines mappings between symbolic character names and
> +Unicode code points when compiling a locale with
> +.BR localedef (1).
> +Using a repertoire map is optional, it is only needed when symbolic
> +names are used instead of now preferred Unicode code points.
> +.SS Syntax
> +The repertoiremap file starts with a header that may consist of the
> +following keywords:
> +.TP
> +.I <comment_char>
> +is followed by a character that will be used as the
> +comment character for the rest of the file.
> +It defaults to the number sign (#).
> +.TP
> +.I <escape_char>
> +is followed by a character that should be used as the escape character
> +for the rest of the file to mark characters that should be interpreted
> +in a special way.
> +It defaults to the backslash (\\).
> +.PP
> +The mapping section starts with the keyword
> +.B CHARIDS
> +in the first column.
> +
> +The mapping lines have the following form:
> +.TP
> +.I <symbolic-name> <code-point> <comment>
> +This defines exactly one mapping,
> +.I <comment>
> +being optional.
> +.PP
> +The mapping section ends with the string
> +.IR "END CHARIDS" .
> +.SH FILES
> +.TP
> +.I /usr/share/i18n/repertoiremaps
> +Usual default repertoire map path.
> +.SH CONFORMING TO
> +POSIX.2.
> +.SH NOTES
> +Repertoire maps are deprecated in favor of Unicode code points.
> +.SH SEE ALSO
> +.BR locale (1),
> +.BR localedef (1),
> +.BR charmap (5),
> +.BR locale (5)
> --
> 1.7.1
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
