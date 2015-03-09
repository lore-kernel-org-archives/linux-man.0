From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: manpages-dev: please note thread safeness of %m in vfprintf(3)
Date: Mon, 9 Mar 2015 16:23:49 +0800
Message-ID: <54FD5895.8090805@cn.fujitsu.com>
References: <20150307103821.GA2043@free.fr> <54FD3B97.5050400@cn.fujitsu.com> <20150309074735.GA1144@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150309074735.GA1144-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 621057-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane,

On 03/09/2015 03:47 PM, St=C3=A9phane Aulery wrote:
> Hello Ma Shimiao,
>=20
> Le lundi 09 mars 2015 =C3=A0 02:20:07, Ma Shimiao a =C3=A9crit :
>>
>> On 03/07/2015 06:38 PM, St=C3=A9phane Aulery wrote:
>>>
>>> A Debian user has applied to mention that strerror_r(3) is thread s=
afe.
>>>
>>>> Frome Martin Godisch <martin-AOktpf5JBruELgA04lAiVw@public.gmane.org>, Wed, 6 Apr 2011 09:30:30=
 +0200
>>>>
>>>> Please add a note to vfprintf(3) telling users that the %m convers=
ion
>>>> specifier is thread safe.
>>
>> I'm not sure why he need a note to indicate that the %m conversion s=
pecifier=20
>> is thread safe.
>> From our research and glibc's document, vfprintf(3) is thread safe e=
xcept when users pass float formatting,
>> custom formatting or single quota may cause locale dependency proble=
m.
>> And I'm going to add thread safety information of vfprintf() into pr=
intf.3.
>> If there is something special about %m, we'd like to know.
>> And I'm willing to add it.
>=20
> I will send you answer to Martin Godisch, but I don't think there is =
something
> special. I will wait your patch before closing this bug.

OK. I will send my patch as soon as possible.

Best regards,
>=20
> Thanks.
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
