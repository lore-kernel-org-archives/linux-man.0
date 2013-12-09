From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] perf_event_open.2: ffix
Date: Sun, 08 Dec 2013 21:43:23 -0800
Message-ID: <52A5587B.8020508@gmail.com>
References: <20131117182608.GB20757@aym.net2.nerim.net> <1384717125-6012-1-git-send-email-taffit@debian.org> <1384717125-6012-3-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384717125-6012-3-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks,

Michael


On 11/17/13 11:38, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 9eb92cb..9d37b44 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -654,7 +654,8 @@ Records a unique ID for the opened event.
>  Unlike
>  .B PERF_SAMPLE_ID
>  the actual ID is returned, not the group leader.
> -This ID is the same as the one returned by PERF_FORMAT_ID.
> +This ID is the same as the one returned by
> +.BR PERF_FORMAT_ID .
>  .TP
>  .B PERF_SAMPLE_RAW
>  Records additional data, if applicable.
> @@ -689,7 +690,9 @@ This is only available if the underlying hardware
>  supports this feature.
>  .TP
>  .BR PERF_SAMPLE_IDENTIFIER " (Since Linux 3.12)"
> -Places the SAMPLE_ID value in a fixed position in the record,
> +Places the
> +.B SAMPLE_ID
> +value in a fixed position in the record,
>  either at the beginning (for sample events) or at the end
>  (if a non-sample event).
> =20
> @@ -698,7 +701,9 @@ records from various different event sources with=
 different
>  .I sample_type
>  settings.
>  Parsing the event stream properly was not possible because the
> -format of the record was needed to find SAMPLE_ID, but
> +format of the record was needed to find
> +.BR SAMPLE_ID ,
> +but
>  the format could not be found without knowing what
>  event the sample belonged to (causing a circular
>  dependency).
> @@ -706,8 +711,12 @@ dependency).
>  This new
>  .B PERF_SAMPLE_IDENTIFIER
>  setting makes the event stream always parsable
> -by putting SAMPLE_ID in a fixed location, even though
> -it means having duplicate SAMPLE_ID values in records.
> +by putting
> +.B SAMPLE_ID
> +in a fixed location, even though
> +it means having duplicate
> +.B SAMPLE_ID
> +values in records.
>  .RE
>  .TP
>  .IR "read_format"
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
