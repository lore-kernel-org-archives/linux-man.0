From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] grantpt.3, ptsname.3, unlockpt.3: Feature Test Macros
 changed with glibc 2.24
Date: Fri, 16 Jun 2017 09:42:18 +0200
Message-ID: <052d3d7c-d41a-41a3-5d0c-af44e1f7e3b7@gmail.com>
References: <595b2bb0-5596-d9c4-5e1b-096f16632cc4@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <595b2bb0-5596-d9c4-5e1b-096f16632cc4-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ferdinand Thiessen <f.thiessen-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/17/2017 07:11 PM, Ferdinand Thiessen wrote:
> Hello,
> 
> since glibc version 2.24, the feature test macros for grantpt.3,
> ptsname.3 and unlockpt.3 have changed.

Thanks, Ferdinand. Patch applied, with some tweaks.

Cheers,

Michael

> They require extended xopen (XPG4), see also glibc bug 20094 or commit
> 0014680d6a5bdeb4fe17682450105ebed19f35da.
> 
> Feel free to use my patch (diff against git master).
> 
> Regards,
> 
> Ferdinand
> 
>>From 31f18659356006895cf61a2080b12f9da9fee35b Mon Sep 17 00:00:00 2001
> From: Ferdinand Thiessen <rpm-72ZESRCRCi9n68oJJulU0Q@public.gmane.org>
> Date: Fri, 17 Mar 2017 17:49:14 +0100
> Subject: [PATCH] grantpt.3, ptsname.3, unlockpt.3: Feature Test Macros changed
>  with glibc 2.24
> 
> ---
>  man3/grantpt.3  | 23 +++++++++++++++++++----
>  man3/ptsname.3  | 33 +++++++++++++++++++++++++--------
>  man3/unlockpt.3 | 22 ++++++++++++++++++----
>  3 files changed, 62 insertions(+), 16 deletions(-)
> 
> diff --git a/man3/grantpt.3 b/man3/grantpt.3
> index e92bedc..978dde6 100644
> --- a/man3/grantpt.3
> +++ b/man3/grantpt.3
> @@ -2,17 +2,28 @@
>  .\" This page is in the public domain. - aeb
>  .\" %%%LICENSE_END
>  .\"
> +.\" 2017-03-17, f.thiessen, updated feature test macros
> +.\"
>  .TH GRANTPT 3 2015-08-08 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  grantpt \- grant access to the slave pseudoterminal
>  .SH SYNOPSIS
> -.nf
> -.BR "#define _XOPEN_SOURCE" "       /* See feature_test_macros(7) */"
> -.br
>  .B #include <stdlib.h>
>  .sp
>  .BI "int grantpt(int " fd ");"
> -.fi
> +.sp
> +.in -4n
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.ad l
> +.BR grantpt ():
> +.br
> +.RS 4
> +_XOPEN_SOURCE\ >=\ 500 || (_XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED)
> +.RE
> +.ad
>  .SH DESCRIPTION
>  The
>  .BR grantpt ()
> @@ -74,6 +85,10 @@ This is part of the UNIX 98 pseudoterminal support, see
>  Many systems implement this function via a set-user-ID helper binary
>  called "pt_chown".
>  With Linux devpts no such helper binary is required.
> +.sp
> +Prior to glibc version 2.24, the Feature Test Macro Requirements were only
> +.BR _XOPEN_SOURCE .
> +.\" commit 0014680d6a5bdeb4fe17682450105ebed19f35da
>  .SH SEE ALSO
>  .BR open (2),
>  .BR posix_openpt (3),
> diff --git a/man3/ptsname.3 b/man3/ptsname.3
> index 90133fe..8eb8cba 100644
> --- a/man3/ptsname.3
> +++ b/man3/ptsname.3
> @@ -3,24 +3,35 @@
>  .\" %%%LICENSE_END
>  .\"
>  .\" 2004-12-17, mtk, added description of ptsname_r() + ERRORS
> +.\" 2017-03-17, f.thiessen, updated feature test macros
>  .\"
>  .TH PTSNAME 3 2016-12-12 "" "Linux Programmer's Manual"
>  .SH NAME
>  ptsname, ptsname_r \- get the name of the slave pseudoterminal
>  .SH SYNOPSIS
> -.nf
> -.BR "#define _XOPEN_SOURCE" "       /* See feature_test_macros(7) */"
> -.br
>  .B #include <stdlib.h>
>  .sp
>  .BI "char *ptsname(int " fd ");"
>  .sp
> -.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
> -.br
> -.B #include <stdlib.h>
> -.sp
>  .BI "int ptsname_r(int " fd ", char *" buf ", size_t " buflen ");"
> -.fi
> +.sp
> +.in -4n
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.ad l
> +.BR ptsname ():
> +.br
> +.RS 4
> +_XOPEN_SOURCE\ >=\ 500 || (_XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED)
> +.RE
> +.BR ptsname_r ():
> +.br
> +.RS 4
> +_GNU_SOURCE
> +.RE
> +.ad
>  .SH DESCRIPTION
>  The
>  .BR ptsname ()
> @@ -76,6 +87,12 @@ is too small.
>  .SH VERSIONS
>  .BR ptsname ()
>  is provided in glibc since version 2.1.
> +.SH NOTES
> +Prior to glibc version 2.24, the Feature Test Macro Requirements for
> +.BR ptsname ()
> +were only
> +.BR _XOPEN_SOURCE .
> +.\" commit 0014680d6a5bdeb4fe17682450105ebed19f35da
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> diff --git a/man3/unlockpt.3 b/man3/unlockpt.3
> index c0a8199..4178611 100644
> --- a/man3/unlockpt.3
> +++ b/man3/unlockpt.3
> @@ -2,17 +2,27 @@
>  .\" This page is in the public domain. - aeb
>  .\" %%%LICENSE_END
>  .\"
> +.\" 2017-03-17, f.thiessen, updated feature test macros
> +.\"
>  .TH UNLOCKPT 3 2015-08-08 "" "Linux Programmer's Manual"
>  .SH NAME
>  unlockpt \- unlock a pseudoterminal master/slave pair
>  .SH SYNOPSIS
> -.nf
> -.BR "#define _XOPEN_SOURCE" "       /* See feature_test_macros(7) */"
> -.br
>  .B #include <stdlib.h>
>  .sp
>  .BI "int unlockpt(int " fd ");"
> -.fi
> +.sp
> +.in -4n
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.ad l
> +.BR unlockpt ():
> +.br
> +.RS 4
> +_XOPEN_SOURCE\ >=\ 500 || (_XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED)
> +.RE
>  .SH DESCRIPTION
>  The
>  .BR unlockpt ()
> @@ -43,6 +53,10 @@ argument is not associated with a master pseudoterminal.
>  .SH VERSIONS
>  .BR unlockpt ()
>  is provided in glibc since version 2.1.
> +.SH NOTES
> +Prior to glibc version 2.24, the Feature Test Macro Requirements were only
> +.BR _XOPEN_SOURCE .
> +.\" commit 0014680d6a5bdeb4fe17682450105ebed19f35da
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
