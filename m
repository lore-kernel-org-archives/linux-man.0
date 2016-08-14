From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Mon, 15 Aug 2016 00:45:46 +0200
Message-ID: <20160814224546.GA32168@pc.thejh.net>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
 <20160814204635.GA2803@pc.thejh.net>
 <20160814221359.GD1857@uranus.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814221359.GD1857-ZmlpmtaulQd+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 01:13:59AM +0300, Cyrill Gorcunov wrote:
> On Sun, Aug 14, 2016 at 10:46:35PM +0200, Jann Horn wrote:
> > On Sun, Aug 14, 2016 at 11:14:41PM +0300, Cyrill Gorcunov wrote:
> > > On Sun, Aug 14, 2016 at 12:48:56PM +0200, Jann Horn wrote:
> > > > >=20
> > > > > Hi! First of all, sorry for delay. Guys, this is not really true.=
 The same
> > > > > applies to plain "ls /proc".
> > > >=20
> > > > It does not. /proc is wobbly in a running system, /proc/$pid/childr=
en is
> > > > completely unreliable.
> > >=20
> > > Nope -- look into how pids are instantinated: once pids are read new =
ones
> > > may appear which you won't notice without re-read. You still may miss=
 freshly
> > > created pids.
> >=20
> > That's pretty much inherent when you're inspecting a moving system - by=
 the
> > time you've collected your information, it might be stale. So what?
>=20
> What "what"? I told you that the information you fetch from running system
> only valid when kernel does its work, once you jump back to userspace
> the information might not be valid anymore. And the @children does the
> same: in native procfs read you may miss freshly created processes,
> in @children read you may miss exited processes. It's the same nature.

"in @children read you may miss exited processes"? If that was the extent o=
f it,
everything would be fine. But that's not what's happening. Read the comment=
 in
get_children_pid():

	 * We might miss some children here if children
	 * are exited while we were not holding the lock,
	 * but it was never promised to be accurate that
	 * much.
	 *
	 * "Just suppose that the parent sleeps, but N children
	 *  exit after we printed their tids. Now the slow paths
	 *  skips N extra children, we miss N tasks." (c)

"skips N extra children". *NOT* necessarily the same N children that exited=
, but
also children that were running before you started reading the "children" f=
ile
and are still running afterwards.

That's the big difference between the interfaces: Normal procfs reads might=
 not
return new or outdated information, which is mostly inherent when you're
inspecting a running system, but the "children" interface can also drop
information about completely stable task relationships.


> > > > I think these should work for obtaining a sufficiently consistent v=
iew
> > > > of the process structure of a running system.
> > > >=20
> > > > But yeah, safely using this interface isn't easy, and more
> > > > inode-centered APIs for interaction with processes would be nice to
> > > > have. (E.g. an entry in /proc/$pid that points to the parent inode,
> > > > maybe a directory containing entries that point to the child inodes,
> > > > and process directory entries offering functionality equivalent to
> > > > syscalls like kill(), sched_setscheduler() and prlimit().)
> > >=20
> > > Well, all this really waste a huge amount of time, that's why we need=
ed
> > > $children. In general more preferred way might be task-diag interface
> > > which Andrew implemented (I'm not sure which exactly state of the
> > > series at the moment, have it been merged or not https://lkml.org/lkm=
l/2016/4/11/932)
> >=20
> > Yuck. Everything is PID-based? That's ugly.
>=20
> That happened the process are pid based things.

PID-based interfaces suck unless you're the ptracer or reaper of all the
tasks you're inspecting, and an interface based on less reusable handles
(like procfs directory file descriptors or unique 64-bit identifiers or
whatever) would be much safer.

Yes, I know that all those traditional APIs use PIDs, but that doesn't
change that those interfaces suck. When you kill -9 a daemon that doesn't
quit when asked to quit, for example, there's a chance that the daemon
actually does quit and its PID is reallocated to some vital system
service just before you call kill() - and then your system breaks in
some unpleasant way.

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsPSaAAoJED4KNFJOeCOo+HcP/0F0MlUKBhA504aEtgMuuwGp
FCywiz5dTeMAQqs5EyYEExbOF9OPgzv2HmKeiWAqUjvhNU3RI3pyJfAOYBgFWlUC
JzIHJUSx/wFczTkIxgZmXKrOrwnJM7w6YWxLCoWeeDxSPHtGj0QjkshxoodiuEI/
jMRoo1gVKIEFaXtfKg7iBeuJf5zqr1ASC3i2G+X2x9/IMxxlvH3bOR36o2tOOXzO
KvoQsm+7ztEWI6DjbUCR/jaVncWt3AJ/eh6omUVyvLtvIPZtNsEju2CEeNX6BjXz
iuDYMvirzOyYUm5B/Iy3/Q8eNBMhw7YHfLgx+lkGKhzHLWQkgh/zmE09Gv1j+/7F
vXRjAT3XxSdkfJ48KS1R1fO/yCopwSDqxjHE16FJBIjOEjbAuUGeARWXBwKeh6zV
bqL0KWg01x7Vh8XCPwPulkgznboElG5ygXMay5KJzrIox2K/la13gQ/M56j/mVM4
J55j/YghaVxd+8Tlc0rkMCE/Rcxhb5C1smUu901FO7jNATfH0G0U3m10N1R4tuk+
Du5nJYHnqXbbZR24rlGuO81PHP6Sfv+8PpCVtckI6H7LSHjXyRrW+YnWPlnAGncc
YcvOkeeAHSKfE5A/sCCo1pDt3Pe1r8MbNoLVltuFBb7XuoogBUBjWplyDAb3yCwf
7/vDuWFnHF9uGVglg629
=0bxe
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
