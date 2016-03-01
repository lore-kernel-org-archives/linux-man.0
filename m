From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 1 Mar 2016 21:26:36 +0100
Message-ID: <56D5FAFC.10905@gmail.com>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
 <56D56901.5070307@gmail.com> <87k2lm7bks.fsf@zoro.exoscale.ch>
 <56D56F24.3090605@gmail.com>
 <CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
 <CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw@mail.gmail.com>
 <CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig@mail.gmail.com>
 <87povenoig.fsf@zoro.exoscale.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87povenoig.fsf-5eSmzDr29cuEUmwQmL7/Pg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>, Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Vincent,

On 03/01/2016 05:36 PM, Vincent Bernat wrote:
>  =E2=9D=A6  1 mars 2016 11:31 -0500, Craig Gallek <kraigatgoog@gmail.=
com> :
>=20
>>> But, what about the second paragraph mentioned in my other mail. I
>>> think we should just kill it. What do you think?
>> Ah, that's an interesting question...  I believe the 'typical use
>> case' paragraph is correct with removal of the 'privilege' qualifier=
s
>> (and pretty much lifted from the commit message), but I'll defer to
>> you as to whether or not it's appropriate for a man page.  There don=
't
>> appear to be other such examples in this specific page and anyone wh=
o
>> is really interested in the motivation behind the implementation of =
a
>> feature is better off looking at the code and commit messages
>> anyway...
>=20
> The typical use case is still about privileges since a fully privileg=
ed
> process could just create a similar socket without the filter. It mak=
es
> little sense to create a socket, add a filter and lock it if you keep
> your privileges.

Thanks. That, plus a reread of the commit message was the info I needed=
=2E
The point here is that we're talking about raw sockets, right? I=20
reworded that paragraph to:

              The typical use case is for a privileged process to  set
              up   a  raw  socket  (an  operation  that  requires  the
              CAP_NET_RAW capability), apply a restrictive filter, set
              the  SO_LOCK_FILTER  option,  and  then  either drop its
              privileges or pass the  socket  file  descriptor  to  an
              unprivileged process via a UNIX domain socket.

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
