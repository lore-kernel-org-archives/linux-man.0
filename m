From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] setns.2: Initial man page [RESEND]
Date: Mon, 3 Oct 2011 15:35:33 +0200
Message-ID: <CAKgNAkh3HQAgNkYg=o6rpsm5n8wGpTNPLgq82OkKzVV8gux5YA@mail.gmail.com>
References: <CAKgNAkhX-SnESaVoux2zUtTEVSY5umw=gPqCtfDEOO+xigtTdg@mail.gmail.com>
 <m18vp88cx6.fsf@fess.ebiederm.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m18vp88cx6.fsf-+imSwln9KH6u2/kzUuoCbdi2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Serge E. Hallyn" <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Eric,

On Thu, Sep 29, 2011 at 1:28 AM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Hi Eric,
>>
>> I'm still wanting your input on the edited setns.2 draft below. Plea=
se
>> don't make me chase you round Prague ;-).
>
> That could be interesting... =A0As I don't have plans to head out tha=
t way
> this year. =A0I got side tracked with some unexpected computer troubl=
es
> that showed up right after I got home.

Ahh -- that's a shame not to see you there!

> So overall it looks good. =A0I found two nits to pick (see below).
>
> The significant nit is how do we say unshare and setns refer
> to just a linux task and not the entire process.
>
> When you are writing multi-threaded apps it actually matters.
>
> In particular I keep expecting someone will need a call like:
>
> int socketat(int namespace, int domain, int type, int protocol)
> {
> =A0 =A0 =A0 =A0int netns, ret, fd;
> =A0 =A0 =A0 =A0netns =3D open("/proc/self/ns/net", O_RDONLY);
> =A0 =A0 =A0 =A0if (netns < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0 =A0 =A0ret =3D setns( namespace, CLONE_NETNS);
> =A0 =A0 =A0 =A0if (ret < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0 =A0 =A0fd =3D socket( domain, type, protocol);
> =A0 =A0 =A0 =A0setns(netns, CLONE_NETNS);
> =A0 =A0 =A0 =A0return fd;
> }
>
> Which with a little bit care adding blocking of signals etc
> that call can actually be made thread safe.
>
> However if setns affected all threads of a multi-threaded process
> socketat would require a system call to be written to do the
> same job.

Okay. But please, when you add it, don't call it "socketat()". That
name makes it look as though it is similar to "openat()" and all of
the other "*at" calls, when really it is not. Perhaps "socketns()"?

> Multi-threaded processes that simultaneously deal with multiple
> namespaces are likely to be rare but I expect there to be a few
> that actually care.
>
> Eric
>
>
>> Cheers,
>>
>> Michael
>>
>> From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Date: Thu, Sep 15, 2011 at 6:13 AM
>> Subject: Re: [PATCH 1/2] setns.2: Initial man page
>> To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
>> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Serge E. Hallyn" <serge.hallyn@canon=
ical.com>
>>
>>
>> Hello Eric,
>>
>> See below.
>>
>> On Mon, May 30, 2011 at 5:16 AM, Eric W. Biederman
>> <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>> Signed-off-by: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
>>> ---
>>> =A0man2/setns.2 | =A0 88 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++
>>> =A01 files changed, 88 insertions(+), 0 deletions(-)
>>> =A0create mode 100644 man2/setns.2
>>>
>>> diff --git a/man2/setns.2 b/man2/setns.2
>>> new file mode 100644
>>> index 0000000..8b48e14
>>> --- /dev/null
>>> +++ b/man2/setns.2
>>> @@ -0,0 +1,88 @@
>>> +.\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
>>> +.\" Licensed under the GPLv2
>>> +.\"

[...]

>> As I understand it, this refers to interactions between the mount
>> namespace and file system namespace. However, as noted in the man
>> page, setns() does not support CLONE_NEWNS. Furthermore, I can see n=
o
>> path in the setns() that generates EINVAL and =A0involves CLONE_NEWN=
S.
>> So,I removed that text. Please let me know if that's wrong.
>
> Removing that text is fine for now. =A0I expect I will have to readd =
it
> after I get my next round of patches in but no need to Document what
> does not yet exist in mainline.

Okay.

> Reading the
>
>> .\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
>> .\" Licensed under the GPLv2
>> .\"
>> .TH SETNS 2 2011-09-15 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> setns \- reassociate process with a namespace
>> .SH SYNOPSIS
>> .nf
>> .BR "#define _GNU_SOURCE" " =A0 =A0 =A0 =A0 =A0 =A0 /* See feature_t=
est_macros(7) */"
>> .B #include <sched.h>
>> .sp
>> .BI "int setns(int " fd ", int " nstype );
>> .fi
>> .SH DESCRIPTION
>> Given a file descriptor referring to a namespace,
>> reassociate the calling process with that namespace.
>>
>> The
>> .I fd
>> argument is a file descriptor referring to one of the namespace entr=
ies in a
>> .I /proc/[pid]/ns/
>> directory; see
>> .BR proc (5)
>> for further information on
>> .IR /proc/[pid]/ns/ .
>> The calling process will be reassociated with the corresponding name=
space,
>> subject to any constraints imposed by the
>> .I nstype
>> argument.
>>
>
> There is an weird twist I think it makes sense to document. =A0The un=
it of
> reassociation is a linux task. =A0What is normally seen as a thread.
>
> Which is important to consider if you happen to be using this in a
> multi-threaded program. =A0But I'm not certain how best to say that.
>
> Perhaps: =A0perhaps just say linux task instead of process?

I'll write "thread", which is the usual terminology in this context
(Section 2). I've made that change at multiple places in the page (see
below).

[...]

>> .SH ERRORS
>> .TP
>> .B EBADF
>> .I fd
>> is not a valid file descriptor.
>> .TP
>> .B EINVAL
>> .I fd
>> refers to a namespace whose type does not match that specified in
>> .IR nstype .
>
> Just because we have been going back on forth on this bit I am inclin=
ed
> to say:
>
> EINVAL fd refers to a namespace whose type does not match that
> specified in nstype, or there is problem with reassociating the
> the thread with the specified namespace.

Changed.

[...]

Revised page below, which you can make a final check on, if you like.
The page will go out with the next man-pages release (3.35).

Cheers,

Michael


=2E\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
=2E\" Licensed under the GPLv2
=2E\"
=2ETH SETNS 2 2011-09-15 "Linux" "Linux Programmer's Manual"
=2ESH NAME
setns \- reassociate thread with a namespace
=2ESH SYNOPSIS
=2Enf
=2EBR "#define _GNU_SOURCE" "             /* See feature_test_macros(7)=
 */"
=2EB #include <sched.h>
=2Esp
=2EBI "int setns(int " fd ", int " nstype );
=2Efi
=2ESH DESCRIPTION
Given a file descriptor referring to a namespace,
reassociate the calling thread with that namespace.

The
=2EI fd
argument is a file descriptor referring to one of the namespace entries=
 in a
=2EI /proc/[pid]/ns/
directory; see
=2EBR proc (5)
for further information on
=2EIR /proc/[pid]/ns/ .
The calling thread will be reassociated with the corresponding namespac=
e,
subject to any constraints imposed by the
=2EI nstype
argument.

The
=2EI nstype
argument specifies which type of namespace
the calling thread may be reassociated with.
This argument can have one of the following values:
=2ETP
=2EBR 0
Allow any type of namespace to be joined.
=2ETP
=2EBR CLONE_NEWIPC
=2EI fd
must refer to an IPC namespace.
=2ETP
=2EBR CLONE_NEWNET
=2EI fd
must refer to a network namespace.
=2ETP
=2EBR CLONE_NEWUTS
=2EI fd
must refer to a UTS namespace.
=2EPP
Specifying
=2EI nstype
as 0 suffices if the caller knows (or does not care)
what type of namespace is referred to by
=2EIR fd .
Specifying a nonzero value for
=2EI nstype
is useful if the caller does not know what type of namespace is referre=
d to by
=2EIR fd
and wants to ensure that the namespace is of a particular type.
(The caller might not know the type of the namespace referred to by
=2EIR fd
if the file descriptor was opened by another process and, for example,
passed to the caller via a UNIX domain socket.)
=2ESH RETURN VALUE
On success,
=2EIR setns ()
returns 0.
On failure, \-1 is returned and
=2EI errno
is set to indicate the error.
=2ESH ERRORS
=2ETP
=2EB EBADF
=2EI fd
is not a valid file descriptor.
=2ETP
=2EB EINVAL
=2EI fd
refers to a namespace whose type does not match that specified in
=2EIR nstype ,
or there is problem with reassociating the
the thread with the specified namespace.
=2ETP
=2EB ENOMEM
Cannot allocate sufficient memory to change the specified namespace.
=2ETP
=2EB EPERM
The calling thread did not have the required privilege
=2ERB ( CAP_SYS_ADMIN )
for this operation.
=2ESH VERSIONS
The
=2EBR setns ()
system call first appeared in Linux in kernel 3.0
=2ESH CONFORMING TO
The
=2EBR setns ()
system call is Linux-specific.
=2ESH NOTES
Not all of the attributes that can be shared when
a new thread is created using
=2EBR clone (2)
can be changed using
=2EBR setns ().
=2ESH BUGS
The PID namespace and the mount namespace are not currently supported.
(See the descriptions of
=2EBR CLONE_NEWPID
and
=2EBR CLONE_NEWNS
in
=2EBR clone (2).)
=2ESH SEE ALSO
=2EBR clone (2),
=2EBR fork (2),
=2EBR vfork (2),
=2EBR proc (5),
=2EBR unix (7)



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
