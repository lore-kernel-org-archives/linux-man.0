From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] open.2: ffix
Date: Fri, 8 Jun 2012 03:01:55 +1200
Message-ID: <CAKgNAkiJjO8VVrxVBw1t560JhcCJdNrAEOH9wUn_h8zqWptMuw@mail.gmail.com>
References: <1337127028-4505-1-git-send-email-taffit@debian.org> <1337134020-10063-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337134020-10063-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 16, 2012 at 2:07 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> Hi Michael,
>
> Another similar one I only noticed on review.

Thanks David. Fix independently before reading your mail.

Cheers,

Michael


> ---
> =A0man2/open.2 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/open.2 b/man2/open.2
> index 5ea16f6..ad318b1 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -776,7 +776,7 @@ I/Os should never be run concurrently with the
> =A0system call,
> =A0if the memory buffer is a private mapping
> =A0(i.e., any mapping created with the
> -.BR mmap(2)
> +.BR mmap (2)
> =A0.BR MAP_PRIVATE
> =A0flag;
> =A0this includes memory allocated on the heap and statically allocate=
d buffers).
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
