From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Clarified incompatibility and correct usage of XDR API
Date: Thu, 26 Feb 2015 08:48:48 +0100
Message-ID: <54EECFE0.9090104@gmail.com>
References: <1424802007-14827-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424802007-14827-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 02/24/2015 07:20 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> Debian Bug #628099
> Report and patch of Taisuke Yamada <tai-f4p32tzkXghg9hUCZPvPmw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man3/xdr.3 | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/man3/xdr.3 b/man3/xdr.3
> index 8f931db..f4bb3e9 100644
> --- a/man3/xdr.3
> +++ b/man3/xdr.3
> @@ -291,9 +291,11 @@ Note: the XDR stream's
>  .I op
>  field must be set by the caller.
>  .IP
> -Warning: this XDR stream implements an intermediate record stream.
> -Therefore there are additional bytes in the stream
> -to provide record boundary information.
> +Warning: To read from XDR stream created by this API, you'll need to
> +call xdrrec_skiprecord(3) first before calling any other XDR APIs.
> +This is because this inserts additional bytes in the stream to provi=
de
> +record boundary information. Also, XDR streams created with differen=
t
> +xdr*_create APIs are not compatible for the same reason.
>  .LP
>  .nf
>  .BI "bool_t xdrrec_endofrecord(XDR *" xdrs ", int " sendnow );
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
