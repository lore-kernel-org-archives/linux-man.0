From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: ptrace(2): wrong kernel version for PTRACE_SEIZE and others
Date: Mon, 28 Mar 2016 00:30:19 -0400
Message-ID: <20160328043019.GW6588@vapier.lan>
References: <CACh33FrJRvC-ZQkBD2DZjW-YYnqNY5iCu_DtB8x+Jz_w80tMPg@mail.gmail.com>
 <20160322111629.GA13320@altlinux.org>
 <CAKgNAkg-MfedjbfFqjP7OjXuyN_akats1GJpZPfRk68TgEh8Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UsrAG29rLThGqKyc"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkg-MfedjbfFqjP7OjXuyN_akats1GJpZPfRk68TgEh8Fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--UsrAG29rLThGqKyc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28 Mar 2016 16:55, Michael Kerrisk (man-pages) wrote:
> On 23 March 2016 at 00:16, Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
> > On Fri, Mar 18, 2016 at 05:21:28PM -0400, Patrick Donnelly wrote:
> >> The ptrace(2) man page says that PTRACE_SEIZE, PTRACE_LISTEN, and
> >> PTRACE_INTERRUPT was introduced in Linux 3.4. In fact, this was added
> >> in 3.1:
> >>
> >> $ git diff v3.0 v3.1 include/linux/ptrace.h | grep SEIZE
> >> +#define PTRACE_SEIZE           0x4206
> >> +/* flags in @data for PTRACE_SEIZE */
> >> +#define PTRACE_SEIZE_DEVEL     0x80000000 /* temp flag for developmen=
t */
> >
> > Yes, PTRACE_SEIZE was introduced by commit v3.1-rc1~308^2~28, but
> > it had to be used along with a temporary flag PTRACE_SEIZE_DEVEL,
> > which was removed later by commit v3.4-rc1~109^2~20.
> >
> > That is, between v3.0 and v3.4 we had a test mode of PTRACE_SEIZE API,
> > which was not compatible with the current PTRACE_SEIZE API introduced
> > in Linux 3.4.
>=20
> So, it sounds like the page is good as it stands, right?

if the commented source has these details, then yes.  otherwise, might
be good to stash them in the commented block.  i don't think it should
be exposed to the user.

glancing at the source, i'm not seeing a commented block.
-mike

--UsrAG29rLThGqKyc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW+LNbAAoJEEFjO5/oN/WBtvkP/2yBvpr+DM6sGFwOxlvArTmI
4O8Wvoi4eqEItpzfwkl7n4Xk4DQY1//Jjr3pR18ny5W3SzVfxH0S6iadGQTJWHtH
Gma7v8DlE/o3zlPp6ErP/Z7LyCVT6JVyORQbBGVRtWl2guqJJactDcDgWzXjb3lm
IRgrK/obA7k73rCMNYHZT0c3BZ53G9NQ2OtD8fsyQOd3TW8P4tiba0ootD1Z8r+m
pKG76ASVTtVxg4C5YaZNOMpYDki5WR0qI5IImsAvHwTMfrFsrIqdaS/SEJV0EEKT
dCs6VLBMFfxaIA1fc1UGQqDVOlxRHux29L+wUumbZdSIjIUoAm5aPUgEt5WCiT3n
uuHDzN1v0Ka22doSRqgkBfR3CbHG03UDLpasPLjeLVgpVEozkF7E1VwSxXDqiUjN
bIBNlmcZQlIDvwMlA1ew8Snp3C0uO2HvwmrvZ/ELR7ESFbq2V7eArV0XYzAChr8u
2Hf5AAghigMFgpLTUKljo52k6S7z2+6XupRtNiE8SBK2gCJMtEz8EVxsoewqrooj
0uWUG9hKTZb6y1R/jy9VqlOTTZK9Dr2lvmI0A1dklvQTQNOul9X8LnErJm7LO1ZK
l9EvUZQO+pzWpAUm5LNHDk0/o+dp+wKRF8t6h8oKhfSD1P83lGBkhln4/f9J2QVB
3u3VoxG1h6951tNPjGGx
=jUe/
-----END PGP SIGNATURE-----

--UsrAG29rLThGqKyc--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
