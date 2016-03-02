From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Wed, 2 Mar 2016 09:17:00 +0100
Message-ID: <56D6A17C.3010208@gmail.com>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
 <56D56901.5070307@gmail.com> <87k2lm7bks.fsf@zoro.exoscale.ch>
 <56D56F24.3090605@gmail.com>
 <CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
 <CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw@mail.gmail.com>
 <CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig@mail.gmail.com>
 <87povenoig.fsf@zoro.exoscale.ch> <56D5FAFC.10905@gmail.com>
 <m34mcpakeq.fsf@neo.luffy.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m34mcpakeq.fsf-PiWSfznZvZU/eRriIvX0kg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 11:43 PM, Vincent Bernat wrote:
>  =E2=9D=A6  1 mars 2016 21:26 +0100, "Michael Kerrisk (man-pages)" <m=
tk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> :
>=20
>>> The typical use case is still about privileges since a fully privil=
eged
>>> process could just create a similar socket without the filter. It m=
akes
>>> little sense to create a socket, add a filter and lock it if you ke=
ep
>>> your privileges.
>>
>> Thanks. That, plus a reread of the commit message was the info I nee=
ded.
>> The point here is that we're talking about raw sockets, right? I=20
>> reworded that paragraph to:
>>
>>               The typical use case is for a privileged process to  s=
et
>>               up   a  raw  socket  (an  operation  that  requires  t=
he
>>               CAP_NET_RAW capability), apply a restrictive filter, s=
et
>>               the  SO_LOCK_FILTER  option,  and  then  either drop i=
ts
>>               privileges or pass the  socket  file  descriptor  to  =
an
>>               unprivileged process via a UNIX domain socket.
>=20
> Perfect for me.

Good. Thanks for checking it, Vincent.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
