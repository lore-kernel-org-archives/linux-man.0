From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: tfix
Date: Wed, 30 Oct 2013 14:46:38 +1300
Message-ID: <527064FE.5070806@gmail.com>
References: <1383007197-1518-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383007197-1518-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks,

Michael

On 29.10.2013 13:39, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index f4cb5bd..9fc774c 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1289,7 +1289,7 @@ When the mapping is
>  the
>  .I data_tail
>  value should be written by user space to reflect the last read data.
> -In this case the kernel will not over-write unread data.
> +In this case the kernel will not overwrite unread data.
>  .PP
>  The following 2^n ring-buffer pages have the layout described below.
> =20
> @@ -2133,7 +2133,7 @@ When
>  .B E2BIG
>  is returned, the perf_event_attr
>  .I size=20
> -field is over-written by the kernel to be the size of the structure
> +field is overwritten by the kernel to be the size of the structure
>  it was expecting.
>  .TP
>  .B EINVAL
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
