From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Sun, 14 Aug 2016 22:46:35 +0200
Message-ID: <20160814204635.GA2803@pc.thejh.net>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
 <20160814104856.GA12246@pc.thejh.net>
 <20160814201441.GC1857@uranus.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814201441.GC1857-ZmlpmtaulQd+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>, Andrey Vagin <avagin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 11:14:41PM +0300, Cyrill Gorcunov wrote:
> On Sun, Aug 14, 2016 at 12:48:56PM +0200, Jann Horn wrote:
> > >=20
> > > Hi! First of all, sorry for delay. Guys, this is not really true. The=
 same
> > > applies to plain "ls /proc".
> >=20
> > It does not. /proc is wobbly in a running system, /proc/$pid/children is
> > completely unreliable.
>=20
> Nope -- look into how pids are instantinated: once pids are read new ones
> may appear which you won't notice without re-read. You still may miss fre=
shly
> created pids.

That's pretty much inherent when you're inspecting a moving system - by the
time you've collected your information, it might be stale. So what?

> In turn children doesn't guarantee that the pid you've fetched
> is still valid, and for validation sake we've been using ptrace + test of
> children's parent pid being the same after the read. So no, I wouldn't ca=
ll
> it _completely_ unreliable. It rather may give misses on tasks which are
> using fork/execve intensively, but it's acceptable trade off in a sake
> of speed (and the speed was the primary target why we've added this
> interface).

It's an "acceptable trade off" when such an interface drops information abo=
ut
a relationship that existed before the caller starts inspecting the process
relationships and continues to exist while the inspection runs?
Interfaces that ususally work but sometimes, randomly, silently drop
information just suck, at least if you're trying to write software that
actually works.


> > > You can fetch pid from the procfs and then
> > > process get dead just right after you've finished reading. So this in=
terface
> > > works "properly" all the time, but if one needs precise results it sh=
ould
> > > stop/freeze processes first. In contrary I think it worth switching i=
nto
> > > children interface in user-space programs because it incredibly fast.
> >=20
> > In procfs, when you want to enumerate all tasks that are currently runn=
ing,
> > you can do the following:
> >=20
> >  - Read /proc with readdir() or so, but discard all information except =
for
> >    the PIDs.
> >  - For each PID:
> >   - chdir() into /proc/$pid
> >   - stat '.' and read files inside '.'
> >=20
> > This will yield information about all tasks that were running at the st=
art
> > of the operation and are still running. AFAIK, the internal consistency=
 of
>=20
> No, they may start exiting while you examinate them, but task structure
> and linked data won't disapper until reference is decremented.

=2E.. so?


> > per-task data has the following guarantee: All data that was collected =
as
> > per-task data really belongs to the same task; PID reuse has no effect =
on
> > that (because the /proc/$pid inode will not be reassociated with a new
> > task that reuses the PID). Of course, different pieces of data that were
> > collected at different points in time can still be somewhat inconsisten=
t -
> > especially if an execve() call happens in the meantime.
> >=20
> > Looking up the procfs inodes corresponding to the parents or children of
> > a process is a bit more complicated, but still doable. To look up the
> > parent inode for a /proc/$pid inode:
> >=20
> >  - Grab the ppid number from the "stat" entry in the process inode.
> >  - Take a reference (a file descriptor) to the inode at /proc/$ppid.
> >  - re-read the "stat" entry in the process inode and check whether the
> >    ppid changed. if not, you're done. if yes, retry.
> >=20
> > This works because, while the parent of a task can change multiple
> > times, each such change changes the PPID to a value it never had before.
> > This is true because all subreapers of a process have to be ancestors of
> > it, and the ancestors of a process have to already exist when it spawns,
> > so they can't spawn after the death of the process, so they can't reuse
> > the PID of the process. So with this trick, you can determine the parent
> > of a process in a stable way.
> >=20
> > This approach can then be reused to find the children of a process with
> > inode fd $ppid_fd:
> >=20
> >  - Read the PID from "stat" under $ppid_fd.
> >  - Create an empty result set $result that can hold file descriptors.
> >  - For each numeric entry in /proc/:
> >   - chdir() into /proc/$pid.
> >   - Read "stat"; if the PPID isn't $wanted_ppid, go to next iteration.
> >   - Add openat(".") to $result.
> >  - If "stat" under $ppid_fd is still readable (as opposed to returning
> >    -ESRCH on openat()), return $result.
> >  - Return an empty result set or an error or so; the parent's PID has
> >    been deallocated.
> >=20
> > I think these should work for obtaining a sufficiently consistent view
> > of the process structure of a running system.
> >=20
> > But yeah, safely using this interface isn't easy, and more
> > inode-centered APIs for interaction with processes would be nice to
> > have. (E.g. an entry in /proc/$pid that points to the parent inode,
> > maybe a directory containing entries that point to the child inodes,
> > and process directory entries offering functionality equivalent to
> > syscalls like kill(), sched_setscheduler() and prlimit().)
>=20
> Well, all this really waste a huge amount of time, that's why we needed
> $children. In general more preferred way might be task-diag interface
> which Andrew implemented (I'm not sure which exactly state of the
> series at the moment, have it been merged or not https://lkml.org/lkml/20=
16/4/11/932)

Yuck. Everything is PID-based? That's ugly.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsNirAAoJED4KNFJOeCOovBgP/3sTZOKURM5YF3foR+j8hc8f
pPmX9xQCsYj0jn2IcfHuFlBsAoDTJPTyZWCoKTPhRYc7T6ZOGuXY7wPit3oaOyQJ
09rhIdCNs0IQdAlGXoBImLKKwVJrnDg9vXen3+wt35GQTIZxg0myJXhiiSjV9CR0
+xVfnrCaY2vfC0w4iryNDulwD7hLzBjvg2cSqEOKZR6Hhfep/kFjj3EWr/mT9l1K
WS8OyFHUVYhuhnYWY+KHldwyfyQ54Msgrme5tligxvCasM58hojKDBVNzCJoqTkr
rbLoxj83Iv2Q8k7Cnc82D1EgpZMBeeVyi4ayjVuYSt4q9kNBlfKp19uMJ5DuKfFw
n1rrWBWwLFa25ck5GoJbrJmwS1L38XYD2G1jfSJznjOqKNTMsb6V5JA+UAag13Cm
StLtHTPB5/Eq2dCyGNRgQ94cxOAFahJJ5hwGTY2bO9tw7Lz0+DLGJYbexnRbPvnR
bDivOLMUuKJEAFyu4dtZZGVzTO45+Rs+J/4VmbhOxiPBorL+OrUCLwHrC5MMT+s9
HmQsyHvXtUPghgOKjXc5ARUNAwF/w2JFIOAqqq0E2rz35yOeSeqY6Uux3M8bGaAl
fzFSX11xaeMlyb7wdurUIC3Sh5Ipz9F2uKtPOUozaMejMqOfLX9eJHL1Cn4eHDYU
0KNPgHd5pji77lEOvnuL
=QPkO
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
