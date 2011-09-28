From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 1/2] setns.2: Initial man page [RESEND]
Date: Wed, 28 Sep 2011 16:28:21 -0700
Message-ID: <m18vp88cx6.fsf@fess.ebiederm.org>
References: <CAKgNAkhX-SnESaVoux2zUtTEVSY5umw=gPqCtfDEOO+xigtTdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkhX-SnESaVoux2zUtTEVSY5umw=gPqCtfDEOO+xigtTdg@mail.gmail.com>
	(Michael Kerrisk's message of "Wed, 28 Sep 2011 19:24:58 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge.hallyn@canonical.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages@gmail.com> writes:

> Hi Eric,
>
> I'm still wanting your input on the edited setns.2 draft below. Pleas=
e
> don't make me chase you round Prague ;-).

That could be interesting...  As I don't have plans to head out that wa=
y
this year.  I got side tracked with some unexpected computer troubles
that showed up right after I got home.

So overall it looks good.  I found two nits to pick (see below).

The significant nit is how do we say unshare and setns refer
to just a linux task and not the entire process.

When you are writing multi-threaded apps it actually matters.

In particular I keep expecting someone will need a call like:

int socketat(int namespace, int domain, int type, int protocol)
{
        int netns, ret, fd;
        netns =3D open("/proc/self/ns/net", O_RDONLY);
        if (netns < 0)
        	return -1;
        ret =3D setns( namespace, CLONE_NETNS);
        if (ret < 0)
        	return -1;
        fd =3D socket( domain, type, protocol);
	setns(netns, CLONE_NETNS);
        return fd;
}

Which with a little bit care adding blocking of signals etc
that call can actually be made thread safe.

However if setns affected all threads of a multi-threaded process
socketat would require a system call to be written to do the
same job.

Multi-threaded processes that simultaneously deal with multiple
namespaces are likely to be rare but I expect there to be a few
that actually care.

Eric


> Cheers,
>
> Michael
>
> From: Michael Kerrisk <mtk.manpages@gmail.com>
> Date: Thu, Sep 15, 2011 at 6:13 AM
> Subject: Re: [PATCH 1/2] setns.2: Initial man page
> To: "Eric W. Biederman" <ebiederm@xmission.com>
> Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge.hallyn@canoni=
cal.com>
>
>
> Hello Eric,
>
> See below.
>
> On Mon, May 30, 2011 at 5:16 AM, Eric W. Biederman
> <ebiederm@xmission.com> wrote:
>>
>> Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
>> ---
>> =C2=A0man2/setns.2 | =C2=A0 88 +++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++
>> =C2=A01 files changed, 88 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 man2/setns.2
>>
>> diff --git a/man2/setns.2 b/man2/setns.2
>> new file mode 100644
>> index 0000000..8b48e14
>> --- /dev/null
>> +++ b/man2/setns.2
>> @@ -0,0 +1,88 @@
>> +.\" Copyright (C) 2011, Eric Biederman <ebiederm@xmission.com>
>> +.\" Licensed under the GPLv2
>> +.\"
>> +.TH SETNS 2 2011-05-28 "Linux" "Linux Programmer's Manual"
>> +.SH NAME
>> +setns \- reassociate parts of the process execution context
>> +.SH SYNOPSIS
>> +.nf
>> +.BR "#define _GNU_SOURCE" " =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* See feature_test_macros(7) */"
>> +.B #include <sched.h>
>> +.sp
>> +.BI "int setns(int " fd ", int " nstype );
>> +.fi
>> +.SH DESCRIPTION
>> +Given a file descriptor referring to a namespace reassociate the
>> +current process with that namespace.
>> +
>> +The
>> +.I nstype
>> +argument is an enumeration that specifies which type of namespace
>> +the current process may be reassociated with. =C2=A0This argument c=
an
>> +have one of the following values:
>> +
>> +.TP
>> +.BR 0
>> +Allow any namespace to be joined.
>> +.TP
>> +.BR CLONE_NEWIPC
>> +Only allow joining an ipc namespace.
>> +.TP
>> +.BR CLONE_NEWNET
>> +Only allow joining a network namespace.
>> +.TP
>> +.BR CLONE_NEWUTS
>> +Only allow joining a uts namespace.
>> +.PP
>> +If
>> +.I flags
>> +is specified as zero, then
>> +.BR setns ()
>> +is a no-op;
>> +no changes are made to the calling process's execution context.
>> +.SH RETURN VALUE
>> +On success, zero returned.
>> +On failure, \-1 is returned and
>> +.I errno
>> +is set to indicate the error.
>> +.SH ERRORS
>> +.TP
>> +.TP
>> +.B EBADF
>> +A bad file descriptor was passed to setns.
>> +
>> +.TP
>> +.B EINVAL
>> +A file descriptor that does not match the specified nstype.
>> +
>> +Attempting to change the mount namespace and the filesystem
>> +is shared between multiple tasks.
>> +
>> +.TP
>> +.B ENOMEM
>> +Cannot allocate sufficient memory to change the specified namespace=
=2E
>> +
>> +.TP
>> +.B EPERM
>> +The calling process did not have the required privileges for this o=
peration.
>> +.SH VERSIONS
>> +The
>> +.BR setns ()
>> +system call first appeared in Linux in kernel 3.0
>> +.SH CONFORMING TO
>> +The
>> +.BR setns ()
>> +system call is Linux-specific.
>> +.SH NOTES
>> +Not all of the process attributes that can be shared when
>> +a new process is created using
>> +.BR clone (2)
>> +can be changed using
>> +.BR setns ().
>> +.SH BUGS
>> +The pid namespace and the mount namespace are not currently support=
ed.
>> +.SH SEE ALSO
>> +.BR clone (2),
>> +.BR fork (2),
>> +.BR vfork (2),
>> +.BR setns(2)
>> --
>> 1.7.5.1.217.g4e3aa
>
> I made various edits to the page, some after out F2F conversations.
> Could you please comment on the new version below?
>
> Note: we talked a couple of times about this piece of text under the
> EINVAL error.
>
> =C2=A0 =C2=A0 =C2=A0 Attempted =C2=A0to =C2=A0change =C2=A0the =C2=A0=
mount =C2=A0namespace, but the filesystem
> =C2=A0 =C2=A0 =C2=A0 is shared between multiple tasks.
>
> As I understand it, this refers to interactions between the mount
> namespace and file system namespace. However, as noted in the man
> page, setns() does not support CLONE_NEWNS. Furthermore, I can see no
> path in the setns() that generates EINVAL and =C2=A0involves CLONE_NE=
WNS.
> So,I removed that text. Please let me know if that's wrong.

Removing that text is fine for now.  I expect I will have to readd it
after I get my next round of patches in but no need to Document what
does not yet exist in mainline.


Reading the=20

> .\" Copyright (C) 2011, Eric Biederman <ebiederm@xmission.com>
> .\" Licensed under the GPLv2
> .\"
> .TH SETNS 2 2011-09-15 "Linux" "Linux Programmer's Manual"
> .SH NAME
> setns \- reassociate process with a namespace
> .SH SYNOPSIS
> .nf
> .BR "#define _GNU_SOURCE" " =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* See feature_test_macros(7) */"
> .B #include <sched.h>
> .sp
> .BI "int setns(int " fd ", int " nstype );
> .fi
> .SH DESCRIPTION
> Given a file descriptor referring to a namespace,
> reassociate the calling process with that namespace.
>
> The
> .I fd
> argument is a file descriptor referring to one of the namespace entri=
es in a
> .I /proc/[pid]/ns/
> directory; see
> .BR proc (5)
> for further information on
> .IR /proc/[pid]/ns/ .
> The calling process will be reassociated with the corresponding names=
pace,
> subject to any constraints imposed by the
> .I nstype
> argument.
>

There is an weird twist I think it makes sense to document.  The unit o=
f
reassociation is a linux task.  What is normally seen as a thread.

Which is important to consider if you happen to be using this in a
multi-threaded program.  But I'm not certain how best to say that.

Perhaps:  perhaps just say linux task instead of process?


> .TP
> .BR 0
> Allow any type of namespace to be joined.
> .TP
> .BR CLONE_NEWIPC
> .I fd
> must refer to an IPC namespace.
> .TP
> .BR CLONE_NEWNET
> .I fd
> must refer to a network namespace.
> .TP
> .BR CLONE_NEWUTS
> .I fd
> must refer to a UTS namespace.
> .PP
> Specifying
> .I nstype
> as 0 suffices if the caller knows (or does not care)
> what type of namespace is referred to by
> .IR fd .
> Specifying a nonzero value for
> .I nstype
> is useful if the caller does not know what type of namespace is refer=
red to by
> .IR fd
> and wants to ensure that the namespace is of a particular type.
> (The caller might not know the type of the namespace referred to by
> .IR fd
> if the file descriptor was opened by another process and, for example=
,
> passed to the caller via a UNIX domain socket.)
> .SH RETURN VALUE
> On success,
> .IR setns ()
> returns 0.
> On failure, \-1 is returned and
> .I errno
> is set to indicate the error.
> .SH ERRORS
> .TP
> .B EBADF
> .I fd
> is not a valid file descriptor.
> .TP
> .B EINVAL
> .I fd
> refers to a namespace whose type does not match that specified in
> .IR nstype .

Just because we have been going back on forth on this bit I am inclined
to say:

EINVAL fd refers to a namespace whose type does not match that
specified in nstype, or there is problem with reassociating the
the thread with the specified namespace.

> .TP
> .B ENOMEM
> Cannot allocate sufficient memory to change the specified namespace.
> .TP
> .B EPERM
> The calling process did not have the required privilege
> .RB ( CAP_SYS_ADMIN )
> for this operation.
> .SH VERSIONS
> The
> .BR setns ()
> system call first appeared in Linux in kernel 3.0
> .SH CONFORMING TO
> The
> .BR setns ()
> system call is Linux-specific.
> .SH NOTES
> Not all of the process attributes that can be shared when
> a new process is created using
> .BR clone (2)
> can be changed using
> .BR setns ().
> .SH BUGS
> The PID namespace and the mount namespace are not currently supported=
=2E
> (See the descriptions of
> .BR CLONE_NEWPID
> and
> .BR CLONE_NEWNS
> in
> .BR clone (2).)
> .SH SEE ALSO
> .BR clone (2),
> .BR fork (2),
> .BR vfork (2),
> .BR proc (5),
> .BR unix (7)
