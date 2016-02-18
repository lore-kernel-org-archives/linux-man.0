From: =?UTF-8?Q?St=c3=a9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: Bug#679323: clearenv(3): implies that it's a security tool
Date: Thu, 18 Feb 2016 22:44:40 +0100
Message-ID: <56C63B48.9030908@free.fr>
References: <2022845728.87847295.1455816499626.JavaMail.root@zimbra51-e8.priv.proxad.net>
 <20160218203447.GF3560@alcor.net>
Reply-To: =?UTF-8?Q?St=c3=a9phane_AULERY_PERSO_2?= <saulery-GANU6spQydw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160218203447.GF3560-GlOw+ZFk85JeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, 679323-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Matt,

Le 18/02/2016 21:34, Matt Zimmerman a =E9crit :
> Thanks for following up.  My recommendation is to say something like:
>
> This function DOES NOT securely erase the contents of the environment=
=2E
> Security-conscious applications which need to do this should use ....
> instead.

Thanks for your reply. To match the note recommending a solution of=20
withdrawal, then I suggest:

-----

If it is unavailable the assignment

     environ =3D NULL;

will probably do.

But these solutions DO NOT securely erase the contents of the=20
environment. ecurity-conscious applications which need to do this shoul=
d=20
use [...] instead.

----

Problem, I have no idea of good security practice. A helping hand, plea=
se?

Regards,

--=20
St=E9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
