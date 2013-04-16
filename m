From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Tue, 16 Apr 2013 11:37:47 -0400
Message-ID: <201304161137.49482.vapier@gentoo.org>
References: <515EF542.8090200@redhat.com> <201304071503.07751.vapier@gentoo.org> <CAKgNAkjQ1PfvrVgJ_UXUerG9MzLAoUt9ixgS07L9LAroCW7_Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9635726.OXXaN7yDDZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjQ1PfvrVgJ_UXUerG9MzLAoUt9ixgS07L9LAroCW7_Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart9635726.OXXaN7yDDZ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 16 April 2013 01:42:56 Michael Kerrisk (man-pages) wrote:
> On Sun, Apr 7, 2013 at 9:03 PM, Mike Frysinger wrote:
> > also, the quoted syscall signature isn't the whole story.  there's
> > actually more variants:
> > #ifdef __ARCH_WANT_SYS_CLONE
> > #ifdef CONFIG_CLONE_BACKWARDS
> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
> >          int __user *, parent_tidptr,
> >          int, tls_val,
> >          int __user *, child_tidptr)
> > #elif defined(CONFIG_CLONE_BACKWARDS2)
> > SYSCALL_DEFINE5(clone, unsigned long, newsp, unsigned long, clone_flags,
> >          int __user *, parent_tidptr,
> >          int __user *, child_tidptr,
> >          int, tls_val)
> > #else
> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
> >          int __user *, parent_tidptr,
> >          int __user *, child_tidptr,
> >          int, tls_val)
> > ...
>=20
> I've worked in some of the above detail; see the Git copy of the page.
>=20
> > these arches don't define __ARCH_WANT_SYS_CLONE:
> >         blackfin ia64 m68k sparc
>=20
> I'm not sure of the significance of the above; can you explain?

the three clone variants i posted above are bracketed by the define=20
__ARCH_WANT_SYS_CLONE.  so if the arch doesn't define that, it means it has=
 its=20
own implementation of clone() in its arch/$ARCH/ tree, so the exact prototy=
pe=20
has to be tracked down from there.
=2Dmike

--nextPart9635726.OXXaN7yDDZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRbXBNAAoJEEFjO5/oN/WBUUYQANFaCJeyyn4e25sd4nkAfcCq
hcW17KZsnTQcFG9zJLQuGypXfQa/GXGjyFL22YUjNasm7pWhjYY75FGMf2VAbMFr
GIK0zMxFf5ImQCsc7v31+gACtG0fERqB6jaYq2qyx4VrYav8mkAKUogDAXWarOXI
y7zesl7lkoKDYM8oDr02v8QOisre3DsPUZp5s/aPT/CjTpIUIa4yS2bWQ0mrh/jr
qHrezcHoB5vhoGCCkciJEBq1dAXaUTIn/K2fu4Fil0B+AzmjK21dFMma+qWg8anp
2U95u96ojvSJpkEbfRPSJJDfoYEsrUJE7PZJWvJ3LI7oCgDurbO6H58kHHFlibqp
NBvjDo+XjIjAoCLFsyxuI3/zS6p1pwZzA7aBHvhA9Rdc5O5Ada1ht9fCG3c5XRvp
ob8SE36MnkzI7ewn0SmIIn41fQ1vztFTVI/0SQWCIYjhT5SDqlAURp0rSKg/XLFL
+CTr/3yxqjvjs3C0WgZgu1atExHs3cSnnkWVhllxnljhS9fWTy9kwlFkcMFdGY6C
wYa08tGJDSgt16yLZeWi4SdrEgvodw+5Wtqdmx79AfQX1zBTTjlmRcsSNGuEp9mg
yc3oZ/FTmyPe3g6qsa6iU/c8s4FyQam4w2UADCWRzgOQrDmp+0Y1OBfVi5jFTWwL
q7cqp/YYBoSdhdZqzfat
=86r/
-----END PGP SIGNATURE-----

--nextPart9635726.OXXaN7yDDZ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
