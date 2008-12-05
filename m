From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] open_wmemstream(3): Describe (as part of fmemopen.3)
Date: Fri, 5 Dec 2008 12:53:26 -0500
Message-ID: <cfd18e0f0812050953l4b0a6ca0mf2994623474b149f@mail.gmail.com>
References: <20081204232328.GJ10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204232328.GJ10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

Thanks for another good patch.  One thing (since you may be submitting
future patches, I hope): the subject line would be better as something
like:

[PATCH] fmemopen.3: Add description of open_wmemstream(3)

Other comments below.

On Thu, Dec 4, 2008 at 6:23 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index 47187b6..add9d5f 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -2,9 +2,9 @@
>  .\" and Copyright 2005 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  .\" Distributed under the GPL.

This time I added an in-source changelog entry listing you!

>  .\"
> -.TH FMEMOPEN 3 2008-10-12 "GNU" "Linux Programmer's Manual"
> +.TH FMEMOPEN 3 2008-12-04 "GNU" "Linux Programmer's Manual"
>  .SH NAME
> -fmemopen, open_memstream \-  open memory as stream
> +fmemopen, open_memstream, open_wmemstream \-  open memory as stream
>  .SH SYNOPSIS
>  .B #define _GNU_SOURCE
>  .br
> @@ -14,6 +14,10 @@ fmemopen, open_memstream \-  open memory as stream
>  .BI "const char *" mode ");"
>  .sp
>  .BI "FILE *open_memstream(char **" ptr ", size_t *" sizeloc );
> +.sp

I imagine you were aware that _GNU_SOURCE is required.  Convention
here is that since we are listing new header files, then we should
again list the required FTMs, even if they are the same as for a
previous function.  So I added

+.B #define _GNU_SOURCE

here.

> +.B #include <wchar.h>
> +.br
> +.BI "FILE *open_wmemstream(wchar_t **" ptr ", size_t *" sizeloc );
>  .SH DESCRIPTION
>  The
>  .BR fmemopen ()
> @@ -138,11 +142,16 @@ or
>  Moving the file position past the end
>  of the data already written fills the intervening space with
>  zeros.
> +
> +The
> +.BR open_wmemstream ()
> +is similar but operates on wide characters instead of bytes.
>  .SH "RETURN VALUE"
>  Upon successful completion
> -.BR fmemopen ()
> -and
> +.BR fmemopen (),
>  .BR open_memstream ()
> +and
> +.BR open_wmemstream ()
>  return a
>  .I FILE
>  pointer.

One thing that also is good to include is version information.
Unfortunately the page was lacking a VERSIONS section, when it really
should have had one.  I added the following:

diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
index 2b87b69..0d540b5 100644
--- a/man3/fmemopen.3
+++ b/man3/fmemopen.3
@@ -160,6 +160,13 @@ pointer.
 Otherwise, NULL is returned and the global variable
 .I errno
 is set to indicate the error.
+.SH VERSIONS
+.BR fmemopen ()
+is available since glibc 2.2.
+.BR open_memstream ()
+is available since glibc 2.0.
+.BR open_wmemstream ()
+is available since glibc 2.4.
 .SH "CONFORMING TO"
 These functions are GNU extensions.
 .\" Jan 06: But they appear to be going up for standardization by

Look right to you?

> diff --git a/man3/open_wmemstream.3 b/man3/open_wmemstream.3
> new file mode 100644
> index 0000000..afcad2f
> --- /dev/null
> +++ b/man3/open_wmemstream.3
> @@ -0,0 +1 @@
> +.so man3/fmemopen.3

It's rare that I get a patch that remembers to do pieces like this.  Thanks!

These changes are applied for 3.15.  Thanks!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
