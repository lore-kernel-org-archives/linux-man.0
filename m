From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] malloc.3: don't write realloc in RETURN VALUE section when it means calloc.
Date: Tue, 13 Jan 2009 13:52:04 +1300
Message-ID: <cfd18e0f0901121652i73b195d1v8c56253e45dc063f@mail.gmail.com>
References: <1230462860-22036-1-git-send-email-dato@net.com.org.es>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1230462860-22036-1-git-send-email-dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Adeodato_Sim=F3?= <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Adeodato,

On Mon, Dec 29, 2008 at 12:14 AM, Adeodato Sim=F3 <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>=
 wrote:
> Signed-off-by: Adeodato Sim=F3 <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
> ---
>
> Common sense tells me this fix is correct, but that's about it. :-)

I'll add my vote to common sense. ;-)

=46ixed as you suggest, for 3.17.

Cheers,

Michael

>  man3/malloc.3 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/malloc.3 b/man3/malloc.3
> index 4ba2763..263d022 100644
> --- a/man3/malloc.3
> +++ b/man3/malloc.3
> @@ -133,7 +133,7 @@ with a
>  .I size
>  of zero,
>  or by a successful call to
> -.BR realloc ()
> +.BR calloc ()
>  with
>  .I nmemb
>  or
> --
> 1.6.1.307.g07803
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
