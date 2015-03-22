From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] find_repeated_words.sh: Do not process files that are
 redirects.
Date: Sun, 22 Mar 2015 16:39:12 +0100
Message-ID: <550EE220.1050605@gmail.com>
References: <1426378524-31758-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426378524-31758-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 01:15 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Patch applied.

Cheers,

Michael


> ---
>  scripts/find_repeated_words.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/scripts/find_repeated_words.sh b/scripts/find_repeated_w=
ords.sh
> index 50133be..747872e 100644
> --- a/scripts/find_repeated_words.sh
> +++ b/scripts/find_repeated_words.sh
> @@ -25,6 +25,9 @@
>  #
> =20
>  for file in "$@" ; do=20
> +   # Do not process files that are redirects.
> +   grep -qE "^\.so man.*" "$file"
> +   if test $? -ne 0; then
>      words=3D$(MANWIDTH=3D2000 man -l "$file" 2> /dev/null | col -b |=
 \
>  	tr ' \008' '\012' | sed -e '/^$/d' | \
>  	sed 's/ *$//' |=20
> @@ -33,4 +36,5 @@ for file in "$@" ; do
>      if test -n "$words"; then
>          echo "$file: $words"
>      fi
> +   fi
>  done
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
