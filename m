From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] resolv.conf.5: document RES_SNGLKUPREOP
Date: Wed, 22 Apr 2015 11:11:30 +0200
Message-ID: <553765C2.6060807@gmail.com>
References: <1429662071-23797-1-git-send-email-saulery@free.fr> <1429662071-23797-3-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429662071-23797-3-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/22/2015 02:21 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> Fix Ubuntu bug #1110781:
> https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/1110781

Hi St=C3=A9phane,

I need some help here. How is this patch fixing that bug.
I need a short explanation of the connection for the changelog.

Cheers,

Michael

>=20
> Reported-by: Thomas Hood
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/resolv.conf.5 | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index ac43184..177087e 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -255,6 +255,10 @@ and IPv4 requests sequentially (at the cost of s=
ome slowdown of the
>  resolving process).
>  .TP
>  .BR single-request-reopen " (since glibc 2.9)"
> +sets
> +.BR RES_SNGLKUPREOP
> +in
> +.IR _res.options .
>  The resolver uses the same socket for the A and AAAA requests.
>  Some hardware mistakenly sends back only one reply.
>  When that happens the client system will sit and wait for the second=
 reply.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
