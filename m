From: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] perf_event_open.2: tfix
Date: Sun, 17 Nov 2013 19:26:09 +0100
Message-ID: <20131117182608.GB20757@aym.net2.nerim.net>
References: <1384704976-3877-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384704976-3877-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David =?iso-8859-1?Q?Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2013-11-17 12:16 -0400, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 1889689..584d9d5 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -700,6 +700,7 @@ settings.
>  Parsing the event stream properly was not possible because the
>  format of the record was needed to find SAMPLE_ID, but
>  the the format could not be found without knowing what
> +the format could not be found without knowing what
>  event the sample belonged to (causing a circular
>  dependency).
> =20
> --=20
> 1.8.4.3

Shouldn't there be a "-" before "the the format" ?

--=20
Andr=E9 Majorel http://www.teaser.fr/~amajorel/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
