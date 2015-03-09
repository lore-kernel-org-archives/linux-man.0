From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: manpages-dev: please note thread safeness of %m in vfprintf(3)
Date: Mon, 9 Mar 2015 08:47:35 +0100
Message-ID: <20150309074735.GA1144@free.fr>
References: <20150307103821.GA2043@free.fr>
 <54FD3B97.5050400@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD3B97.5050400-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 621057-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ma Shimiao,

Le lundi 09 mars 2015 =C3=A0 02:20:07, Ma Shimiao a =C3=A9crit :
>=20
> On 03/07/2015 06:38 PM, St=C3=A9phane Aulery wrote:
> >=20
> > A Debian user has applied to mention that strerror_r(3) is thread s=
afe.
> >=20
> >> Frome Martin Godisch <martin-AOktpf5JBruELgA04lAiVw@public.gmane.org>, Wed, 6 Apr 2011 09:30:30=
 +0200
> >>
> >> Please add a note to vfprintf(3) telling users that the %m convers=
ion
> >> specifier is thread safe.
>=20
> I'm not sure why he need a note to indicate that the %m conversion sp=
ecifier=20
> is thread safe.
> From our research and glibc's document, vfprintf(3) is thread safe ex=
cept when users pass float formatting,
> custom formatting or single quota may cause locale dependency problem=
=2E
> And I'm going to add thread safety information of vfprintf() into pri=
ntf.3.
> If there is something special about %m, we'd like to know.
> And I'm willing to add it.

I will send you answer to Martin Godisch, but I don't think there is so=
mething
special. I will wait your patch before closing this bug.

Thanks.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
