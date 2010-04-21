From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page typo
Date: Tue, 20 Apr 2010 19:13:32 -0700 (PDT)
Message-ID: <4bce5f4c.0d67f10a.33b0.ffff9e3e@mx.google.com>
References: <838959.52751.qm@web45611.mail.sp1.yahoo.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <838959.52751.qm-ofs+kkYO86PrNpU5RS+xBlZ8N9CAUha/QQ4Iyu8u01E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mihai Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Apr 18, 2010 at 10:57, Mihai Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> If I'm not wrong, the exact name of that field in
> the msqid_ds structure is msg_qbytes. The
> same thing appears also on the online manual
> pages, I checked it already.

You are correct.

The POSIX man pages do indeed list `msg_qbytes' for what seems
like the equivalent concept of what the Linux man page lists as
`msg_bytes'. The glibc header file <sys/msg.h> (specifically
<bits/msq.h>) defines `struct msqid_ds' with not `msg_bytes'
but rather `msg_qbytes'; the field `msg_qbytes' can indeed be
set with `msgctl()' according to glibc's implementation of that
function (see "sysdeps/unix/sysv/linux/i386/msgctl.c" in the
glibc source).

However, the Linux kernel seems to implement this messaging
system on top of a more general IPC subsystem; `MSGMNB' (as
referenced in the Linux man page) is used to set the field
`msg_ctlmnb' of an object of type `struct ipc_namespace'
(http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L115):

    112 void msg_init_ns(struct ipc_namespace *ns)
    113 {
    114         ns->msg_ctlmax = MSGMAX;
    115         ns->msg_ctlmnb = MSGMNB;              /* <------------------- */
    116
    117         recompute_msgmni(ns);
    118
    119         atomic_set(&ns->msg_bytes, 0);        /* see below */
    120         atomic_set(&ns->msg_hdrs, 0);
    121         ipc_init_ids(&ns->ids[IPC_MSG_IDS]);
    122 }

When creating a queue, an object of type `struct
msg_queue' is created, and it's `q_qbytes' field is
set to the associated namespace's `msg_ctlmnb' field
(http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L215):

    181 static int newque(struct ipc_namespace *ns, struct ipc_params *params)
    182 {
    183         struct msg_queue *msq;
    ...
    215         msq->q_qbytes = ns->msg_ctlmnb; /* <------- Essentially assign MSGMNB */
    ...
    223         return msq->q_perm.id;
    224 }

So, it would appear that the Kernel internally uses `q_qbytes'
of a `struct msg_queue' for what POSIX (userland side) considers
`msg_qbytes' of a `struct msqid_ds'.

This is corroborated by how the kernel implements the
`msgctl()' system call to set a queue's maximum byte capacity
(http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L412):

    412 static int msgctl_down(struct ipc_namespace *ns, int msqid, int cmd,
    413                        struct msqid_ds __user *buf, int version)
    414 {
    ...
    416         struct msqid64_ds uninitialized_var(msqid64);
    417         struct msg_queue *msq;
    418         int err;
    419
    420         if (cmd == IPC_SET) {
    421                 if (copy_msqid_from_user(&msqid64, buf, version))   /* Copy from userspace */
    422                         return -EFAULT;
    423         }
    ...
    440         case IPC_SET:
    441                 if (msqid64.msg_qbytes > ns->msg_ctlmnb &&
    442                     !capable(CAP_SYS_RESOURCE)) {
    443                         err = -EPERM;
    444                         goto out_unlock;
    445                 }
    446
    447                 msq->q_qbytes = msqid64.msg_qbytes;                 /* <------- Set here with a copy of input */
    ...
    462         }

So, it's pretty clear that the `q_qbytes' of a `struct msg_queue'
is indeed the kernelspace version of the POSIX `msg_qbytes' of a
`struct msqid_ds'.

So, my question is, what is the `msg_bytes' of
a `struct ipc_namespace'? Here's how it's used
in the kernel's implementation of `msgsnd()'
(http://lxr.linux.no/#linux+v2.6.33/ipc/msg.c#L712):

    636 long do_msgsnd(int msqid, long mtype, void __user *mtext,
    637                 size_t msgsz, int msgflg)
    638 {
    639         struct msg_queue *msq;
    ...
    641         int err;
    642         struct ipc_namespace *ns;
    643
    644         ns = current->nsproxy->ipc_ns;  /* from current task */
    ...
    708                 /* noone is waiting for this message, enqueue it */
    709                 list_add_tail(&msg->m_list, &msq->q_messages);
    710                 msq->q_cbytes += msgsz;
    711                 msq->q_qnum++;
    712                 atomic_add(msgsz, &ns->msg_bytes);     /* <-------------------- */
    ...
    724         return err;
    725 }

As you can see, `q_qnum' of a `struct msg_queue' corresponds
to the POSIX `msg_qnum' of a `struct msqid_ds'; interestingly,
the kernel also keeps track of the number of message bytes
currently on the queue by using the field `q_cbytes' of a
`struct msg_queue', which corresponds to the "private" field
`__msg_cbytes' that glibc defines as an extension to the standard
POSIX `struct msqid_ds'.

More to the point, it would seem that the `msg_bytes' of a
`struct ipc_namespace' is just the more general IPC namespace
subsystem's personal copy of that byte count, so that whoever
referenced `msg_bytes' in the Linux man page made a mistake in
using it.

My suggestion is that these sentences from the current msgsnd(2):

    The queue capacity is defined by the msg_bytes field
    in the  associated data structure for the message queue.
    During queue creation this field is initialized to MSGMNB
    bytes, but this limit can be modified using msgctl(2).

should remove all references to such implementation details and
instead stick to the user interface:

    The queue capacity can be queried and set using
    msgctl(2) and the msg_qbytes field of its msqid_ds
    pointer parameter.

Mihai, submit a patch for msgsnd(2); checkout the source as
follows:

    git clone git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git

If you don't, I will :-D

Sincerely,
Michael Witten
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
