From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] realpath.3: update EINVAL description
Date: Sat, 17 Sep 2011 07:13:48 +0200
Message-ID: <CAKgNAkgVd+jRgDZFjyiO7Shf_JYfM_48PYzLN9f03k2O_rJaYQ@mail.gmail.com>
References: <4E5E5153.8030101@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E5153.8030101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: The argument resolved_path can be NULL and it's not
> a error condition any more. See the last paragraph of the
> DESCRIPTION, and the last paragraph of CONFORMING TO.
> See also the commit c49e8fc9.
>
>
> diff --git a/man3/realpath.3 b/man3/realpath.3
> --- a/man3/realpath.3
> +++ b/man3/realpath.3
> @@ -104,13 +104,9 @@ is set to indicate the error.
> Read or search permission was denied for a component of the path prefix.
> .TP
> .B EINVAL
> -Either
> .I path
> -or
> -.I resolved_path
> is NULL.
> (In libc5 this would just cause a segfault.)
> -But, see NOTES below.
> .TP
> .B EIO
> An I/O error occurred while reading from the file system.

Thanks for this report. I applied a different patch, below.

Cheers,

Michael

diff --git a/man3/realpath.3 b/man3/realpath.3
index 56d85d8..339ccdf 100644
--- a/man3/realpath.3
+++ b/man3/realpath.3
@@ -23,7 +23,7 @@
 .\" Rewritten old page, 990824, aeb-rh8NL+sEX9E@public.gmane.org
 .\" 2004-12-14, mtk, added discussion of resolved_path == NULL
 .\"
-.TH REALPATH 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH REALPATH 3  2011-09-10 "" "Linux Programmer's Manual"
 .SH NAME
 realpath \- return the canonicalized absolute pathname
 .SH SYNOPSIS
@@ -104,13 +104,13 @@ is set to indicate the error.
 Read or search permission was denied for a component of the path prefix.
 .TP
 .B EINVAL
-Either
 .I path
-or
-.I resolved_path
 is NULL.
-(In libc5 this would just cause a segfault.)
-But, see NOTES below.
+.\" (In libc5 this would just cause a segfault.)
+(In glibc versions before 2.3,
+this error is also returned if
+.IR resolved_path
+is NULL.)
 .TP
 .B EIO
 An I/O error occurred while reading from the file system.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
