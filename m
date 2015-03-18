From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: aio_return(3): misleading RETURN VALUE
Date: Wed, 18 Mar 2015 20:57:03 +0100
Message-ID: <20150318195703.GA9606@free.fr>
References: <5509315A.1040103@ahsoftware.de>
 <20150318121446.GA5160@free.fr>
 <5509D038.7020907@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5509D038.7020907-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alexander,

Le mercredi 18 mars 2015 =C3=A0 08:21:28, Alexander Holler a =C3=A9crit=
 :
> Am 18.03.2015 um 13:14 schrieb St=C3=A9phane Aulery:
> >Le mercredi 18 mars 2015 =C3=A0 09:03:38, Alexander Holler a =C3=A9c=
rit :
> >>
> >>I suggest to use the same wording as in write(2) in the paragraph R=
ETURN
> >>VALUE:
> >>
> >>"On error, -1 is returned, and errno is set appropriately."
> >
> >Like that ?
> >
> >     If the asynchronous I/O operation has completed, this function
> >     returns the value that would have been returned in case of a
> >     synchronous read(2), write(2), fsync(2) or fdatasync(2), call. =
On
> >     error, -1 is returned, and errno is set appropriately.
> >
> >     If the asynchronous I/O operation has not yet completed, the re=
turn
> >     value and effect of aio_return() are undefined.
>=20
> Exactly. Thanks a lot if you change that.

Patch is pending for review by Michael.

> >I think that's what you meant. What will happen if the asynchronous =
I/O
> >operation has not yet completed please ?
>=20
> It is still undefined, but I haven't looked that up in the source of =
glibc.
>=20
> The reason is that aio_return() should only be called if the operatio=
n
> before has completed, which must be checked with calling aio_error() =
before
> calling aio_return().
>=20
> That's how I've understood all that and how it currently seems to wor=
k in
> the SW in question I've fixed a problem.

Thank you for yours clarifications.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
