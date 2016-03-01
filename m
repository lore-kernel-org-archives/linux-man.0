From: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 01 Mar 2016 23:43:57 +0100
Message-ID: <m34mcpakeq.fsf@neo.luffy.cx>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
	<56D56901.5070307@gmail.com> <87k2lm7bks.fsf@zoro.exoscale.ch>
	<56D56F24.3090605@gmail.com>
	<CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
	<CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw@mail.gmail.com>
	<CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig@mail.gmail.com>
	<87povenoig.fsf@zoro.exoscale.ch> <56D5FAFC.10905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D5FAFC.10905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Tue, 1
	Mar 2016 21:26:36 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

 =E2=9D=A6  1 mars 2016 21:26 +0100, "Michael Kerrisk (man-pages)" <mtk=
=2Emanpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=C2=A0:

>> The typical use case is still about privileges since a fully privile=
ged
>> process could just create a similar socket without the filter. It ma=
kes
>> little sense to create a socket, add a filter and lock it if you kee=
p
>> your privileges.
>
> Thanks. That, plus a reread of the commit message was the info I need=
ed.
> The point here is that we're talking about raw sockets, right? I=20
> reworded that paragraph to:
>
>               The typical use case is for a privileged process to  se=
t
>               up   a  raw  socket  (an  operation  that  requires  th=
e
>               CAP_NET_RAW capability), apply a restrictive filter, se=
t
>               the  SO_LOCK_FILTER  option,  and  then  either drop it=
s
>               privileges or pass the  socket  file  descriptor  to  a=
n
>               unprivileged process via a UNIX domain socket.

Perfect for me.
--=20
The better part of valor is discretion.
		-- William Shakespeare, "Henry IV"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
