From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/3] strcpy.3: Reference strdup(3)
Date: Mon, 1 Jun 2009 14:57:53 +0200
Message-ID: <cfd18e0f0906010557q7f97efd3k2d62309c4e7a3661@mail.gmail.com>
References: <1243287829-2704-1-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1243287829-2704-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

The fact that a patch is simple doesn't mean it should have no explanat=
ion.

I've applied this one, but for the future, please do include an
explanation of why the patch is needed.

Cheers,

Michael

On Mon, May 25, 2009 at 11:43 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> ---
> =A0man3/strcpy.3 | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 8fd2c1d..2b4d8ba 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -30,7 +30,7 @@
> =A0.\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
> =A0.\" =A0 =A0 Improve discussion of strncpy().
> =A0.\"
> -.TH STRCPY 3 =A02009-02-04 "GNU" "Linux Programmer's Manual"
> +.TH STRCPY 3 =A02009-05-09 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0strcpy, strncpy \- copy a string
> =A0.SH SYNOPSIS
> @@ -136,6 +136,7 @@ in ways that may make the impossible possible.
> =A0.BR memccpy (3),
> =A0.BR memcpy (3),
> =A0.BR memmove (3),
> +.BR strdup (3),
> =A0.BR strpcpy (3),
> =A0.BR wcscpy (3),
> =A0.BR wcsncpy (3)
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
