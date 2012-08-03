From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] futex.7: ffix
Date: Fri, 3 Aug 2012 10:30:22 +0200
Message-ID: <CAKgNAki=W16mTWtCqzNjQ=-itFB5gHi3fn7utC6HsrgmjroSUA@mail.gmail.com>
References: <1343773440-24968-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343773440-24968-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 1, 2012 at 12:24 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> uri(7) documents that =93Older documents suggested inserting the pref=
ix
> "URL:" just before the URI, but this form has never caught on.=94 and
> advise to =93enclosed in angle brackets=94 (and a few other alternati=
ves).

Thanks David. Applied.

Cheers,

Michael


> Reported-By: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man7/futex.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/futex.7 b/man7/futex.7
> index 95a0ea1..241fee2 100644
> --- a/man7/futex.7
> +++ b/man7/futex.7
> @@ -115,4 +115,4 @@ primitives: it is by no means the only one.
>  .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
>  (proceedings of the Ottawa Linux Symposium 2002),
>  futex example library, futex-*.tar.bz2
> -<URL:ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/>.
> +<ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/>.
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
