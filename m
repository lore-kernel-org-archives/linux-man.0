From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] fopen(3), fmemopen(3), fopencookie(3): Cross-link
Date: Fri, 5 Dec 2008 11:31:33 -0500
Message-ID: <cfd18e0f0812050831q290525e7tcf4473699ea97af5@mail.gmail.com>
References: <20081204232305.GI10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204232305.GI10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr

Thanks for the patch.

On Thu, Dec 4, 2008 at 6:23 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index 47187b6..ccd0f7b 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -224,5 +224,6 @@ does not enlarge the buffer; instead the
>  call fails, returning \-1.
>  .\" http://sourceware.org/bugzilla/show_bug.cgi?id=1996
>  .SH "SEE ALSO"
> +.BR feature_test_macros (7),
>  .BR fopen (3),
> -.BR feature_test_macros (7)

The way that SEE ALSO lists are ordered is first by section number,
then alphabetically within sections.  (This is longstanding Unix
convention.)  Dropped.

> +.BR fopencookie (3)

Applied.

> diff --git a/man3/fopen.3 b/man3/fopen.3
> index d6b6314..b59810f 100644
> --- a/man3/fopen.3
> +++ b/man3/fopen.3
> @@ -38,6 +38,7 @@
>  .\" Converted for Linux, Mon Nov 29 15:22:01 1993, faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org
>  .\" Modified, aeb, 960421, 970806
>  .\" Modified, joey, aeb, 2002-01-03
> +.\" Cross-linked, pasky-AlSwsSmVLrQ@public.gmane.org, 2008-12-04

Nowadays, I tend only to add lines to the in-source change log for
major changes.  All changes are anyway recorded in the git changelog.

>  .\"
>  .TH FOPEN 3  2008-10-12 "GNU" "Linux Programmer's Manual"
>  .SH NAME
> @@ -300,5 +301,6 @@ This flag is ignored for
>  .\" FIXME document /,ccs= charset/
>  .SH "SEE ALSO"
>  .BR open (2),
> -.BR fclose (3),

Why remove fclose()?  Dropped.

> -.BR fileno (3)
> +.BR fileno (3),
> +.BR fmemopen (3),
> +.BR fopencookie (3)

Applied this piece.

Changes will be in 3.15.

Thanks Petr!

Chjeers,

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
