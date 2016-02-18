From: Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: clearenv(3): implies that it's a security tool
Date: Thu, 18 Feb 2016 12:34:48 -0800
Message-ID: <20160218203447.GF3560@alcor.net>
References: <2022845728.87847295.1455816499626.JavaMail.root@zimbra51-e8.priv.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2022845728.87847295.1455816499626.JavaMail.root-ejyA1lUx/7j5pO4zsKA69P9ALaXTbT7g0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?St=E9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Cc: 679323-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks for following up.  My recommendation is to say something like:

This function DOES NOT securely erase the contents of the environment.
Security-conscious applications which need to do this should use ....
instead.

On Thu, Feb 18, 2016 at 06:28:19PM +0100, St=E9phane Aulery wrote:
> severity 679323 minor
> stop
> -----
>=20
> Hello Matt,
>=20
> I dig your bug reports about the clearenv() function.
>=20
> Does the sentence below would do, please?
>=20
>=20
>    Used by security-conscious application, with the reservation
>    that the memory is not zeroed by the glibc implementation
>    before release.
>=20
>=20
> Regards,
>=20
> --=20
> St=E9phane Aulery

--=20
 - mdz
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
