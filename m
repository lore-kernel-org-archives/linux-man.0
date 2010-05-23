From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Man page typo
Date: Sun, 23 May 2010 06:26:52 +0200
Message-ID: <AANLkTikc9FxjGG9Aj3fBQBpp63pqyuGz8ZgLU_mVoJ_n@mail.gmail.com>
References: <838959.52751.qm@web45611.mail.sp1.yahoo.com> <4bce5f4c.0d67f10a.33b0.ffff9e3e@mx.google.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4bce5f4c.0d67f10a.33b0.ffff9e3e-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mihai Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mihai, Michael,

On Wed, Apr 21, 2010 at 4:13 AM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On Sun, Apr 18, 2010 at 10:57, Mihai Paraschivescu <paraschivescu_mih=
ail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
>> If I'm not wrong, the exact name of that field in
>> the msqid_ds structure is msg_qbytes. The
>> same thing appears also on the online manual
>> pages, I checked it already.

I have corrected this in the man page (for 3.25).

> You are correct.
>
> The POSIX man pages do indeed list `msg_qbytes' for what seems
> like the equivalent concept of what the Linux man page lists as
> `msg_bytes'. The glibc header file <sys/msg.h> (specifically
> <bits/msq.h>) defines `struct msqid_ds' with not `msg_bytes'
> but rather `msg_qbytes'; the field `msg_qbytes' can indeed be
> set with `msgctl()' according to glibc's implementation of that
> function (see "sysdeps/unix/sysv/linux/i386/msgctl.c" in the
> glibc source).
>
> However, the Linux kernel seems to implement this messaging
> system on top of a more general IPC subsystem; `MSGMNB' (as
> referenced in the Linux man page) is used to set the field
> `msg_ctlmnb' of an object of type `struct ipc_namespace'
> (http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L115):
>
> =A0 =A0112 void msg_init_ns(struct ipc_namespace *ns)
> =A0 =A0113 {
> =A0 =A0114 =A0 =A0 =A0 =A0 ns->msg_ctlmax =3D MSGMAX;
> =A0 =A0115 =A0 =A0 =A0 =A0 ns->msg_ctlmnb =3D MSGMNB; =A0 =A0 =A0 =A0=
 =A0 =A0 =A0/* <------------------- */
> =A0 =A0116
> =A0 =A0117 =A0 =A0 =A0 =A0 recompute_msgmni(ns);
> =A0 =A0118
> =A0 =A0119 =A0 =A0 =A0 =A0 atomic_set(&ns->msg_bytes, 0); =A0 =A0 =A0=
 =A0/* see below */
> =A0 =A0120 =A0 =A0 =A0 =A0 atomic_set(&ns->msg_hdrs, 0);
> =A0 =A0121 =A0 =A0 =A0 =A0 ipc_init_ids(&ns->ids[IPC_MSG_IDS]);
> =A0 =A0122 }
>
> When creating a queue, an object of type `struct
> msg_queue' is created, and it's `q_qbytes' field is
> set to the associated namespace's `msg_ctlmnb' field
> (http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L215):
>
> =A0 =A0181 static int newque(struct ipc_namespace *ns, struct ipc_par=
ams *params)
> =A0 =A0182 {
> =A0 =A0183 =A0 =A0 =A0 =A0 struct msg_queue *msq;
> =A0 =A0...
> =A0 =A0215 =A0 =A0 =A0 =A0 msq->q_qbytes =3D ns->msg_ctlmnb; /* <----=
--- Essentially assign MSGMNB */
> =A0 =A0...
> =A0 =A0223 =A0 =A0 =A0 =A0 return msq->q_perm.id;
> =A0 =A0224 }
>
> So, it would appear that the Kernel internally uses `q_qbytes'
> of a `struct msg_queue' for what POSIX (userland side) considers
> `msg_qbytes' of a `struct msqid_ds'.
>
> This is corroborated by how the kernel implements the
> `msgctl()' system call to set a queue's maximum byte capacity
> (http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L412):
>
> =A0 =A0412 static int msgctl_down(struct ipc_namespace *ns, int msqid=
, int cmd,
> =A0 =A0413 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct msqi=
d_ds __user *buf, int version)
> =A0 =A0414 {
> =A0 =A0...
> =A0 =A0416 =A0 =A0 =A0 =A0 struct msqid64_ds uninitialized_var(msqid6=
4);
> =A0 =A0417 =A0 =A0 =A0 =A0 struct msg_queue *msq;
> =A0 =A0418 =A0 =A0 =A0 =A0 int err;
> =A0 =A0419
> =A0 =A0420 =A0 =A0 =A0 =A0 if (cmd =3D=3D IPC_SET) {
> =A0 =A0421 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_msqid_from_user(&=
msqid64, buf, version)) =A0 /* Copy from userspace */
> =A0 =A0422 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EF=
AULT;
> =A0 =A0423 =A0 =A0 =A0 =A0 }
> =A0 =A0...
> =A0 =A0440 =A0 =A0 =A0 =A0 case IPC_SET:
> =A0 =A0441 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (msqid64.msg_qbytes > n=
s->msg_ctlmnb &&
> =A0 =A0442 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !capable(CAP_SYS_R=
ESOURCE)) {
> =A0 =A0443 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -E=
PERM;
> =A0 =A0444 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_u=
nlock;
> =A0 =A0445 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0446
> =A0 =A0447 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msq->q_qbytes =3D msqid64.=
msg_qbytes; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* <------- Set here with a=
 copy of input */
> =A0 =A0...
> =A0 =A0462 =A0 =A0 =A0 =A0 }
>
> So, it's pretty clear that the `q_qbytes' of a `struct msg_queue'
> is indeed the kernelspace version of the POSIX `msg_qbytes' of a
> `struct msqid_ds'.
>
> So, my question is, what is the `msg_bytes' of
> a `struct ipc_namespace'? Here's how it's used
> in the kernel's implementation of `msgsnd()'
> (http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L712):
>
> =A0 =A0636 long do_msgsnd(int msqid, long mtype, void __user *mtext,
> =A0 =A0637 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t msgsz, int msgflg)
> =A0 =A0638 {
> =A0 =A0639 =A0 =A0 =A0 =A0 struct msg_queue *msq;
> =A0 =A0...
> =A0 =A0641 =A0 =A0 =A0 =A0 int err;
> =A0 =A0642 =A0 =A0 =A0 =A0 struct ipc_namespace *ns;
> =A0 =A0643
> =A0 =A0644 =A0 =A0 =A0 =A0 ns =3D current->nsproxy->ipc_ns; =A0/* fro=
m current task */
> =A0 =A0...
> =A0 =A0708 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* noone is waiting for th=
is message, enqueue it */
> =A0 =A0709 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_add_tail(&msg->m_list=
, &msq->q_messages);
> =A0 =A0710 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msq->q_cbytes +=3D msgsz;
> =A0 =A0711 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msq->q_qnum++;
> =A0 =A0712 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_add(msgsz, &ns->msg=
_bytes); =A0 =A0 /* <-------------------- */
> =A0 =A0...
> =A0 =A0724 =A0 =A0 =A0 =A0 return err;
> =A0 =A0725 }
>
> As you can see, `q_qnum' of a `struct msg_queue' corresponds
> to the POSIX `msg_qnum' of a `struct msqid_ds'; interestingly,
> the kernel also keeps track of the number of message bytes
> currently on the queue by using the field `q_cbytes' of a
> `struct msg_queue', which corresponds to the "private" field
> `__msg_cbytes' that glibc defines as an extension to the standard
> POSIX `struct msqid_ds'.
>
> More to the point, it would seem that the `msg_bytes' of a
> `struct ipc_namespace' is just the more general IPC namespace
> subsystem's personal copy of that byte count, so that whoever
> referenced `msg_bytes' in the Linux man page made a mistake in
> using it.
>
> My suggestion is that these sentences from the current msgsnd(2):
>
> =A0 =A0The queue capacity is defined by the msg_bytes field
> =A0 =A0in the =A0associated data structure for the message queue.
> =A0 =A0During queue creation this field is initialized to MSGMNB
> =A0 =A0bytes, but this limit can be modified using msgctl(2).
>
> should remove all references to such implementation details and
> instead stick to the user interface:
>
> =A0 =A0The queue capacity can be queried and set using
> =A0 =A0msgctl(2) and the msg_qbytes field of its msqid_ds
> =A0 =A0pointer parameter.

Michael, your analysis of the code is detailed, but the pieces that
you describe as implementation details are either actually important
userspace details. Associated data" is a general concept for SVIPC,
and MSGMNB is a user visible limit (that can be modified vua /proc).

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
