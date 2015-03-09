From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: manpages-dev: please note thread safeness of %m in vfprintf(3)
Date: Mon, 9 Mar 2015 14:20:07 +0800
Message-ID: <54FD3B97.5050400@cn.fujitsu.com>
References: <20150307103821.GA2043@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150307103821.GA2043-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 621057-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane=EF=BC=8C

On 03/07/2015 06:38 PM, St=C3=A9phane Aulery wrote:
> Hello Ma Shimiao,
>=20
> A Debian user has applied to mention that strerror_r(3) is thread saf=
e.
>=20
> I quote his message [1]:
>=20
>> Frome Martin Godisch <martin-AOktpf5JBruELgA04lAiVw@public.gmane.org>, Wed, 6 Apr 2011 09:30:30 +=
0200
>>
>> Please add a note to vfprintf(3) telling users that the %m conversio=
n
>> specifier is thread safe.

I'm not sure why he need a note to indicate that the %m conversion spec=
ifier=20
is thread safe.
=46rom our research and glibc's document, vfprintf(3) is thread safe ex=
cept when users pass float formatting,
custom formatting or single quota may cause locale dependency problem.
And I'm going to add thread safety information of vfprintf() into print=
f.3.
If there is something special about %m, we'd like to know.
And I'm willing to add it.

Best regards,
>>
>> Rationale: errno(3) is thread local, strerror_r(3) is thread safe, a=
nd
>> vfprintf(3) uses errno and strerror_r (in
>> eglibc-2.11.2/stdio-common/vfprintf.c:974).
>=20
> This is your area, it may interest you.
>=20
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D621057
>=20
> Regards,
>=20


--=20
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
