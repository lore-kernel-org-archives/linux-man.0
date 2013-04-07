From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Sun, 7 Apr 2013 15:03:06 -0400
Message-ID: <201304071503.07751.vapier@gentoo.org>
References: <515EF542.8090200@redhat.com> <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1405504.TyDH1SEqC2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart1405504.TyDH1SEqC2
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 07 April 2013 06:15:18 Michael Kerrisk (man-pages) wrote:
> On Fri, Apr 5, 2013 at 6:01 PM, Peter Schiffer wrote:
> > it looks like the clone(2) man page is describing glibc implementation
> > and not the system call. So I guess it should be moved to the section 3
> > and a new man page for clone(2) syscall should be created in section 2.
> >=20
> > The clone(2) syscall is defined like this:
> >=20
> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
> >                  int __user *, parent_tidptr,
> >                  int __user *, child_tidptr,
> >                  int, tls_val)
> >=20
> > (I'm sorry, but I don't have a patch this time.)
>=20
> The general tendency is to document all system calls in section 2, and
> if there are some differences caused by wrapper functions, then they
> are noted on the page.
>=20
> I admint that clone(2) is an unusual case. The signature given at the
> top of the page is for the wrapper (and later the difference to the
> syscall raw interface are described). However, the details are
> primarily about the underlying kernel interface, so I'm inclined to
> leave the page where it is.

i think his point is that the syscall doesn't take a func pointer.  it is=20
userspace (the C lib) that takes care of making the clone syscall and then=
=20
calling the function.  the man page doesn't mention this anywhere that i se=
e.

the notes section does refer to this as being a "system call" instead of a=
=20
"system call wrapper" when discussing ia64.

also, the quoted syscall signature isn't the whole story.  there's actually=
=20
more variants:
#ifdef __ARCH_WANT_SYS_CLONE
#ifdef CONFIG_CLONE_BACKWARDS
SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
         int __user *, parent_tidptr,
         int, tls_val,
         int __user *, child_tidptr)
#elif defined(CONFIG_CLONE_BACKWARDS2)
SYSCALL_DEFINE5(clone, unsigned long, newsp, unsigned long, clone_flags,
         int __user *, parent_tidptr,
         int __user *, child_tidptr,
         int, tls_val)
#else
SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
         int __user *, parent_tidptr,
         int __user *, child_tidptr,
         int, tls_val)
=2E..

these arches don't define __ARCH_WANT_SYS_CLONE:
	blackfin ia64 m68k sparc

and i gave up enumerating all the other edge cases :)
=2Dmike

--nextPart1405504.TyDH1SEqC2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRYcLrAAoJEEFjO5/oN/WByZkQALuoIuxdjm2mPHy5tGlw+HiC
YJMHhzvlqGIF7533w71X9eM9pjV8QuaBo3uajfXPt+PY4z7GR5LY+7oa7Ar5oezl
LZh9ZpxBN0ea83jAe0tzgLhANBF/TEC45E1Nh+5wwxVT+F2rYjnzBaj454f7JDOq
zFp/M1nMiqFv9+pGFGc8ZUNyjS62/zOYtuAQ9CoLF4Nh5rNoz4w+b+v9Qmy859vw
kxTYz/Iri22QwUBMMUYhWtcJzLhBq5iPdkSG8YHleMFT4VdQZIWUC8ialSZPwrEp
d1N6N1MqcvTJLo2e6wBBjba9VJ8to3lZLFP77UKDwwpfqXmvQXhTp41NYE0aHnk4
rz600pQGTNjLiblvW7fes+FYBMPrCV0Kypci+XTxAA6bY0WeqrSGigXwRWkouW2D
hVly9Y+Ue+oM4bZlI58npdt+DNFNDKKs1F4BdrYT9bvR6/URetWjji48JreTp1pJ
1UZImZ1MQe9NrjbYzc1Ko6YDiYu7lu2va4yCviX5xRphDuZO/D6g7s4vgEAxyI/r
kdyJdoC2S+ocuHZkbuYQY1/dzqyvZcGYuUoCXFWrc+FxhBN6AEbEVpddHcvh+CiA
jaGjUkolnABGgAUZF7TFMfHFVqs5pMQpRv4RY6MI/8+zIO/FgPqmAcmmN+YOo7Bk
1eixAwaJOLexvKJIrhM2
=OYbT
-----END PGP SIGNATURE-----

--nextPart1405504.TyDH1SEqC2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
