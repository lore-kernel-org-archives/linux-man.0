From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] strcmp.3: Reference strstr(3)
Date: Mon, 1 Jun 2009 14:59:38 +0200
Message-ID: <cfd18e0f0906010559i6a6c61d7g3c625a7a04de4323@mail.gmail.com>
References: <1835422551-6657-1-git-send-email-mark@pogo.org.uk>
	 <1835422551-6657-2-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1835422551-6657-2-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mark,

Why do you think this patch is needed?

Cheers,

Michael

On Tue, Feb 29, 2028 at 9:35 AM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> ---
> =A0man3/strcmp.3 | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/man3/strcmp.3 b/man3/strcmp.3
> index 4797e71..62d9cc6 100644
> --- a/man3/strcmp.3
> +++ b/man3/strcmp.3
> @@ -27,7 +27,7 @@
> =A0.\" Modified Sat Jul 24 18:08:52 1993 by Rik Faith (faith-+5Oa3zvhR2o@public.gmane.org=
du)
> =A0.\" Modified 2001-08-31, aeb
> =A0.\"
> -.TH STRCMP 3 =A02009-04-21 "" "Linux Programmer's Manual"
> +.TH STRCMP 3 =A02009-05-09 "" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0strcmp, strncmp \- compare two strings
> =A0.SH SYNOPSIS
> @@ -68,6 +68,7 @@ SVr4, 4.3BSD, C89, C99.
> =A0.BR strcasecmp (3),
> =A0.BR strcoll (3),
> =A0.BR strncasecmp (3),
> +.BR strstr (3),
> =A0.BR strverscmp (3),
> =A0.BR wcscmp (3),
> =A0.BR wcsncmp (3)
> --
> 1.6.2.4
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
