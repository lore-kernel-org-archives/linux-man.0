From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cp1251.7: tfix
Date: Sun, 13 Jul 2014 10:29:47 +0200
Message-ID: <53C2437B.7050209@gmail.com>
References: <1405159739-3067-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405159739-3067-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri! Applied.

Cheers,

Michael

On 07/12/2014 12:08 PM, Yuri Kozlov wrote:
> ---
>  man7/cp1251.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/cp1251.7 b/man7/cp1251.7
> index bfc9adb..de89469 100644
> --- a/man7/cp1251.7
> +++ b/man7/cp1251.7
> @@ -113,7 +113,7 @@ _
>  304	196	C4	=D0=94	CYRILLIC CAPITAL LETTER DE
>  305	197	C5	=D0=95	CYRILLIC CAPITAL LETTER IE
>  306	198	C6	=D0=96	CYRILLIC CAPITAL LETTER ZHE
> -307	199	C7	v	CYRILLIC CAPITAL LETTER ZE
> +307	199	C7	=D0=97	CYRILLIC CAPITAL LETTER ZE
>  310	200	C8	=D0=98	CYRILLIC CAPITAL LETTER I
>  311	201	C9	=D0=99	CYRILLIC CAPITAL LETTER SHORT I
>  312	202	CA	=D0=9A	CYRILLIC CAPITAL LETTER KA
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
