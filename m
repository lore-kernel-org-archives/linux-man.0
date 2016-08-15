From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Mon, 15 Aug 2016 13:53:33 +0200
Message-ID: <20160815115333.GA11115@pc.thejh.net>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
 <20160814204635.GA2803@pc.thejh.net>
 <20160814221359.GD1857@uranus.lan>
 <20160814224546.GA32168@pc.thejh.net>
 <20160815085004.GE1857@uranus.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160815085004.GE1857-ZmlpmtaulQd+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 11:50:04AM +0300, Cyrill Gorcunov wrote:
> On Mon, Aug 15, 2016 at 12:45:46AM +0200, Jann Horn wrote:
> > > >=20
> > > > That's pretty much inherent when you're inspecting a moving system =
- by the
> > > > time you've collected your information, it might be stale. So what?
> > >=20
> > > What "what"? I told you that the information you fetch from running s=
ystem
> > > only valid when kernel does its work, once you jump back to userspace
> > > the information might not be valid anymore. And the @children does the
> > > same: in native procfs read you may miss freshly created processes,
> > > in @children read you may miss exited processes. It's the same nature.
> >=20
> > "in @children read you may miss exited processes"? If that was the exte=
nt of it,
> > everything would be fine. But that's not what's happening. Read the com=
ment in
> > get_children_pid():
> >=20
> > 	 * We might miss some children here if children
> > 	 * are exited while we were not holding the lock,
> > 	 * but it was never promised to be accurate that
> > 	 * much.
> > 	 *
> > 	 * "Just suppose that the parent sleeps, but N children
> > 	 *  exit after we printed their tids. Now the slow paths
> > 	 *  skips N extra children, we miss N tasks." (c)
> >=20
> > "skips N extra children". *NOT* necessarily the same N children that ex=
ited, but
> > also children that were running before you started reading the "childre=
n" file
> > and are still running afterwards.
>=20
> I happen to know how this code work, i've been writting it. And it's the =
same
> as reading plain pids: you might miss freshly created pids completely unt=
il
> the re-read. The rule of thumb is to re-validate the results, always, or
> stop the processes first.

Ah, I think maybe I understad what you're saying. If you want a list of PID=
s that
includes all stable children of a given running process, you have to read t=
he
"children" file in a loop until two reads return the same list, using the f=
act
that the children are ordered by the time they became children of the target
process and therefore the read following a read that triggered the slowpath
always returns something different unless all children following the positi=
on
that triggered the slowpath are replaced? Or something like that?

(If you just read "children" without the loop-until-stable rule, as far as =
I can
tell, no amount of revalidation will prevent you from missing dropped child=
ren.)

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsa09AAoJED4KNFJOeCOo1SsQAK5+87RDrVPB/I5ldhJ9LZPu
FOwMkms9iTulj4ibjQUzprPr8yiiB1/tpV4cpc7yVVtmQminlb6pqZNKsHnTDZNs
VqeyyHETxVTAblSw3Mpej5g+XiX7Bd/MYIPYoqRa6/EVwKr/W1M4Z1uXBzEBG3KV
kOnWrvHMR0clIBIA7ZfAHe8Hv5eznxAN6z4140bJ4SXPtyIRHuVcrQrolpQr92u9
DtiC19zrrhZvRB7wpakTmpmY6rqHw6UvitexqdT76c+MRhWw2fx5tE4xex7H/2ZP
YfUhtRzZ5BJ4y4x3kAwU3sur8jsVOqAJ/j69Zi/7m8B4IvBm8OEhCqcCdqhS2+xG
4B7OQpsl3SJC4n2VqONTYDQiXrYS8ZL8lvD03oS0D4hs6Rt5Nc0ESGYIGzsbfB0h
vfaqjXqFoizL8GzWwuBkcHEVCYD3n6kULRsjlS8qWt9eqbJYFHMzoRdqCTHPtQlY
yXb7qsE+9yQH3WxuGpt0J0bcu27ur6KWg3s9xbAdLRf50NZd2pTV8ec/THDpbvTA
SLPDLfRwn7p9/k6/BL/M2w9xrnzZ7SMxb51NWZbISUfNC7BxIy/vg/rXiQSgzuaA
N5oyYidqm7567iJxvDYL/UVylc1y8alao2l5DOtJS6H4SnzeMe5Yz6WG4S8GZLbl
w71bGl2X9/Bx47cYBPPX
=Q78m
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
