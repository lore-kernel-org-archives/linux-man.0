From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] closedir.3: Fix typo
Date: Tue, 28 Apr 2009 16:17:46 +1200
Message-ID: <cfd18e0f0904272117q28a7a2f3m36630dc050eed3bc@mail.gmail.com>
References: <1240854314-3161-1-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1240854314-3161-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 28, 2009 at 5:45 AM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
>
> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>

Thanks!  Applied for 3.22.

Cheers,

Michael


> ---
> =A0man3/closedir.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/closedir.3 b/man3/closedir.3
> index 264a3e9..170d49d 100644
> --- a/man3/closedir.3
> +++ b/man3/closedir.3
> @@ -44,7 +44,7 @@ function closes the directory stream associated wit=
h
> =A0\fIdirp\fP.
> =A0A successful call to
> =A0.BR closedir ()
> -also closes the underlying file descripotr associated with
> +also closes the underlying file descriptor associated with
> =A0.IR dirp .
> =A0The directory stream descriptor \fIdirp\fP is not available
> =A0after this call.
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
