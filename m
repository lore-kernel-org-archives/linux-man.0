From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: arm_mremap() man page
Date: Sat, 9 Oct 2010 14:32:34 +0200
Message-ID: <201010091432.37995.stephan.mueller@atsec.com>
References: <AANLkTinaFiESuT6pU8w8OhfCH323-WS-haHRi4+fmkpo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinaFiESuT6pU8w8OhfCH323-WS-haHRi4+fmkpo-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Samstag, 9. Oktober 2010, um 07:19:34 schrieb Michael Kerrisk:

Hi Michael,

> [Was: man pages for undocumented system calls]
>=20
> Stephan,
>=20
> I don't think we really need to document this system call. It has gon=
e
> away nowadays. Note also that your description below is incorrect. Th=
e
> 2.4 Linux source reads as follows:

You are right. But it exists in the kernel I am looking at: a 2.6.27 wi=
th some=20
patches by a vendor.
>=20
>         unsigned long ret =3D -EINVAL;
>=20
>         /*
>          * If we are doing a fixed mapping, and address < PAGE_SIZE,
>          * then deny it.
>          */
>         if (flags & MREMAP_FIXED && new_addr < PAGE_SIZE &&
>             vectors_base() =3D=3D 0)
>                 goto out;
>=20
> In other words, new_addr can't be less than PAGE_SIZE for MREMAP_FIXE=
D
> (if vectors_base() =3D=3D 0, which I gather to mean if page 0 is bein=
g
> used as a vector address page).
>=20
> Also, your point in NOTES is not correct. The new_addr argument is
> passed by value; it can;t be used to return anything.

Of course, sorry for the noise then. But since the syscall went away an=
yway,=20
we can skip the man page.

Thanks
Stephan

--=20
       Stephan M=FCller Stephan.Mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org +49 172 216 55 78
atsec information security GmbH, Steinstra=DFe 70, 81667 M=FCnchen, Ger=
many
         Gesch=E4ftsf=FChrer: Salvatore la Pietra, Staffan Persson
                   HRB: 129439 (Amtsgericht M=FCnchen)
 atsec it security news blog - atsec-information-security.blogspot.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
