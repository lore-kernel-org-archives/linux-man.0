From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 20 Mar 2012 23:57:25 -0400
Message-ID: <201203202357.26672.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <201203192050.48882.vapier@gentoo.org> <CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6801794.iesaSX0Y59";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart6801794.iesaSX0Y59
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 20 March 2012 02:27:31 Michael Kerrisk (man-pages) wrote:
> On Tue, Mar 20, 2012 at 1:50 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On Monday 19 March 2012 16:45:41 Michael Kerrisk (man-pages) wrote:
> >> A quick question about one piece:
> >> > +The count values might be individually capped according to
> >> > \fIUIO_MAXIOV\fP. +If the Linux kernel is capped at smaller values,
> >> > the C library will take care +of emulating the limit it exposes (if
> >> > it is bigger) so the user only needs to +care about that (what the C
> >> > library defines).
> >>=20
> >> I don't see anything in glibc that does this. Have I missed something?
> >=20
> > i think you're correct.  the code in glibc atm is merely a syscall().  i
> > think the idea was to have the C library guarantee that and if moving
> > forward the kernel changes, the C library would update by adding a
> > wrapper.  maybe just drop this sentence until that day comes ?
>=20
> So, does the kernel currently impose a limit on the size of the iovec?
> It wasn't immediately clear to me from a quick scan of the source.

yes.  process_vm_{read,write}v() in mm/process_vm_access.c calls=20
process_vm_rw() which calls rw_copy_check_uvector() in fs/read_write.c and =
one=20
of the first things it does:
    if (nr_segs > UIO_MAXIOV) {
        ret =3D -EINVAL;
        goto out;
    }
=2Dmike

--nextPart6801794.iesaSX0Y59
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPaVGmAAoJEEFjO5/oN/WB11gP/jjR202LBc+llTbR1ZNZm1Dg
mrTXh/nncWxElZinWJPqQvtnndLhN0yhY4Csl5MbDj1EN6GI+6BHtDE1tWhpurT6
DxxGBy3gNjsxqbFQoAie0Q5aNYIyGlsoEv1XEC2yLFI1LblN2B2S7q1v+ohQN/CB
fidvPcZehEZaiGK0GN5iEtfoLQTZ4Rk79LbriUyvxvBIykbk7ILvDeOzzWeMdyCi
/8vG13f5GSwxoIk7pV/wGYcMqMCSERO7uyMBf76UjzBiAlncDo4P7ANoU8q5ATMm
bguqhRzsdYJHzgwBFRhE1v555up4tO7byOfkqqOtMJDQfFNz/xdh50ZYSpgFwmAz
KioCDb2HwkRI0vUTWTfHFOKm/Twk4WcYwMrMhWaEPxtZJrCSpaFjMmEbGX4IZqCK
AJQwkJs0TMinJSWjT65LISsSjUkwhgh+f/2a1VRzKHu/YtYUa4XmDgsHFhtAftmx
149r3zJhzgQle+NrY83AQSitXMtY047IBytxsnX9Mlm5L23K0BO7OTv3BImrxpRK
9UqlZyhQqL3Rmkvc2ziP4pNOHLslSzOBQ57a/Lb4ig4B+FPgcc3Yo5SwsWt5u7bN
QnjCaAQ6h7GNUNzPdHVLPxdN26RW1NncOCtbGOCJahFIIHU/ZdOVvQDIKrTmc0Z6
od2gftzjki8ZEXiREvl0
=+3UJ
-----END PGP SIGNATURE-----

--nextPart6801794.iesaSX0Y59--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
