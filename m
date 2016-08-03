From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Thu, 4 Aug 2016 00:52:54 +0200
Message-ID: <20160803225254.GA14948@pc.thejh.net>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b97bbf47-1180-0d32-ba08-1482020cc883-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2016 at 08:46:03AM +1000, Michael Kerrisk (man-pages) wrote:
> [Adding a few people to CC, who may also be interested]
>=20
> Hi Jann,
>=20
> On 08/02/2016 10:25 AM, Jann Horn wrote:
> >Document the /proc/[pid]/task/[tid]/children interface from CRIU, and mo=
re
> >importantly, document why it's usually not a good interface.
> >---
> > man5/proc.5 | 23 +++++++++++++++++++++--
> > 1 file changed, 21 insertions(+), 2 deletions(-)
> >
> >diff --git a/man5/proc.5 b/man5/proc.5
> >index 0970c72..ddb14cc 100644
> >--- a/man5/proc.5
> >+++ b/man5/proc.5
> >@@ -2325,14 +2325,33 @@ the corresponding files under
> > .I task/[tid]
> > may have different values (e.g., various fields in each of the
> > .I task/[tid]/status
> >-files may be different for each thread).
> >-
> >+files may be different for each thread),
> >+.\" in particular: "children" :/
> >+or they might not exist in
> >+.I /proc/[pid]
> >+at all.
> > .\" The following was still true as at kernel 2.6.13
> > In a multithreaded process, the contents of the
> > .I /proc/[pid]/task
> > directory are not available if the main thread has already terminated
> > (typically by calling
> > .BR pthread_exit (3)).
> >+
> >+.TP
> >+.IR /proc/[pid]/task/[tid]/children " (since Linux 3.5)"
> >+.\" commit 818411616baf46ceba0cff6f05af3a9b294734f7
> >+A space-separated list of child tasks of this task.
> >+Each child task is represented by its TID.
> >+
> >+.\" see comments in get_children_pid() in fs/proc/array.c
> >+This does not work properly if children of the target task exit while
> >+the file is being read!
> >+Exiting children may cause non-exiting children to be omitted from
> >+the list.
> >+This makes this interface even more unreliable than classic PID-based
> >+approaches if the inspected task and its children aren't frozen, and
> >+most code should probably not use this interface.
> >+
> > .TP
> > .IR /proc/[pid]/timers " (since Linux 3.10)"
> > .\" commit 5ed67f05f66c41e39880a6d61358438a25f9fee5
>=20
> Thanks for this! I tweaked your text somewhat, and added some
> details about kernel configuration options, so that now the text
> reads:
>=20
>        /proc/[pid]/task/[tid]/children (since Linux 3.5)
>               A  space-separated  list  of child tasks of this task.
>               Each child task is represented by its TID.
>=20
>               This option is intended for  use  by  the  checkpoint-
>               restore (CRIU) system, and reliably provides a list of
>               children only  if  all  of  the  child  processes  are
>               stopped or frozen.  It does not work properly if chil=E2=80=
=90
>               dren of the target task exit while the file  is  being
>               read!  Exiting children may cause non-exiting children
>               to be omitted from the list.  This makes  this  inter=E2=80=
=90
>               face  even  more  unreliable  than  classic  PID-based
>               approaches if the  inspected  task  and  its  children
>               aren't  frozen,  and most code should probably not use
>               this interface.
>=20
>               Until Linux 4.2, the presence of this  file  was  gov=E2=80=
=90
>               erned by the CONFIG_CHECKPOINT_RESTORE kernel configu=E2=80=
=90
>               ration option.  Since Linux 4.2, it it is governed  by
>               the CONFIG_PROC_CHILDREN option.
>=20
> Look okay?

Looks good to me.

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXonXGAAoJED4KNFJOeCOo+iAP/A51+JSfYwZR4mQhZyUVgLtB
5hi8pBNf/jqiHN62s58wWW0EzF/woOSt3X5qds8niLlAAH+6yG0ZK1RNaKOGsKec
Mrs8D4vixexPZFoDw7F9v8+5X4d0IJ+Hf8BIp4AJj+IIemUztqXfG7Zsucg+Mz0q
k4NbxeNGY7Q6gc+z5eMpUPuZ5HGan2DQB+EHNkL3jKSu3laLSgeU0kURbKtDWX/Z
e8SuScc1OJcqVzgC82Tg7CtMR1ynCQO5ZnpFAgXTsEXdprt9Yt9byqIHxjbp/VVA
p6jjxetGrP88AasdfQcIbOH7NUaGFh/F9x6lj8rSeEypthkT04IaAO8nmSxHENDk
ccVbJdtDW3GsEmnwtM0lgynVStvKtsLDqhAS5YMijajXeSIeYc1ccWkakW9nBAJk
gvPOuYMQaPSMRy7B4kT6cg7GdTTAB6t3bIKZsWUQhK18ds1pIlrtwpMHaBfT6xBj
crzm5S7i8CTM42oPbpr7zHMtuljXZhiJlefPyJp4KgAMGqfTurM2TcKpVICQtz2w
lYTUtC0OD9RWnfGtZdZ4xdO+7X1IcldfnipY/oLQtxcIRNxbeJh70MCSsJ7NuWaK
M2QdkMAfqoQPkZ1REMowj/UamGir5X2FUinVG6eFGBPB7kD5fe2BzuMazwqSGdCG
E8Bm4RVm8M5RIm1vRVUQ
=EgMl
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
