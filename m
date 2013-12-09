From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] perf_event_open.2: tfix
Date: Sun, 08 Dec 2013 21:43:12 -0800
Message-ID: <52A55870.4020606@gmail.com>
References: <20131117182608.GB20757@aym.net2.nerim.net> <1384717125-6012-1-git-send-email-taffit@debian.org> <1384717125-6012-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384717125-6012-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael


On 11/17/13 11:38, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 1889689..9eb92cb 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -699,7 +699,7 @@ records from various different event sources with=
 different
>  settings.
>  Parsing the event stream properly was not possible because the
>  format of the record was needed to find SAMPLE_ID, but
> -the the format could not be found without knowing what
> +the format could not be found without knowing what
>  event the sample belonged to (causing a circular
>  dependency).
> =20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
