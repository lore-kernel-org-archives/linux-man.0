From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Sun, 14 Aug 2016 12:48:56 +0200
Message-ID: <20160814104856.GA12246@pc.thejh.net>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
 <20160814084026.GA1857@uranus.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160814084026.GA1857-ZmlpmtaulQd+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 11:40:26AM +0300, Cyrill Gorcunov wrote:
> On Thu, Aug 04, 2016 at 12:52:54AM +0200, Jann Horn wrote:
> ...
> > >=20
> > > Thanks for this! I tweaked your text somewhat, and added some
> > > details about kernel configuration options, so that now the text
> > > reads:
> > >=20
> > >        /proc/[pid]/task/[tid]/children (since Linux 3.5)
> > >               A  space-separated  list  of child tasks of this task.
> > >               Each child task is represented by its TID.
> > >=20
> > >               This option is intended for  use  by  the  checkpoint-
> > >               restore (CRIU) system, and reliably provides a list of
> > >               children only  if  all  of  the  child  processes  are
> > >               stopped or frozen.  It does not work properly if chil=
=E2=80=90
> > >               dren of the target task exit while the file  is  being
> > >               read!  Exiting children may cause non-exiting children
> > >               to be omitted from the list.  This makes  this  inter=
=E2=80=90
> > >               face  even  more  unreliable  than  classic  PID-based
> > >               approaches if the  inspected  task  and  its  children
> > >               aren't  frozen,  and most code should probably not use
> > >               this interface.
>=20
> Hi! First of all, sorry for delay. Guys, this is not really true. The same
> applies to plain "ls /proc".

It does not. /proc is wobbly in a running system, /proc/$pid/children is
completely unreliable.


> You can fetch pid from the procfs and then
> process get dead just right after you've finished reading. So this interf=
ace
> works "properly" all the time, but if one needs precise results it should
> stop/freeze processes first. In contrary I think it worth switching into
> children interface in user-space programs because it incredibly fast.

In procfs, when you want to enumerate all tasks that are currently running,
you can do the following:

 - Read /proc with readdir() or so, but discard all information except for
   the PIDs.
 - For each PID:
  - chdir() into /proc/$pid
  - stat '.' and read files inside '.'

This will yield information about all tasks that were running at the start
of the operation and are still running. AFAIK, the internal consistency of
per-task data has the following guarantee: All data that was collected as
per-task data really belongs to the same task; PID reuse has no effect on
that (because the /proc/$pid inode will not be reassociated with a new
task that reuses the PID). Of course, different pieces of data that were
collected at different points in time can still be somewhat inconsistent -
especially if an execve() call happens in the meantime.

Looking up the procfs inodes corresponding to the parents or children of
a process is a bit more complicated, but still doable. To look up the
parent inode for a /proc/$pid inode:

 - Grab the ppid number from the "stat" entry in the process inode.
 - Take a reference (a file descriptor) to the inode at /proc/$ppid.
 - re-read the "stat" entry in the process inode and check whether the
   ppid changed. if not, you're done. if yes, retry.

This works because, while the parent of a task can change multiple
times, each such change changes the PPID to a value it never had before.
This is true because all subreapers of a process have to be ancestors of
it, and the ancestors of a process have to already exist when it spawns,
so they can't spawn after the death of the process, so they can't reuse
the PID of the process. So with this trick, you can determine the parent
of a process in a stable way.

This approach can then be reused to find the children of a process with
inode fd $ppid_fd:

 - Read the PID from "stat" under $ppid_fd.
 - Create an empty result set $result that can hold file descriptors.
 - For each numeric entry in /proc/:
  - chdir() into /proc/$pid.
  - Read "stat"; if the PPID isn't $wanted_ppid, go to next iteration.
  - Add openat(".") to $result.
 - If "stat" under $ppid_fd is still readable (as opposed to returning
   -ESRCH on openat()), return $result.
 - Return an empty result set or an error or so; the parent's PID has
   been deallocated.

I think these should work for obtaining a sufficiently consistent view
of the process structure of a running system.

But yeah, safely using this interface isn't easy, and more
inode-centered APIs for interaction with processes would be nice to
have. (E.g. an entry in /proc/$pid that points to the parent inode,
maybe a directory containing entries that point to the child inodes,
and process directory entries offering functionality equivalent to
syscalls like kill(), sched_setscheduler() and prlimit().)

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXsEyXAAoJED4KNFJOeCOohN8P/RHhL9IWwnSSG3cjF1QHjGFA
SVi82B9bxmNq72R1oBa57CzNX/Bo+udxeDh11RY6umGUH9CBKWPRJyPoPnhjcYt4
eM76GfvgkdoA68AJE+HYReFUXCUdsbCwtVSYqufr6oWm9oQInoWJC0clgOKkq4mK
ejbJase3ND+Hndggi2aab0P/5/quGOenzr+co+b8B/u1NHQkr2tj14bXJYpL8Dr6
uHT9jVcqggzjv9Xr001JzN4zQ+M+fOgTKGS/QCfqkClaqqB75D6IJRuyg4q7Q9zR
of1dqbN/pGCYCw0YxX2Ots8OlKHyYmUlAT9ZWcwfCBLMJMktPrp2yrgMYfbseYSe
kemfpbexHmo/NeAYD/B7m4LKpOgIt1lUHVC68KiXPazzzb3WNlELiSggSnmayakI
qOYScdnAiqIZNzMApOZhzYDSzQWuShpsLCfjLQHtL3a8gCwMa+a2UnI+6n85yuS9
czF4fxnrpJonlOPweIIWpjD8/51mTd6kqzoGHAHxZ/lWbJPMMihJZ4PISLGin7Fs
F2GvMbtLH7ENJeBNQCjgFS1cOxivkLi3dGr0z72xw6HilVTG/QNMMW5XGX1v5ZQ/
mUVP4NB+fw6p+0Aa7Sny4P9EhfvtvknwD3gWJ0TPsW33sbBbInctgAUVQ5bTBnjy
d6uqe72tBHgGgnnxQY1p
=Y99U
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
