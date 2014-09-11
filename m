From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: user_namespace(7) man page
Date: Thu, 11 Sep 2014 07:46:46 -0700
Message-ID: <5411B5D6.9010201@gmail.com>
References: <53F5310A.5080503@gmail.com>	<CALCETrX2qwvzmeoVcLFLxEK=1Fv+f0Ri0TouzzvbN_rgDjka4A@mail.gmail.com>	<540F0810.7030408@gmail.com> <87ppf4n5ib.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ppf4n5ib.fsf-JOvCrm2gF+uungPnsOpG7nhyD016LWXt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, richard -rw- weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Eric,

On 09/09/2014 09:05 AM, Eric W. Biederman wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>=20
>> Hi Andy, and Eric,
>>
>> On 09/01/2014 01:57 PM, Andy Lutomirski wrote:
>>> On Wed, Aug 20, 2014 at 4:36 PM, Michael Kerrisk (man-pages)
>>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Hello Eric et al.,
>>>>
>>>> For various reasons, my work on the namespaces man pages
>>>> fell off the table a while back. Nevertheless, the pages have
>>>> been close to completion for a while now, and I recently restarted=
,
>>>> in an effort to finish them. As you also noted to me f2f, there ha=
ve
>>>> been recently been some small namespace changes that you may affec=
t
>>>> the content of the pages. Therefore, I'll take the opportunity to
>>>> send the namespace-related pages out for further (final?) review.
>>>>
>>>> So, here, I start with the user_namespaces(7) page, which is shown
>>>> in rendered form below, with source attached to this mail. I'll
>>>> send various other pages in follow-on mails.
>>>>
>>>> Review comments/suggestions for improvements / bug fixes welcome.
>>>>
>>>> Cheers,
>>>>
>>>> Michael
>>>>
>>>> =3D=3D
>>>>
>>>> NAME
>>>>        user_namespaces - overview of Linux user_namespaces
>>>>
>>>> DESCRIPTION
>>>>        For an overview of namespaces, see namespaces(7).
>>>>
>>>>        User   namespaces   isolate   security-related   identifier=
s  and
>>>>        attributes, in particular, user IDs and group  IDs  (see  c=
reden=E2=80=90
>>>>        tials(7), the root directory, keys (see keyctl(2)), and cap=
abili=E2=80=90
>>>
>>> Putting "root directory" here is odd -- that's really part of a
>>> different namespace.  But user namespaces sort of isolate the other
>>> namespaces from each other.
>>
>> I'm trying to remember the details here. I think this piece original=
ly=20
>> came after a discussion with Eric, but I am not sure. Eric?
>=20
> Probably.
>=20
> I am not certain what the best way to say it but we do need to docume=
nt
> that an unprivileged user that creates a user namespace can now call
> chroot.
>=20
> We may also want to discuss the specific restrictions on chroot.
>=20
> The text about chroot at least gives people a strong hint that the
> chroot rules are affected by user namespaces.
>=20
> The restrictions that we have settled on to avoid chroot being a prob=
lem
> are the creator of a user namespace must not be chrooted in their
> current mount namespace, and the creator of the user namespace must n=
ot
> be threaded.
>=20
> Andy can you check me on this it looks like unshare is currently bugg=
y
> in that it will allow a threaded application to create a user namespa=
ce.

So, somewhere we should have some text such as:

[[
An unprivileged user who creates a namespace can call chroot(2)
within that namesapce, subject to the restriction that the
creator of a user namespace must not be chrooted in their
current mount namespace, and the creator of the user namespace must not
be threaded.
]]

Right?

>>> Also, ugh, keys.  How did keyctl(2) ever make it through any kind o=
f review?
>>>
>>>>        ties (see capabilities(7)).  A process's user and group  ID=
s  can
>>>>        be different inside and outside a user namespace.  In parti=
cular,
>>>>        a process can have a normal unprivileged user ID outside  a=
  user
>>>>        namespace while at the same time having a user ID of 0 insi=
de the
>>>>        namespace; in other words, the process has  full  privilege=
s  for
>>>>        operations  inside  the  user  namespace, but is unprivileg=
ed for
>>>>        operations outside the namespace.
>>>>
>>>>    Nested namespaces, namespace membership
>>>>        User namespaces can be nested;  that  is,  each  user  name=
space=E2=80=94
>>>>        except  the  initial  ("root") namespace=E2=80=94has a pare=
nt user names=E2=80=90
>>>>        pace, and can have zero or more child user namespaces.  The=
  par=E2=80=90
>>>>        ent user namespace is the user namespace of the process tha=
t cre=E2=80=90
>>>>        ates the user namespace via a call to unshare(2) or clone(2=
) with
>>>>        the CLONE_NEWUSER flag.
>>>>
>>>>        The kernel imposes (since version 3.11) a limit of 32 neste=
d lev=E2=80=90
>>>>        els of user namespaces.  Calls to  unshare(2)  or  clone(2)=
  that
>>>>        would cause this limit to be exceeded fail with the error E=
USERS.
>>>>
>>>>        Each  process  is  a  member  of  exactly  one user namespa=
ce.  A
>>>>        process created via fork(2) or clone(2) without the CLONE_N=
EWUSER
>>>>        flag  is  a  member  of the same user namespace as its pare=
nt.  A
>>>>        process can join another user namespace with setns(2) if  i=
t  has
>>>>        the  CAP_SYS_ADMIN  in  that namespace; upon doing so, it g=
ains a
>>>>        full set of capabilities in that namespace.
>>>>
>>>>        A call to clone(2) or  unshare(2)  with  the  CLONE_NEWUSER=
  flag
>>>>        makes  the  new  child  process (for clone(2)) or the calle=
r (for
>>>>        unshare(2)) a member of the new user  namespace  created  b=
y  the
>>>>        call.
>>>>
>>>>    Capabilities
>>>>        The child process created by clone(2) with the CLONE_NEWUSE=
R flag
>>>>        starts out with a complete set of capabilities in  the  new=
  user
>>>>        namespace.  Likewise, a process that creates a new user nam=
espace
>>>>        using unshare(2)  or  joins  an  existing  user  namespace =
 using
>>>>        setns(2)  gains a full set of capabilities in that namespac=
e.  On
>>>>        the other hand, that process has no capabilities  in  the  =
parent
>>>>        (in  the case of clone(2)) or previous (in the case of unsh=
are(2)
>>>>        and setns(2)) user namespace, even if the new namespace  is=
  cre=E2=80=90
>>>>        ated  or  joined by the root user (i.e., a process with use=
r ID 0
>>>>        in the root namespace).
>>>>
>>>>        Note that a call to execve(2) will cause a process  to  los=
e  any
>>>>        capabilities that it has, unless it has a user ID of 0 with=
in the
>>>>        namespace.
>>>
>>> Or unless file capabilities have a non-empty inheritable mask.
>>>
>>> It may be worth mentioning that execve in a user namespace works
>>> exactly like execve outside a userns.
>>
>>
>> I';ve reworded that para to say:
>>
>>        Note that a call to execve(2) will cause a process's  capabil=
i=E2=80=90
>>        ties to be recalculated in the usual way (see capabilities(7)=
),
>>        so that usually, unless it has a user ID of 0 within the name=
s=E2=80=90
>>        pace or the executable file has a nonempty inheritable capabi=
l=E2=80=90
>>        ities mask, it will lose all capabilities.  See the  discussi=
on
>>        of user and group ID mappings, below.
>>
>> Okay?
>=20
> That seems reasonable to me.
>=20
>>>>            $ cat /proc/$$/uid_map
>>>>                     0          0 4294967295
>>>>
>>>>        This mapping tells us that the range starting at  user  ID =
 0  in
>>>>        this namespace maps to a range starting at 0 in the (nonexi=
stent)
>>>>        parent namespace, and the length of  the  range  is  the  l=
argest
>>>>        32-bit unsigned integer.
>>>>
>>>>    Defining user and group ID mappings: writing to uid_map and gid=
_map
>>>>        After  the  creation of a new user namespace, the uid_map f=
ile of
>>>>        one of the processes in the namespace may be written to  on=
ce  to
>>>>        define  the  mapping  of  user IDs in the new user namespac=
e.  An
>>>>        attempt to write more than once to  a  uid_map  file  in  a=
  user
>>>>        namespace  fails  with  the error EPERM.  Similar rules app=
ly for
>>>>        gid_map files.
>>>>
>>>>        The lines written to uid_map (gid_map) must conform to  the=
  fol=E2=80=90
>>>>        lowing rules:
>>>>
>>>>        *  The  three  fields  must  be valid numbers, and the last=
 field
>>>>           must be greater than 0.
>>>>
>>>>        *  Lines are terminated by newline characters.
>>>>
>>>>        *  There is an (arbitrary) limit on the number of  lines  i=
n  the
>>>>           file.  As at Linux 3.8, the limit is five lines.  In add=
ition,
>>>>           the number of bytes written to the file must be less tha=
n  the
>>>>           system page size, and the write must be performed at the=
 start
>>>>           of the file (i.e., lseek(2) and pwrite(2)  can't  be  us=
ed  to
>>>>           write to nonzero offsets in the file).
>>>>
>>>>        *  The  range of user IDs (group IDs) specified in each lin=
e can=E2=80=90
>>>>           not overlap with the ranges in any other lines.  In  the=
  ini=E2=80=90
>>>>           tial  implementation  (Linux 3.8), this requirement was =
satis=E2=80=90
>>>>           fied by a simplistic implementation that imposed  the  f=
urther
>>>>           requirement  that  the  values  in both field 1 and fiel=
d 2 of
>>>>           successive lines must be in ascending numerical  order, =
 which
>>>>           prevented some otherwise valid maps from being created. =
 Linux
>>>>           3.9 and later fix this limitation, allowing any valid  s=
et  of
>>>>           nonoverlapping maps.
>>>>
>>>>        *  At least one line must be written to the file.
>>>>
>>>>        Writes that violate the above rules fail with the error EIN=
VAL.
>>>>
>>>>        In  order  for  a  process  to  write  to the /proc/[pid]/u=
id_map
>>>>        (/proc/[pid]/gid_map) file, all  of  the  following  requir=
ements
>>>>        must be met:
>>>>
>>>>        1. The  writing  process  must  have  the CAP_SETUID (CAP_S=
ETGID)
>>>>           capability in the user namespace of the process pid.
>>>
>>> This checked for the opening process (and I don't actually remember
>>> whether it's checked for the writing process).
>>
>> Eric, can you comment?
>=20
> We have to check for the opening processes and that changes was made
> after I implemented my interface. Pieces of the code appear to also
> examine the writing process and verify everything applies to it as we=
ll.
>=20
> I goofed when I designed the interface originall and had not realized
> what a classic design error it can be to not restrict by the opening
> process.

So, I still need some help here. Should the sentence above just read:

        1. The  *opening*  process  must  have  the CAP_SETUID (CAP_SET=
GID)
           capability in the user namespace of the process pid.

or must something also be said about the writing process? (If so, i'd
appreciate a completely formed sentence or two that I can just drop int=
o
the man page..)

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
