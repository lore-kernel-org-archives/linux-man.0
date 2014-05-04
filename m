From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] inet_net_pton.3: wfix
Date: Sun, 04 May 2014 07:45:08 +0200
Message-ID: <5365D3E4.2040803@gmail.com>
References: <1399166675-16019-1-git-send-email-taffit@debian.org> <1399166675-16019-3-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399166675-16019-3-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On 05/04/2014 03:24 AM, David Pr=E9vot wrote:
> ---
>  man3/inet_net_pton.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man3/inet_net_pton.3 b/man3/inet_net_pton.3
> index 5017886..ec6a381 100644
> --- a/man3/inet_net_pton.3
> +++ b/man3/inet_net_pton.3
> @@ -93,7 +93,7 @@ On success,
>  returns the number of bits in the network number field
>  of the result placed in
>  .IR netp .
> -For a discussion of the input presentation format and the return val=
ue,
> +For a discussion on the input presentation format and the return val=
ue,

"of" is more usual here. I didn't apply this piece.

>  see NOTES.
> =20
>  .IR Note :
> @@ -253,7 +253,7 @@ and
>  It uses
>  .BR inet_net_pton ()
>  to convert the presentation format network address provided in
> -its first command-line to binary form, displays the return value fro=
m
> +its first command-line argument to binary form, displays the return =
value from

I applied this fix.

>  .BR inet_net_pton ().
>  It then uses
>  .BR inet_net_ntop ()

Thanks,

Michael




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
