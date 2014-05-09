From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Fri, 9 May 2014 10:53:11 +0200
Message-ID: <20140509085311.GJ30445@twins.programming.kicks-ass.net>
References: <20140428081858.GX13658@twins.programming.kicks-ass.net>
 <535FA467.2070403@gmail.com>
 <20140429160441.GU11096@twins.programming.kicks-ass.net>
 <5360D9E5.9080206@gmail.com>
 <20140430130937.GH30445@twins.programming.kicks-ass.net>
 <20140503124355.5d927080518051ca507bc381@gmail.com>
 <536735E0.7020204@gmail.com>
 <20140505072114.GY11096@twins.programming.kicks-ass.net>
 <20140506081636.GA4460@twins.programming.kicks-ass.net>
 <536C907A.1040205@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lUFOiBjYbj2M+tdK"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536C907A.1040205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--lUFOiBjYbj2M+tdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 10:23:22AM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Peter,
>=20
> I'm working on this text. I see the following in kernel/sched/core.c:
>=20
> [[
> static int __sched_setscheduler(struct task_struct *p,
>                                 const struct sched_attr *attr,
>                                 bool user)
> {
>         ...
>=20
>         int policy =3D attr->sched_policy;
>         ...
>         if (policy < 0) {
>                 reset_on_fork =3D p->sched_reset_on_fork;
>                 policy =3D oldpolicy =3D p->policy;
> ]]
>=20
> What's a negative policy about? Is this something that should=20
> be documented?

That's for sched_setparam(), which internally passes policy =3D -1, it
wasn't meant to be user visible, lemme double check that.

sys_sched_setscheduler() -- explicit check for policy < 0
sys_sched_setparam() -- explicitly passes policy=3D-1, not user visible
sys_sched_setattr() -- hmm, it looks like fail


---
Subject: sched: Disallow sched_attr::sched_policy < 0
=46rom: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Date: Fri May  9 10:49:03 CEST 2014

The scheduler uses policy=3D-1 to preserve the current policy state to
implement sys_sched_setparam(), this got exposed to userspace by
accident through sys_sched_setattr(), cure this.

Reported-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Link: http://lkml.kernel.org/n/tip-b4kbwz2qh21xlngdzje00t55-Ckxz5ZWcFp/9qxiX1TGQuw@public.gmane.org
---
 kernel/sched/core.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3711,6 +3711,9 @@ SYSCALL_DEFINE3(sched_setattr, pid_t, pi
 	if (sched_copy_attr(uattr, &attr))
 		return -EFAULT;
=20
+	if (attr.sched_policy < 0)
+		return -EINVAL;
+
 	rcu_read_lock();
 	retval =3D -ESRCH;
 	p =3D find_process_by_pid(pid);

--lUFOiBjYbj2M+tdK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJTbJd3AAoJEHZH4aRLwOS6TaoP+wc3xUldgd/tuGWtdt0JC4sE
8BIygx4L06FxrZdCwjvYCwZbI2aUxLY7iy0XExnIhsiOqD9BpYOVs0tfpc2/KIVP
4bMk7u1N8mbbqSZ9ITecNjFYvHjccDK3YsmF33Nb3WTtYdrEG3E8ddLuUGwXOpVp
CyjT0EOOQy9DrghlNgvK1I1ZS/wKAkI9pqlfjgC94BZkCxnExNcxcmMcS+8thutw
A878FTPpkURPrBIU3lEW1xbgkWMrCmQXz3Y0mhQrv+Dvuuksw1DaVvQbt6weQd/T
LdpdgmhRXI/BKARdH44oc8lymEQCSFrTmS4cpA51kz9lJrLnu/VMoVkJukGGpqJT
m6Bqle7BVNIjzarVtrEEYVsMKpwxeciUCuXhHZoZ/PHo6aY4kjJWnqiueYCKHqcJ
BOZbNuQnyjg+XB7GbXU8pxuN0JbeY7qYQV2IoaUfBBdegwjoPdxfbesgf6DeYxn+
fyR6s1RFfK7vhNNrrstZXl8WUr/zGVu9XIKjGDVqC/9SsFq97wtoFVIShXqGq1+W
o4sMd8XIEVEf+lu9AJlICwo1CNbRGlqXtk+CMpi1CijCuFA92r2vP3w74Ynog5er
L3Fh4Dy1FZMHy4QLtxpkuj3Wx5yM8seYnIxhwCPzBYjulLbp5iCpwRa9cdy8MTjF
mkQ581PjYNkazQDU9vVs
=Qgb8
-----END PGP SIGNATURE-----

--lUFOiBjYbj2M+tdK--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
