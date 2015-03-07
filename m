From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: manpages-dev: please note thread safeness of %m in vfprintf(3)
Date: Sat, 7 Mar 2015 11:38:21 +0100
Message-ID: <20150307103821.GA2043@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 621057-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ma Shimiao,

A Debian user has applied to mention that strerror_r(3) is thread safe.

I quote his message [1]:

> Frome Martin Godisch <martin-AOktpf5JBruELgA04lAiVw@public.gmane.org>, Wed, 6 Apr 2011 09:30:30 +0=
200
>=20
> Please add a note to vfprintf(3) telling users that the %m conversion
> specifier is thread safe.
>
> Rationale: errno(3) is thread local, strerror_r(3) is thread safe, an=
d
> vfprintf(3) uses errno and strerror_r (in
> eglibc-2.11.2/stdio-common/vfprintf.c:974).

This is your area, it may interest you.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D621057

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
