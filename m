From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtnetlink.3: fix example code, use RTA_LENGTH macro
Date: Sat, 24 Mar 2012 13:13:12 +1300
Message-ID: <CAKgNAkiL5iXrN-GigtbnqZy2Gqr-u5=d2eRZv0wZDQ+-9NANzg@mail.gmail.com>
References: <1332462686-26100-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332462686-26100-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kirill Brilliantov <brilliantov-aPYA7nAdAYY@public.gmane.org>, Sergei Zhirikov <sfzhi-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks for forwarding this Simon. Applied for man-pages-3.38.

Cheers,

Michael

On Fri, Mar 23, 2012 at 1:31 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> =
wrote:
> From Kirill Brilliantov, http://bugs.debian.org/655088
> ---
> =A0man3/rtnetlink.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
> index 29d7765..ada93e2 100644
> --- a/man3/rtnetlink.3
> +++ b/man3/rtnetlink.3
> @@ -109,7 +109,7 @@ Creating a rtnetlink message to set the MTU of a =
device:
> =A0 =A0 rta =3D (struct rtattr *)(((char *) &req) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NLMSG_ALIG=
N(req.nh.nlmsg_len));
> =A0 =A0 rta\->rta_type =3D IFLA_MTU;
> - =A0 =A0rta\->rta_len =3D sizeof(unsigned int);
> + =A0 =A0rta\->rta_len =3D RTA_LENGTH(sizeof(unsigned int));
> =A0 =A0 req.n.nlmsg_len =3D NLMSG_ALIGN(req.nh.nlmsg_len) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 R=
TA_LENGTH(sizeof(mtu));
> =A0 =A0 memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
