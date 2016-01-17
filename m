From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_SET_PDEATHSIG by orphan process
Date: Sun, 17 Jan 2016 19:15:45 +0100
Message-ID: <20160117181545.GA11795@pc.thejh.net>
References: <1452104606-25569-1-git-send-email-jann@thejh.net>
 <568FE223.20209@gmail.com>
 <20160108163949.GA4313@pc.thejh.net>
 <56900BA1.6000708@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56900BA1.6000708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 08:18:57PM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Jann,
>=20
> On 01/08/2016 05:39 PM, Jann Horn wrote:
> > On Fri, Jan 08, 2016 at 05:21:55PM +0100, Michael Kerrisk (man-pages) w=
rote:
> >> Hi Jann,
> >>
> >> Your mail is a little cryptic. It would be best to start with
> >> a brief summary of your point--something like the text of your
> >> patch at the end of the mail.
> >=20
> > Ok, will do that next time. I wanted to avoid duplicating the content.
>=20
> But you did it again :-). See below.
>=20
> >> On 01/06/2016 07:23 PM, Jann Horn wrote:
> >>> Proof:
> >>> In kernel/sys.c:
> >>>
> >>> 	case PR_SET_PDEATHSIG:
> >>> 		if (!valid_signal(arg2)) {
> >>> 			error =3D -EINVAL;
> >>> 			break;
> >>> 		}
> >>> 		me->pdeath_signal =3D arg2;
> >>> 		break;
> >>
> >> I don't understand how the code above relates to the point you
> >> want to make. (Or maybe you mean: "look, there's no check here
> >> to see that if the parent is already dead"; but it would help
> >> to state that explicitly).
> >=20
> > Yes, that's what I meant.
> >=20
> >=20
> >>> Testcase:
> >>>
> >>> #include <sys/prctl.h>
> >>> #include <err.h>
> >>> #include <unistd.h>
> >>> #include <signal.h>
> >>> #include <stdio.h>
> >>>
> >>> void ponk(int s) {
> >>>   puts("ponk!");
> >>> }
> >>>
> >>> int main(void) {
> >>>   if (fork() =3D=3D 0) {
> >>>     if (fork() =3D=3D 0) {
> >>>       sleep(1);
> >>>       signal(SIGUSR1, ponk);
> >>>       prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
> >>>       sleep(1);
> >>>       return 0;
> >>>     }
> >>>     return 0;
> >>>   }
> >>>
> >>>   sleep(3);
> >>>   return 0;
> >>> }
> >>> ---
> >>>  man2/prctl.2 | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/man2/prctl.2 b/man2/prctl.2
> >>> index 5cea3bb..3dce8e9 100644
> >>> --- a/man2/prctl.2
> >>> +++ b/man2/prctl.2
> >>> @@ -670,6 +670,9 @@ In other words, the signal will be sent when that=
 thread terminates
> >>>  (via, for example,
> >>>  .BR pthread_exit (3)),
> >>>  rather than after all of the threads in the parent process terminate.
> >>> +
> >>> +If the parent has already died by the time the parent death signal
> >>> +is set, the new parent death signal will not be sent.
> >>
> >> In a way, this seems almost obvious. But perhaps it is better to make =
the
> >> point explicitly, as you suggest. But, because there may have been a
> >> previous PR_SET_PDEATHSIG, I'd prefer something like this:
> >>
> >> [[
> >> If the caller's parent has already died by the time of this
> >> PR_SET_PDEATHSIG operation, the operation shall have no effect.
> >> ]]
> >>
> >> What do you think?
> >=20
> > I don't think "no effect" would be strictly correct because weird stuff
> > happens on subreaper death - I'm not sure whether this is intended or a
> > bug though:
>=20
> Pause. Please begin with a short explanation of what you're about to
> demonstrate with the following code.... As it is, I am (again) not at
> all clear about the point you are trying to make.
>=20
> > $ cat deathsig2.c
> > #include <sys/prctl.h>
> > #include <err.h>
> > #include <unistd.h>
> > #include <signal.h>
> > #include <stdio.h>
> >=20
> > void ponk(int s) {
> >   puts("ponk!");
> > }
> >=20
> > int main(void) {
> >   if (fork() =3D=3D 0) {
> >     prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
> >     puts("enabled subreaper");
> >     if (fork() =3D=3D 0) {
> >       if (fork() =3D=3D 0) {
> >         sleep(1);
> >         puts("setting deathsig...");
> >         signal(SIGUSR1, ponk);
> >         prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
> >         sleep(2);
> >         return 0;
> >       }
> >       puts("parent will die now, causing reparent to subreaper");
> >       return 0;
> >     }
> >     sleep(2);
> >     puts("subreaper will die now");
> >     return 0;
> >   }
> >   sleep(4);
> >   return 0;
> > }
> > $ gcc -o deathsig2 deathsig2.c
> > $ cat deathsig3.c
> > #include <sys/prctl.h>
> > #include <err.h>
> > #include <unistd.h>
> > #include <signal.h>
> > #include <stdio.h>
> >=20
> > void ponk(int s) {
> >   puts("ponk!");
> > }
> >=20
> > int main(void) {
> >   if (fork() =3D=3D 0) {
> >     prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
> >     puts("enabled subreaper");
> >     if (fork() =3D=3D 0) {
> >       if (fork() =3D=3D 0) {
> >         puts("setting deathsig...");
> >         signal(SIGUSR1, ponk);
> >         prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
> >         sleep(3);
> >         return 0;
> >       }
> >       sleep(1);
> >       puts("parent will die now, causing reparent to subreaper");
> >       return 0;
> >     }
> >     sleep(2);
> >     puts("subreaper will die now");
> >     return 0;
> >   }
> >   sleep(4);
> >   return 0;
> > }
> > $ gcc -o deathsig3 deathsig3.c
> > $ ./deathsig2
> > enabled subreaper
> > parent will die now, causing reparent to subreaper
> > setting deathsig...
> > subreaper will die now
> > ponk!
> > $ ./deathsig3
> > enabled subreaper
> > setting deathsig...
> > parent will die now, causing reparent to subreaper
> > ponk!
> > subreaper will die now
> > $=20
> >=20
> > I didn't manage to find the reason for that in the code.
>=20
> The reason for *what*? I am none the wiser.... What do you
> see as anomalous in the above? Please explain, so I can
> follow you.
>=20
> > Sorry, I probably should have tried to figure out the details of
> > this before sending a manpages patch.
>=20
> FWIW, all of the above looks legitimate and expected to me, but
> again, I'm not sure, because you didn't explain your point, just
> showed some code...

Setting a parent death signal while the parent is still alive causes
a death signal to be sent when the parent dies, but no death signal
is sent on subsequent subreaper parent deaths.

Setting a parent death signal when the parent is already dead, as
far as I can tell, causes a death signal to be sent on the death of
the first subreaper - but not on further subreaper deaths after the
reported one.=20

This means that the statement "If the caller's parent has already
died by the time of this PR_SET_PDEATHSIG operation, the operation
shall have no effect." would be false because the operation could
still have the effect of sending a signal when the subreaper dies.
deathsig2.c demonstrates this: PR_SET_PDEATHSIG is used after the
parent has died and still has the effect of causing a signal
handler invocation.

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWm9pRAAoJED4KNFJOeCOogrEP/2OxHfCDpJQaVNOT7AM17XQY
Cyv5R94SfPt4ACYvdvOkgU6nG/+VPKbaKYC8uqrdVfGNqdFZhrOj9wv7qdRm2jxx
3GYaxTbxGWvK0zMmWMDahcwxQnjccyntxsjMN4ZLII19ivf/jL2r1Rd89FtDnm5H
4StHDQMANReOgFIIDCd5DB1GGJyWM83mnG6zBoJ6z4gSg9MjrLHlYrdQXnVZ7dWU
pk2x+6fv0ziml09iWfJl2Myzqli6cV5g1dg+G+QKkj1Ml4DoChGh2IcZctgzC/zg
OSNlHOe4aWilwcf1SGvgzrDkviosz84uaq8/+Ac5QKynYajaPbSsCxywVyo1+8Gi
cPEh3yNcf5M4IkQT7TSl3HyIwCt3TwDAD80FX3Ovj1gw1/a69eye3u3tCmFTlhwx
2T0EdcJ1wZSt4STK6h2qiA3CC4PrgqF9QsFTdhd7eH9uVUUCI/MLU/EoWu5Tw/ui
y9swpI0R4+9vhp5XcChsDyIPpEzDBinCyfbO+MWWOMHutyf3luVj7/7PKGSI114Y
5Ij9cpQqlBax3UhVPiUHCeeX1a54y7ybylN5Mr5r8hWjJJM47ZoK5FhZMNM8CiOy
hDJePghprUeTuI/eJXa74K+qGhtoUJVJrK+qlT1OcAxWYFUyI2VI599Nf9EBjNH9
6LGLG7AS6wFXFZ2RqnBx
=NKM8
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
