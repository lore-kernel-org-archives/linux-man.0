From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fchmodat: split kernel/C library documents
Date: Sat, 21 Apr 2012 14:01:01 -0400
Message-ID: <201204211401.02304.vapier@gentoo.org>
References: <1331692947-15879-1-git-send-email-vapier@gentoo.org> <CAKgNAkiACOdmvpr+tyVx-j=twG2Dtp1rNn=km4jR7vvc53K24g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3365877.guu8eSYMRo";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiACOdmvpr+tyVx-j=twG2Dtp1rNn=km4jR7vvc53K24g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3365877.guu8eSYMRo
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 15 April 2012 07:15:27 Michael Kerrisk (man-pages) wrote:
> Take a look at
> http://www.kernel.org/doc/man-pages/todo.html#migrate_to_kernel_source,
> which covers what your patch is trying to do. In general, I'm not in favor
> of patches like this; rather, I try to have a single page where
> differences (if any) between the system call and libc wrapper are
> noted. Thus, I'd propose the patch below instead. Seem okay?

i like having dedicated man pages when things are different as the notes=20
section tends to get missed at the bottom.  but this change is better than=
=20
nothing.

> --- a/man2/fchmodat.2
> +++ b/man2/fchmodat.2
>
> +This page documents the interface provided by the
> +glibc wrapper function for the

not to be pedantic, but this isn't glibc specific.  fchmodat() is a POSIX=20
interface, so every C library will have this difference.
=2Dmike

--nextPart3365877.guu8eSYMRo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPkvXeAAoJEEFjO5/oN/WBG68P/3spYEnr2sNVDgDs/a6wd5OL
Assk2pVq1K8ctrb7PB//OPLRO+2XyyhszxynuItIa1AROD2Aca6C3Za1d9P8H7ki
EEbAftqLMGXDFHA+qc7jsX6U3OXrnb8vofBr+xqDebskEShBBWCHOeLVPKRNVOAo
jYKKGx04XbJ9rouTewalBD8ioRqlMzUhKeZPTyESYNsz88aGbv1oVSeyRgzGZIiM
TQkGviqkwcySuJ9otHy8JB9dqC2aqBj6HJ0iOSNxi+D7J4flXZC8/h7r1TSAING6
vI+d/HWvABbKu6WM+2wnyo/t/0tLM87MLUUhRliBX6qz1Z5mjU/zkkkbv3IEPYd1
X515XcbzZCQXY8w5SjhcCyU/K92CZ4df5kNCf9ZUcRlkIJhfmq1EV+dAnY+y/CHP
59zhUM7RULwM9sr3XPlF1LQg6zWNkeiTAPbUaTAInsSD++8aeXiCXjCyNJ3KXdB+
QMwDiZjJjVvDetaMn9MePhYZV6ZuG6yb3R/N/KfzifYE93LP2R+8w8np7oIZG1a5
8sISvW9PoqJGnmAtUKGY/GVBpPwN4614I4SYUqnljEgpkbw8TqziBI+IzHdNcgjI
682+bkLf1gs1fEl+XLec42TrDFD2nkmGnBDxV1DM4BuREmegqs58XBxiv0wn1mfa
MMNCG8I3FUKI+/f75qY7
=OpCS
-----END PGP SIGNATURE-----

--nextPart3365877.guu8eSYMRo--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
