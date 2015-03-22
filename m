From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] filesystems.5: Add filesystems adfs and afs
Date: Sun, 22 Mar 2015 21:55:22 +0100
Message-ID: <20150322205522.GA5055@free.fr>
References: <1426074953-4589-1-git-send-email-saulery@free.fr>
 <CAKgNAkjVZ4PJC1oqdbP6CgmNghavsOPjQfGjPGxvMaN0EDMgVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjVZ4PJC1oqdbP6CgmNghavsOPjQfGjPGxvMaN0EDMgVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

Given your remarks just on the first patch so that there must have abou=
t
20, I propose to send the complete list of description to add without
formatting for easy review. As we agree I do one final patch. Is that
okay with you?

Regards,

Le dimanche 22 mars 2015 =C3=A0 07:17:26, Michael Kerrisk (man-pages) a=
 =C3=A9crit :
>=20
> On 11 March 2015 at 12:55, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wro=
te:
> > Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> > ---
> >  man5/filesystems.5 | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/man5/filesystems.5 b/man5/filesystems.5
> > index 0c66f9e..b204e26 100644
> > --- a/man5/filesystems.5
> > +++ b/man5/filesystems.5
> > @@ -52,6 +52,17 @@ Below a short description of the available or hi=
storically available
> >  filesystems in Linux kernel. See kernel documentation for a compre=
hensive
> >  description of all options and limitations.
> >  .TP 10
> > +.B adfs
> > +is the Acorn Advanced Disc Filing System, the standard filesystem =
of RiscOS
> > +operating system which runs on Acorn's ARM-based Risc PC systems
> > +and the Acorn Archimedes range of machines,
>=20
> s/,/./
>=20
> > +that was integrated into Linux in kernel 2.1.
>=20
> s/that/This filesystem/
>=20
> > +.TP
> > +.B afs
> > +is the distributed AFS (Andrew File System) fs. It is under develo=
pment
>=20
> s/AFS (Andrew File System) fs/Andrew File System/
>=20
> > +and does not yet provide the full feature set.
>=20
> That last sentence is vague. What is the full feature set? Or,
> otherwise, what pieces are missing?
>=20
> > +It does not yet support pioctl() system call.
>=20
> Or is that the only piece missing from "afs"?
>=20
> Thanks,
>=20
> Michael
>=20
>=20
> > +.TP
> >  .B ext
> >  is an elaborate extension of the
> >  .B minix
> > --
> > 2.1.4
> >
>=20
>=20
>=20
> --=20
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
