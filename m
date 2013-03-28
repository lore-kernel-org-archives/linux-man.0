From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: For review (v2): user_namespaces(7) man page
Date: Thu, 28 Mar 2013 05:13:35 -0700
Message-ID: <87hajviuxc.fsf@xmission.com>
References: <CAKgNAkjgmTJ1BiHVbqVtz-g-=yfewMiYaroDJELJpa1aRrFAvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjgmTJ1BiHVbqVtz-g-=yfewMiYaroDJELJpa1aRrFAvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Wed, 27 Mar 2013 22:26:07 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vasily Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>, Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi Eric et al.,
>
> All: The attached page aims to provide a fairly complete overview of
> user namespaces. I'm looking for review comments (corrections,
> improvements, additions, etc.) on this man page. I've provided it in
> two forms inline below, and reviewers can comment on whichever form
> they are most comfortable with:
>
> 1) The rendered page as plain text
> 2) The *roff source (also attached); rendering that source will enabl=
e
> readers to see proper formatting for the page.
>
> Note that the namespaces(7) page referred to in this page is not yet
> finished; I'll send it out for review at a future time.
>
> Main change since v1 is to address Serge's comments here:
> http://thread.gmane.org/gmane.linux.man/3745/focus=3D1457720

Overall it looks pretty good.  Thanks for doing all of the work to put
this together.

I have a few comments below.

> Cheers,
>
> Michael
>
> =3D=3D=3D=3D=3D
>
> USER_NAMESPACES(7)     Linux Programmer's Manual    USER_NAMESPACES(7=
)
>
>
>
> NAME
>        user_namespaces - overview of Linux user_namespaces
>
> DESCRIPTION
>        For an overview of namespaces, see namespaces(7).
>
>        User  namespaces  isolate security-related identifiers, in par=
=E2=80=90
>        ticular, user IDs and group IDs (see credentials(7), keys  (se=
e
>        keyctl(2)),   and   capabilities   (see   capabilities(7)).

And the root directory.

>        A
>        process's user and group IDs can be different inside  and  out=
=E2=80=90
>        side  a  user  namespace.   In particular, a process can have =
a
>        normal unprivileged user ID outside a user namespace  while  a=
t
>        the  same  time  having a user ID of 0 inside the namespace; i=
n
>        other words, the process has  full  privileges  for  operation=
s
>        inside  the  user namespace, but is unprivileged for operation=
s
>        outside the namespace.
>
>    Nested namespaces, namespace membership
>        User namespaces can be nested; that is,  each  user  namespace=
=E2=80=94
>        except  the initial ("root") namespace=E2=80=94has a parent us=
er names=E2=80=90
>        pace, and can have zero or more  child  user  namespaces.   Th=
e
>        parent user namespace is the user namespace of the process tha=
t
>        creates the user namespace via a call to unshare(2) or clone(2=
)
>        with the CLONE_NEWUSER flag.
>
>        Each  process  is  a  member  of exactly one user namespace.  =
A
>        process  created  via   fork(2)   or   clone(2)   without   th=
e
>        CLONE_NEWUSER  flag  is  a member of the same user namespace a=
s
>        its parent.  A process can join  another  user  namespace  wit=
h
>        setns(2)  if  it

         is single threaded and=20

>        has the CAP_SYS_ADMIN in that namespace; upon
>        doing so, it gains a full set of capabilities  in  that  names=
=E2=80=90
>        pace.

It is important to implement I don't know if it is important to documen=
t
that you may not join your current user namespace with setns(2).  This
prevents a process with just CAP_SYS_ADMIN in the current user namespac=
e
from gaining all of the other caps simply by calling setns(2).


>        A  call  to  clone(2) or unshare(2) with the CLONE_NEWUSER fla=
g
>        makes the new child process (for clone(2)) or the  caller  (fo=
r
>        unshare(2))  a  member of the new user namespace created by th=
e
>        call.
>
>    Capabilities
>        The child process created by clone(2)  with  the  CLONE_NEWUSE=
R
>        flag  starts out with a complete set of capabilities in the ne=
w
>        user namespace.  Likewise, a process that creates  a  new  use=
r
>        namespace  using unshare(2) or joins an existing user namespac=
e
>        using setns(2) gains a full set of capabilities in that  names=
=E2=80=90
>        pace.   On  the other hand, that process has no capabilities i=
n
>        the parent (in the case of clone(2)) or previous (in  the  cas=
e
>        of  unshare(2)  and  setns(2))  user namespace, even if the ne=
w
>        namespace is created or  joined  by  the  root  user  (i.e.,  =
a
>        process with user ID 0 in the root namespace).

>        Nevertheless, a
>        process owned by the root user will be able to access resource=
s
>        such  as files that are owned by user ID 0, and will be able t=
o
>        do things such as sending signals  to  processes  belonging  t=
o
>        user ID 0.

I don't understand what you are trying to say in the sentence above.

I think you are trying to say that unprivielged processes in the parent
user namespace with the UID of the creator of the namespace can do the
things the root user can do in the user namespace.

>        Note  that a call to execve(2) will cause a process to lose an=
y
>        capabilities that it has, unless it has a user ID of  0  withi=
n
>        the  namespace.  Thus, before calling execve(2), a user ID map=
=E2=80=90
>        ping for ID 0 must be defined, and the caller may also need  t=
o
>        use setuid(2) or similar to set its user ID to 0.

I think the above sentence could use a little clarification. =20
If the users uid in the outer namespace mapes to uid 0 then once the
the mapping is established getuid(2) will return 0, and everything will
treat all processes of that user in the user namespace as uid 0.

If the users uid in the outer namespace is not mapped to uid 0 then
setuid(0) needs to be called if you the process to have uid 0 in the
user namespace.

>        A   call   to  clone(2),  unshare(2),  or  setns(2)  using  th=
e
>        CLONE_NEWUSER flag sets the "securebits" flags  (see  capabili=
=E2=80=90
>        ties(7))  to  their  default values (all flags disabled) in th=
e
>        child (for clone(2)) or caller (for unshare(2),  or  setns(2))=
=2E
>        Note  that because the caller no longer has capabilities in it=
s
>        original user namespace after a call to  setns(2),  it  is  no=
t
>        possible  for  a  process to reset its "securebits" flags whil=
e
>        retaining its user namespace membership  by  using  a  pair  o=
f
>        setns(2)  calls  to  move  to  another  user namespace and the=
n
>        return to its original user namespace.
>
>        Having a capability inside a user namespace permits  a  proces=
s
>        to   perform   operations  (that  require  privilege)  only  o=
n
>        resources governed by that namespace.  The rules for  determin=
=E2=80=90
>        ing  whether  or not a process has a capability in a particula=
r
>        user namespace are as follows:
>
>        1. A process has a capability inside a user namespace if it  i=
s
>           a  member of that namespace and it has the capability in it=
s
>           effective capability set.  A process can  gain  capabilitie=
s
>           in  its effective capability set in various ways.  For exam=
=E2=80=90
>           ple, it may execute a set-user-ID program or  an  executabl=
e
>           with  associated  file capabilities.  In addition, a proces=
s
>           may  gain  capabilities  via   the   effect   of   clone(2)=
,
>           unshare(2), or setns(2), as already described.
>
>        2. If  a  process has a capability in a user namespace, then i=
t
>           has that  capability  in  all  child  (and  further  remove=
d
>           descendant) namespaces as well.
>
>        3. When  a  user  namespace  is created, the kernel records th=
e
>           effective user ID of  the  creating  process  as  being  th=
e
>           "owner"  of  the  namespace.   A process that resides in th=
e
>           parent of the user namespace and  whose  effective  user  I=
D
>           matches  the  owner of the namespace has all capabilities i=
n
>           the namespace.  By virtue of the previous rule,  this  mean=
s
>           that the process has all capabilities in all further remove=
d
>           descendant user namespaces as well.
>
>    Interaction of user namespaces and other types of namespaces
>        Starting in Linux 3.8, unprivileged processes can  create  use=
r
>        namespaces,  and  mount,  PID, IPC, network, and UTS namespace=
s
>        can be created with just the CAP_SYS_ADMIN  capability  in  th=
e
>        caller's user namespace.
>
>        If CLONE_NEWUSER is specified along with other CLONE_NEW* flag=
s
>        in a single clone(2) or unshare(2) call, the user namespace  i=
s
>        guaranteed  to be created first, giving the child (clone(2)) o=
r
>        caller (unshare(2)) privileges over  the  remaining  namespace=
s
>        created  by the call.  Thus, it is possible for an unprivilege=
d
>        caller to specify this combination of flags.
>
>        When a new IPC, mount, network, PID, or UTS namespace  is  cre=
=E2=80=90
>        ated  via  clone(2)  or unshare(2), the kernel records the use=
r
>        namespace of the creating process against  the  new  namespace=
=2E
>        (This association can't be changed.)  When a process in the ne=
w
>        namespace  subsequently  performs  privileged  operations  tha=
t
>        operate on global resources isolated by the namespace, the per=
=E2=80=90
>        mission checks are performed according to the  process's  capa=
=E2=80=90
>        bilities  in the user namespace that the kernel associated wit=
h
>        the new namespace.
>
>    User and group ID mappings: uid_map and gid_map
>        When a user namespace is created, it starts out without a  map=
=E2=80=90
>        ping of user IDs (group IDs) to the parent user namespace.  Th=
e
>        /proc/[pid]/uid_map and  /proc/[pid]/gid_map  files  (availabl=
e
>        since  Linux  3.5)  expose  the mappings for user and group ID=
s
>        inside the user namespace for the process pid.  These files ca=
n
>        be read to view the mappings in a user namespace and written t=
o
>        (once) to define the mappings.
>
>        The  description  in  the  following  paragraphs  explains  th=
e
>        details  for  uid_map;  gid_map  is  exactly the same, but eac=
h
>        instance of "user ID" is replaced by "group ID".
>
>        The uid_map file exposes the mapping of user IDs from the  use=
r
>        namespace  of  the  process  pid  to  the user namespace of th=
e
>        process that opened uid_map (but see a  qualification  to  thi=
s
>        point  below).  In other words, processes that are in differen=
t
>        user namespaces will  potentially  see  different  values  whe=
n
>        reading  from  a particular uid_map file, depending on the use=
r
>        ID mappings for the user namespaces of the reading processes.
>
>        Each line in the uid_map file specifies a 1-to-1 mapping  of  =
a
>        range  of  contiguous  user  IDs  between  two user namespaces=
=2E
>        (When a user namespace is first created, this file  is  empty.=
)
>        The  specification in each line takes the form of three number=
s
>        delimited by white space.  The first two  numbers  specify  th=
e
>        starting user ID in each of the two user namespaces.  The thir=
d
>        number specifies the length of the mapped  range.   In  detail=
,
>        the fields are interpreted as follows:
>
>        (1) The start of the range of user IDs in the user namespace o=
f
>            the process pid.
>
>        (2) The start of the range of user IDs to which  the  user  ID=
s
>            specified  by  field one map.  How field two is interprete=
d
>            depends on whether the process that opened uid_map and  th=
e
>            process pid are in the same user namespace, as follows:
>
>            a) If  the  two processes are in different user namespaces=
:
>               field two is the start of a range of  user  IDs  in  th=
e
>               user namespace of the process that opened uid_map.
>
>            b) If  the  two  processes  are in the same user namespace=
:
>               field two is the start of the range of user IDs  in  th=
e
>               parent  user  namespace  of  the process pid.  This cas=
e
>               enables the opener of uid_map (the common case  here  i=
s
>               opening  /proc/self/uid_map)  to see the mapping of use=
r
>               IDs into the user namespace of the process that  create=
d
>               this user namespace.
>
>        (3) The  length of the range of user IDs that is mapped betwee=
n
>            the two user namespaces.
>
>        System calls that return  user  IDs  (group  IDs)=E2=80=94for =
 example,
>        getuid(2),  getgid(2),  and the credential fields in the struc=
=E2=80=90
>        ture returned by stat(2)=E2=80=94return the user ID (group  ID=
)  mapped
>        into the caller's user namespace.
>
>        When  a  process  accesses  a  file, its user and group IDs ar=
e
>        mapped into the initial user namespace for the purpose of  per=
=E2=80=90
>        mission  checking and assigning IDs when creating a file.  Whe=
n
>        a process retrieves file user and group IDs  via  stat(2),  th=
e
>        IDs  are  mapped  in  the opposite direction, to produce value=
s
>        relative to the process user and group ID mappings.
>
>        The initial user namespace has no parent  namespace,  but,  fo=
r
>        consistency,  the  kernel provides dummy user and group ID map=
=E2=80=90
>        ping files for this namespace.  Looking  at  the  uid_map  fil=
e
>        (gid_map  is  the  same)  from a shell in the initial namespac=
e
>        shows:
>
>            $ cat /proc/$$/uid_map
>                     0          0 4294967295
>
>        This mapping tells us that the range starting at user ID  0  i=
n
>        this  namespace  maps to a range starting at 0 in the (nonexis=
=E2=80=90
>        tent) parent namespace, and the length  of  the  range  is  th=
e
>        largest 32-bit unsigned integer.

Which winds up meaning that 4294967295 is not mapped even in the inital
user namespace.  Documenting that (uid_t)-1 =3D=3D 4294967295 is not a =
valid
uid, which reserves (uid_t)-1 for the other uses (uid_t)-1 serves in ui=
d
based apis.

>    Defining user and group ID mappings: writing to uid_map and gid_ma=
p
>        After the creation of a new user namespace, the uid_map file o=
f
>        one of the processes in the namespace may be written to once t=
o
>        define  the  mapping of user IDs in the new user namespace.  A=
n
>        attempt to write more than once to a uid_map  file  in  a  use=
r
>        namespace  fails with the error EPERM.  Similar rules apply fo=
r
>        gid_map files.
>
>        The lines written to uid_map (gid_map) must conform to the fol=
=E2=80=90
>        lowing rules:
>
>        *  The  three  fields must be valid numbers, and the last fiel=
d
>           must be greater than 0.
>
>        *  Lines are terminated by newline characters.
>
>        *  There is an (arbitrary) limit on the number of lines in  th=
e
>           file.   As  at Linux 3.8, the limit is five lines.  In addi=
=E2=80=90
>           tion, the number of bytes written to the file must  be  les=
s
>           than  the  system page size, and the write must be performe=
d
>           at the start of the file (i.e., lseek(2) and pwrite(2) can'=
t
>           be used to write to nonzero offsets in the file).
>
>        *  The  range  of  user  IDs (group IDs) specified in each lin=
e
>           cannot overlap with the ranges in any other lines.   In  th=
e
>           initial  implementation  (Linux  3.8),  this requirement wa=
s
>           satisfied by a simplistic implementation  that  imposed  th=
e
>           further  requirement  that  the  values  in both field 1 an=
d
>           field 2 of successive lines must be in  ascending  numerica=
l
>           order,  which prevented some otherwise valid maps from bein=
g
>           created.  Linux 3.9 and later fix this limitation,  allowin=
g
>           any valid set of nonoverlapping maps.
>
>        *  At least one line must be written to the file.
>
>        Writes that violate the above rules fail with the error EINVAL=
=2E
>
>        In  order  for  a  process  to write to the /proc/[pid]/uid_ma=
p
>        (/proc/[pid]/gid_map) file, all of the  following  requirement=
s
>        must be met:
>
>        1. The  writing  process  must have the CAP_SETUID (CAP_SETGID=
)
>           capability in the user namespace of the process pid.
>
>        2. The writing process must be in either the user namespace  o=
f
>           the  process  pid or inside the parent user namespace of th=
e
>           process pid.
>
>        3. The mapped user IDs (group IDs) must in turn have a  mappin=
g
>           in the parent user namespace.
>
>        4. One of the following is true:
>
>           *  The  data written to uid_map (gid_map) consists of a sin=
=E2=80=90
>              gle line that maps the writing process's file system use=
r
>              ID  (group  ID) in the parent user namespace to a user I=
D
>              (group ID) in the user namespace.  The usual case here i=
s
>              that  this  single line provides a mapping for user ID o=
f
>              the process that created the namespace.
>
>           *  The process has the CAP_SETUID (CAP_SETGID) capability i=
n
>              the  parent  user  namespace.  Thus, a privileged proces=
s
>              can make mappings to arbitrary user IDs  (group  IDs)  i=
n
>              the parent user namespace.
>
>        Writes that violate the above rules fail with the error EPERM.
>
>    Unmapped user and group IDs
>        There  are  various places where an unmapped user ID (group ID=
)
>        may be exposed to user space.  For example, the  first  proces=
s
>        in a new user namespace may call getuid() before a user ID map=
=E2=80=90
>        ping has been defined for the namespace.  In most  such  cases=
,
>        an unmapped user ID is converted to the overflow user ID (grou=
p
>        ID); the default value for the overflow user ID (group  ID)  i=
s
>        65534.   See  the  descriptions of /proc/sys/kernel/overflowui=
d
>        and /proc/sys/kernel/overflowgid in proc(5).
>
>        The cases where unmapped IDs are mapped in this fashion includ=
e
>        system  calls  that  return  user IDs (getuid(2) getgid(2), an=
d
>        similar), credentials passed over a UNIX domain socket, creden=
=E2=80=90
>        tials  returned  by  stat(2),  waitid(2),  and the System V IP=
C
>        "ctl"   IPC_STAT    operations,    credentials    exposed    b=
y
>        /proc/PID/status  and the files in /proc/sysvipc/*, credential=
s
>        returned via the si_uid field in the siginfo_t received with  =
a
>        signal  (see  sigaction(2)), credentials written to the proces=
s
>        accounting file (see acct(5)), and  credentials  returned  wit=
h
>        POSIX message queue notifications (see mq_notify(3)).
>
>        There is one notable case where unmapped user and group IDs ar=
e
>        not converted to the corresponding  overflow  ID  value.   Whe=
n
>        viewing  a uid_map or gid_map file in which there is no mappin=
g
>        for the second field, that field is displayed as 4294967295 (-=
1
>        as an unsigned integer);
>
>    Set-user-ID and set-group-ID programs
>        When  a  process inside a user namespace executes a set-user-I=
D
>        (set-group-ID) program, the process's effective user (group) I=
D
>        inside the namespace is changed to whatever value is mapped fo=
r
>        the user (group) ID of the file.  However, if either  the  use=
r
>        or  the  group  ID of the file has no mapping inside the names=
=E2=80=90
>        pace, the set-user-ID (set-group-ID) bit is  silently  ignored=
:
>        the  new  program is executed, but the process's effective use=
r
>        (group) ID is left unchanged.  (This mirrors the  semantics  o=
f
>        executing a set-user-ID or set-group-ID program that resides o=
n
>        a file system that was mounted  with  the  MS_NOSUID  flag,  a=
s
>        described in mount(2).)
>
>    Miscellaneous
>        When  a  process's  user  and  group IDs are passed over a UNI=
X
>        domain socket to a process in a different user  namespace  (se=
e
>        the description of SCM_CREDENTIALS in unix(7)), they are trans=
=E2=80=90
>        lated into  the  corresponding  values  as  per  the  receivin=
g
>        process's user and group ID mappings.
>
> CONFORMING TO
>        Namespaces are a Linux-specific feature.
>
> NOTES
>        Over  the  years,  there  have been a lot of features that hav=
e
>        been added to the Linux kernel that have  been  made  availabl=
e
>        only  to privileged users because of their potential to confus=
e
>        set-user-ID-root applications.  In general, it becomes safe  t=
o
>        allow  the  root user in a user namespace to use those feature=
s
>        because it is impossible, while in a user  namespace,  to  gai=
n
>        more privilege than the root user of a user namespace has.
>
>    Availability
>        Use  of  user  namespaces  requires a kernel that is configure=
d
>        with the CONFIG_USER_NS option.  User namespaces  require  sup=
=E2=80=90
>        port  in  a  range  of  subsystems  across the kernel.  When a=
n
>        unsupported subsystem is configured into the kernel, it is  no=
t
>        possible  to  configure  user  namespaces support.  As at Linu=
x
>        3.8, most relevant  subsystems  support  user  namespaces,  bu=
t
>        there  are  a  number  of  file systems that do not.  Linux 3.=
9
>        added user namespaces support for many of the remaining  unsup=
=E2=80=90
>        ported  file  systems:  Plan  9 (9P), Andrew File System (AFS)=
,
>        Ceph, CIFS, CODA, NFS, and OCFS2.  XFS support for user  names=
=E2=80=90
>        paces is not yet available.

I have a conceptual problem with this description of filesystems
supporting user namespaces.  There are two levels of support a
filesystem may have.

A filesystem may be like extN and have deal with kuid and kgids and hav=
e
all of the necessary mappings of uids and gids to/from userspace in
place.  Making the filesystem safe to use in a user namespace enabled
kernel.

A filesystem may be like tmpfs and actually support being mounted from
inside of a user namespace.  I suspect nfs may join tmpfs in the not to=
o
distant future, and possibly some of the block based filesystems.
Mostly it is a question of how much do we trust the network or disk
facing side of their implementation.  And hopefully at some point fuse
will join in but so far fuse is weird.

At the point you can safely mount a filesystem inside a userns is when =
I
feel like the filesystem really supports user namespaces.  The case for
most of them is that they simply don't break the system when user
namespaces are enabled.

> EXAMPLE
>        The  program below is designed to allow experimenting with use=
r
>        namespaces, as well as other types of namespaces.   It  create=
s
>        namespaces  as  specified by command-line options and then exe=
=E2=80=90
>        cutes a command inside  those  namespaces.   The  comments  an=
d
>        usage()  function inside the program provide a full explanatio=
n
>        of the program.  The following shell session  demonstrates  it=
s
>        use.
>
>        First, we look at the run-time environment:
>
>            $ uname -rs     # Need Linux 3.8 or later
>            Linux 3.8.0
>            $ id -u         # Running as unprivileged user
>            1000
>            $ id -g
>            1000
>
>        Now  start  a  new  shell in new user (-U), mount (-m), and PI=
D
>        (-p) namespaces, with user ID  (-M)  and  group  ID  (-G)  100=
0
>        mapped to 0 inside the user namespace:
>
>            $ ./userns_child_exec -p -m -U -M '0 1000 1' -G '0 1000 1'=
 bash
>
>        The shell has PID 1, because it is the first process in the ne=
w
>        PID namespace:
>
>            bash$ echo $$
>            1
>
>        Inside the user namespace, the shell has user and group  ID  0=
,
>        and a full set of permitted and effective capabilities:
>
>            bash$ cat /proc/$$/status | egrep '^[UG]id'
>            Uid: 0    0    0    0
>            Gid: 0    0    0    0
>            bash$ cat /proc/$$/status | egrep '^Cap(Prm|Inh|Eff)'
>            CapInh:   0000000000000000
>            CapPrm:   0000001fffffffff
>            CapEff:   0000001fffffffff
>
>        Mounting  a  new  /proc file system and listing all of the pro=
=E2=80=90
>        cesses visible in the new PID namespace shows  that  the  shel=
l
>        can't see any processes outside the PID namespace:
>
>            bash$ mount -t proc proc /proc
>            bash$ ps ax
>              PID TTY      STAT   TIME COMMAND
>                1 pts/3    S      0:00 bash
>               22 pts/3    R+     0:00 ps ax
>
>    Program source
>
>        /* userns_child_exec.c
>
>           Licensed under GNU General Public License v2 or later
>
>           Create a child process that executes a shell command in new
>           namespace(s); allow UID and GID mappings to be specified wh=
en
>           creating a user namespace.
>        */
>        #define _GNU_SOURCE
>        #include <sched.h>
>        #include <unistd.h>
>        #include <stdlib.h>
>        #include <sys/wait.h>
>        #include <signal.h>
>        #include <fcntl.h>
>        #include <stdio.h>
>        #include <string.h>
>        #include <limits.h>
>        #include <errno.h>
>
>        /* A simple error-handling function: print an error message ba=
sed
>           on the value in 'errno' and terminate the calling process *=
/
>
>        #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); =
\
>                                } while (0)
>
>        struct child_args {
>            char **argv;        /* Command to be executed by child, wi=
th args */
>            int    pipe_fd[2];  /* Pipe used to synchronize parent and=
 child */
>        };
>
>        static int verbose;
>
>        static void
>        usage(char *pname)
>        {
>            fprintf(stderr, "Usage: %s [options] cmd [arg...]\n\n", pn=
ame);
>            fprintf(stderr, "Create a child process that executes a sh=
ell "
>                    "command in a new user namespace,\n"
>                    "and possibly also other new namespace(s).\n\n");
>            fprintf(stderr, "Options can be:\n\n");
>        #define fpe(str) fprintf(stderr, "    %s", str);
>            fpe("-i          New IPC namespace\n");
>            fpe("-m          New mount namespace\n");
>            fpe("-n          New network namespace\n");
>            fpe("-p          New PID namespace\n");
>            fpe("-u          New UTS namespace\n");
>            fpe("-U          New user namespace\n");
>            fpe("-M uid_map  Specify UID map for user namespace\n");
>            fpe("-G gid_map  Specify GID map for user namespace\n");
>            fpe("-z          Map user's UID and GID to 0 in user names=
pace\n");
>            fpe("            (equivalent to: -M '0 <uid> 1' -G '0 <gid=
> 1')\n");
>            fpe("-v          Display verbose messages\n");
>            fpe("\n");
>            fpe("If -z, -M, or -G is specified, -U is required.\n");
>            fpe("It is not permitted to specify both -z and either -M =
or -G.\n");
>            fpe("\n");
>            fpe("Map strings for -M and -G consist of records of the f=
orm:\n");
>            fpe("\n");
>            fpe("    ID-inside-ns   ID-outside-ns   len\n");
>            fpe("\n");
>            fpe("A map string can contain multiple records, separated"
>                " by commas;\n");
>            fpe("the commas are replaced by newlines before writing"
>                " to map files.\n");
>
>            exit(EXIT_FAILURE);
>        }
>
>        /* Update the mapping file 'map_file', with the value provided=
 in
>           'mapping', a string that defines a UID or GID mapping. A UI=
D or
>           GID mapping consists of one or more newline-delimited recor=
ds
>           of the form:
>
>               ID_inside-ns    ID-outside-ns   length
>
>           Requiring the user to supply a string that contains newline=
s is
>           of course inconvenient for command-line use. Thus, we permi=
t the
>           use of commas to delimit records in this string, and replac=
e them
>           with newlines before writing the string to the file. */
>
>        static void
>        update_map(char *mapping, char *map_file)
>        {
>            int fd, j;
>            size_t map_len;     /* Length of 'mapping' */
>
>            /* Replace commas in mapping string with newlines */
>
>            map_len =3D strlen(mapping);
>            for (j =3D 0; j < map_len; j++)
>                if (mapping[j] =3D=3D ',')
>                    mapping[j] =3D '\n';
>
>            fd =3D open(map_file, O_RDWR);
>            if (fd =3D=3D -1) {
>                fprintf(stderr, "ERROR: open %s: %s\n", map_file,
> strerror(errno));
>                return;
>                //exit(EXIT_FAILURE);
>            }
>
>            if (write(fd, mapping, map_len) !=3D map_len) {
>                fprintf(stderr, "ERROR: write %s: %s\n", map_file,
> strerror(errno));
>                //exit(EXIT_FAILURE);
>            }
>
>            close(fd);
>        }
>
>        static int              /* Start function for cloned child */
>        childFunc(void *arg)
>        {
>            struct child_args *args =3D (struct child_args *) arg;
>            char ch;
>
>            /* Wait until the parent has updated the UID and GID mappi=
ngs.
>               See the comment in main(). We wait for end of file on a
>               pipe that will be closed by the parent process once it =
has
>               updated the mappings. */
>
>            close(args->pipe_fd[1]);    /* Close our descriptor for th=
e write
>                                           end of the pipe so that we =
see EOF
>                                           when parent closes its desc=
riptor */
>            if (read(args->pipe_fd[0], &ch, 1) !=3D 0) {
>                fprintf(stderr,
>                        "Failure in child: read from pipe returned !=3D=
 0\n");
>                exit(EXIT_FAILURE);
>            }
>
>            /* Execute a shell command */
>
>            printf("About to exec %s\n", args->argv[0]);
>            execvp(args->argv[0], args->argv);
>            errExit("execvp");
>        }
>
>        #define STACK_SIZE (1024 * 1024)
>
>        static char child_stack[STACK_SIZE];    /* Space for child's s=
tack */
>
>        int
>        main(int argc, char *argv[])
>        {
>            int flags, opt, map_zero;
>            pid_t child_pid;
>            struct child_args args;
>            char *uid_map, *gid_map;
>            const int MAP_BUF_SIZE =3D 100;
>            char map_buf[MAP_BUF_SIZE];
>            char map_path[PATH_MAX];
>
>            /* Parse command-line options. The initial '+' character i=
n
>               the final getopt() argument prevents GNU-style permutat=
ion
>               of command-line options. That's useful, since sometimes
>               the 'command' to be executed by this program itself
>               has command-line options. We don't want getopt() to tre=
at
>               those as options to this program. */
>
>            flags =3D 0;
>            verbose =3D 0;
>            gid_map =3D NULL;
>            uid_map =3D NULL;
>            map_zero =3D 0;
>            while ((opt =3D getopt(argc, argv, "+imnpuUM:G:zv")) !=3D =
-1) {
>                switch (opt) {
>                case 'i': flags |=3D CLONE_NEWIPC;        break;
>                case 'm': flags |=3D CLONE_NEWNS;         break;
>                case 'n': flags |=3D CLONE_NEWNET;        break;
>                case 'p': flags |=3D CLONE_NEWPID;        break;
>                case 'u': flags |=3D CLONE_NEWUTS;        break;
>                case 'v': verbose =3D 1;                  break;
>                case 'z': map_zero =3D 1;                 break;
>                case 'M': uid_map =3D optarg;             break;
>                case 'G': gid_map =3D optarg;             break;
>                case 'U': flags |=3D CLONE_NEWUSER;       break;
>                default:  usage(argv[0]);
>                }
>            }
>
>            /* -M or -G without -U is nonsensical */
>
>            if (((uid_map !=3D NULL || gid_map !=3D NULL || map_zero) =
&&
>                        !(flags & CLONE_NEWUSER)) ||
>                    (map_zero && (uid_map !=3D NULL || gid_map !=3D NU=
LL)))
>                usage(argv[0]);
>
>            args.argv =3D &argv[optind];
>
>            /* We use a pipe to synchronize the parent and child, in o=
rder to
>               ensure that the parent sets the UID and GID maps before=
 the child
>               calls execve(). This ensures that the child maintains i=
ts
>               capabilities during the execve() in the common case whe=
re we
>               want to map the child's effective user ID to 0 in the n=
ew user
>               namespace. Without this synchronization, the child woul=
d lose
>               its capabilities if it performed an execve() with nonze=
ro
>               user IDs (see the capabilities(7) man page for details =
of the
>               transformation of a process's capabilities during execv=
e()). */
>
>            if (pipe(args.pipe_fd) =3D=3D -1)
>                errExit("pipe");
>
>            /* Create the child in new namespace(s) */
>
>            child_pid =3D clone(childFunc, child_stack + STACK_SIZE,
>                              flags | SIGCHLD, &args);
>            if (child_pid =3D=3D -1)
>                errExit("clone");
>
>            /* Parent falls through to here */
>
>            if (verbose)
>                printf("%s: PID of child created by clone() is %ld\n",
>                        argv[0], (long) child_pid);
>
>            /* Update the UID and GID maps in the child */
>
>            if (uid_map !=3D NULL || map_zero) {
>                snprintf(map_path, PATH_MAX, "/proc/%ld/uid_map",
>                        (long) child_pid);
>                if (map_zero) {
>                    snprintf(map_buf, MAP_BUF_SIZE, "0 %ld 1", (long) =
getuid());
>                    uid_map =3D map_buf;
>                }
>                update_map(uid_map, map_path);
>            }
>            if (gid_map !=3D NULL || map_zero) {
>                snprintf(map_path, PATH_MAX, "/proc/%ld/gid_map",
>                        (long) child_pid);
>                if (map_zero) {
>                    snprintf(map_buf, MAP_BUF_SIZE, "0 %ld 1", (long) =
getgid());
>                    gid_map =3D map_buf;
>                }
>                update_map(gid_map, map_path);
>            }
>
>            /* Close the write end of the pipe, to signal to the child=
 that we
>               have updated the UID and GID maps */
>
>            close(args.pipe_fd[1]);
>
>            if (waitpid(child_pid, NULL, 0) =3D=3D -1)      /* Wait fo=
r child */
>                errExit("waitpid");
>
>            if (verbose)
>                printf("%s: terminating\n", argv[0]);
>
>            exit(EXIT_SUCCESS);
>        }
>
> SEE ALSO
>        newgidmap(1),  newuidmap(1),  clone(2),  setns(2),  unshare(2)=
,
>        proc(5), subgid(5), subuid(5), credentials(7), capabilities(7)=
,
>        namespaces(7), pid_namespaces(7)
>
>        The  kernel  source file Documentation/namespaces/resource-con=
=E2=80=90
>        trol.txt.
>
>
>
> Linux                         2013-01-14            USER_NAMESPACES(7=
)
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D *roff source =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> .\" Copyright (c) 2013 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\" and Copyright (c) 2012 by Eric W. Biederman <ebiederm-aS9lmoZGLiXQFizaE/u3fw@public.gmane.org=
m>
> .\"
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\"
> .\"
> .TH USER_NAMESPACES 7 2013-01-14 "Linux" "Linux Programmer's Manual"
> .SH NAME
> user_namespaces \- overview of Linux user_namespaces
> .SH DESCRIPTION
> For an overview of namespaces, see
> .BR namespaces (7).
>
> User namespaces isolate security-related identifiers, in particular,
> user IDs and group IDs (see
> .BR credentials (7),
> keys (see
> .BR keyctl (2)),
> .\" FIXME: This page says very little about the interaction
> .\" of user namespaces and keys. Add something on this topic.
> and capabilities (see
> .BR capabilities (7)).
> A process's user and group IDs can be different
> inside and outside a user namespace.
> In particular,
> a process can have a normal unprivileged user ID outside a user names=
pace
> while at the same time having a user ID of 0 inside the namespace;
> in other words,
> the process has full privileges for operations inside the user namesp=
ace,
> but is unprivileged for operations outside the namespace.
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Nested namespaces, namespace membership
> User namespaces can be nested;
> that is, each user namespace\(emexcept the initial ("root")
> namespace\(emhas a parent user namespace,
> and can have zero or more child user namespaces.
> The parent user namespace is the user namespace
> of the process that creates the user namespace via a call to
> .BR unshare (2)
> or
> .BR clone (2)
> with the
> .BR CLONE_NEWUSER
> flag.
>
> Each process is a member of exactly one user namespace.
> A process created via
> .BR fork (2)
> or
> .BR clone (2)
> without the
> .BR CLONE_NEWUSER
> flag is a member of the same user namespace as its parent.
> A process can join another user namespace with
> .BR setns (2)
> if it has the
> .BR CAP_SYS_ADMIN
> in that namespace;
> upon doing so, it gains a full set of capabilities in that namespace.
>
> A call to
> .BR clone (2)
> or
> .BR unshare (2)
> with the
> .BR CLONE_NEWUSER
> flag makes the new child process (for
> .BR clone (2))
> or the caller (for
> .BR unshare (2))
> a member of the new user namespace created by the call.
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Capabilities
> The child process created by
> .BR clone (2)
> with the
> .BR CLONE_NEWUSER
> flag starts out with a complete set
> of capabilities in the new user namespace.
> Likewise, a process that creates a new user namespace using
> .BR unshare (2)
> or joins an existing user namespace using
> .BR setns (2)
> gains a full set of capabilities in that namespace.
> On the other hand,
> that process has no capabilities in the parent (in the case of
> .BR clone (2))
> or previous (in the case of
> .BR unshare (2)
> and
> .BR setns (2))
> user namespace,
> even if the new namespace is created or joined by the root user
> (i.e., a process with user ID 0 in the root namespace).
> Nevertheless, a process owned by the root user
> will be able to access resources such as
> files that are owned by user ID 0,
> and will be able to do things such as sending signals
> to processes belonging to user ID 0.
>
> Note that a call to
> .BR execve (2)
> will cause a process to lose any capabilities that it has,
> unless it has a user ID of 0 within the namespace.
> Thus, before calling
> .BR execve (2),
> a user ID mapping for ID 0 must be defined,
> and the caller may also need to use
> .BR setuid (2)
> or similar to set its user ID to 0.
>
> A call to
> .BR clone (2),
> .BR unshare (2),
> or
> .BR setns (2)
> using the
> .BR CLONE_NEWUSER
> flag sets the "securebits" flags
> (see
> .BR capabilities (7))
> to their default values (all flags disabled) in the child (for
> .BR clone (2))
> or caller (for
> .BR unshare (2),
> or
> .BR setns (2)).
> Note that because the caller no longer has capabilities
> in its original user namespace after a call to
> .BR setns (2),
> it is not possible for a process to reset its "securebits" flags whil=
e
> retaining its user namespace membership by using a pair of
> .BR setns (2)
> calls to move to another user namespace and then return to
> its original user namespace.
>
> Having a capability inside a user namespace
> permits a process to perform operations (that require privilege)
> only on resources governed by that namespace.
> The rules for determining whether or not a process has a capability
> in a particular user namespace are as follows:
> .IP 1. 3
> A process has a capability inside a user namespace
> if it is a member of that namespace and
> it has the capability in its effective capability set.
> A process can gain capabilities in its effective capability
> set in various ways.
> For example, it may execute a set-user-ID program or an
> executable with associated file capabilities.
> In addition,
> a process may gain capabilities via the effect of
> .BR clone (2),
> .BR unshare (2),
> or
> .BR setns (2),
> as already described.
> .\" In the 3.8 sources, see security/commoncap.c::cap_capable():
> .IP 2.
> If a process has a capability in a user namespace,
> then it has that capability in all child (and further removed descend=
ant)
> namespaces as well.
> .IP 3.
> .\" * The owner of the user namespace in the parent of the
> .\" * user namespace has all caps.
> When a user namespace is created, the kernel records the effective
> user ID of the creating process as being the "owner" of the namespace=
=2E
> .\" (and likewise associates the effective group ID of the creating p=
rocess
> .\" with the namespace).
> A process that resides
> in the parent of the user namespace
> .\" See kernel commit 520d9eabce18edfef76a60b7b839d54facafe1f9 for a =
fix
> .\" on this point
> and whose effective user ID matches the owner of the namespace
> has all capabilities in the namespace.
> .\"     This includes the case where the process executes a set-user-=
ID
> .\"     program that confers the effective UID of the creator of the =
namespace.
> By virtue of the previous rule,
> this means that the process has all capabilities in all
> further removed descendant user namespaces as well.
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Interaction of user namespaces and other types of namespaces
> Starting in Linux 3.8, unprivileged processes can create user namespa=
ces,
> and mount, PID, IPC, network, and UTS namespaces can be created with =
just the
> .B CAP_SYS_ADMIN
> capability in the caller's user namespace.
>
> If
> .BR CLONE_NEWUSER
> is specified along with other
> .B CLONE_NEW*
> flags in a single
> .BR clone (2)
> or
> .BR unshare (2)
> call, the user namespace is guaranteed to be created first,
> giving the child
> .RB ( clone (2))
> or caller
> .RB ( unshare (2))
> privileges over the remaining namespaces created by the call.
> Thus, it is possible for an unprivileged caller to specify this combi=
nation
> of flags.
>
> When a new IPC, mount, network, PID, or UTS namespace is created via
> .BR clone (2)
> or
> .BR unshare (2),
> the kernel records the user namespace of the creating process against
> the new namespace.
> (This association can't be changed.)
> When a process in the new namespace subsequently performs
> privileged operations that operate on global
> resources isolated by the namespace,
> the permission checks are performed according to the process's capabi=
lities
> in the user namespace that the kernel associated with the new namespa=
ce.
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS User and group ID mappings: uid_map and gid_map
> When a user namespace is created,
> it starts out without a mapping of user IDs (group IDs)
> to the parent user namespace.
> The
> .IR /proc/[pid]/uid_map
> and
> .IR /proc/[pid]/gid_map
> files (available since Linux 3.5)
> .\" commit 22d917d80e842829d0ca0a561967d728eb1d6303
> expose the mappings for user and group IDs
> inside the user namespace for the process
> .IR pid .
> These files can be read to view the mappings in a user namespace and
> written to (once) to define the mappings.
>
> The description in the following paragraphs explains the details for
> .IR uid_map ;
> .IR gid_map
> is exactly the same,
> but each instance of "user ID" is replaced by "group ID".
>
> The
> .I uid_map
> file exposes the mapping of user IDs from the user namespace
> of the process
> .IR pid
> to the user namespace of the process that opened
> .IR uid_map
> (but see a qualification to this point below).
> In other words, processes that are in different user namespaces
> will potentially see different values when reading from a particular
> .I uid_map
> file, depending on the user ID mappings for the user namespaces
> of the reading processes.
>
> Each line in the
> .I uid_map
> file specifies a 1-to-1 mapping of a range of contiguous
> user IDs between two user namespaces.
> (When a user namespace is first created, this file is empty.)
> The specification in each line takes the form of
> three numbers delimited by white space.
> The first two numbers specify the starting user ID in
> each of the two user namespaces.
> The third number specifies the length of the mapped range.
> In detail, the fields are interpreted as follows:
> .IP (1) 4
> The start of the range of user IDs in
> the user namespace of the process
> .IR pid .
> .IP (2)
> The start of the range of user
> IDs to which the user IDs specified by field one map.
> How field two is interpreted depends on whether the process that open=
ed
> .I uid_map
> and the process
> .IR pid
> are in the same user namespace, as follows:
> .RS
> .IP a) 3
> If the two processes are in different user namespaces:
> field two is the start of a range of
> user IDs in the user namespace of the process that opened
> .IR uid_map .
> .IP b)
> If the two processes are in the same user namespace:
> field two is the start of the range of
> user IDs in the parent user namespace of the process
> .IR pid .
> This case enables the opener of
> .I uid_map
> (the common case here is opening
> .IR /proc/self/uid_map )
> to see the mapping of user IDs into the user namespace of the process
> that created this user namespace.
> .RE
> .IP (3)
> The length of the range of user IDs that is mapped between the two
> user namespaces.
> .PP
> System calls that return user IDs (group IDs)\(emfor example,
> .BR getuid (2),
> .BR getgid (2),
> and the credential fields in the structure returned by
> .BR stat (2)\(emreturn
> the user ID (group ID) mapped into the caller's user namespace.
>
> When a process accesses a file, its user and group IDs
> are mapped into the initial user namespace for the purpose of permiss=
ion
> checking and assigning IDs when creating a file.
> When a process retrieves file user and group IDs via
> .BR stat (2),
> the IDs are mapped in the opposite direction,
> to produce values relative to the process user and group ID mappings.
>
> The initial user namespace has no parent namespace,
> but, for consistency, the kernel provides dummy user and group
> ID mapping files for this namespace.
> Looking at the
> .I uid_map
> file
> .RI ( gid_map
> is the same) from a shell in the initial namespace shows:
>
> .in +4n
> .nf
> $ \fBcat /proc/$$/uid_map\fP
>          0          0 4294967295
> .fi
> .in
>
> This mapping tells us
> that the range starting at user ID 0 in this namespace
> maps to a range starting at 0 in the (nonexistent) parent namespace,
> and the length of the range is the largest 32-bit unsigned integer.
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Defining user and group ID mappings: writing to uid_map and gid_m=
ap
> .PP
> After the creation of a new user namespace, the
> .I uid_map
> file of
> .I one
> of the processes in the namespace may be written to
> .I once
> to define the mapping of user IDs in the new user namespace.
> An attempt to write more than once to a
> .I uid_map
> file in a user namespace fails with the error
> .BR EPERM .
> Similar rules apply for
> .I gid_map
> files.
>
> The lines written to
> .IR uid_map
> .RI ( gid_map )
> must conform to the following rules:
> .IP * 3
> The three fields must be valid numbers,
> and the last field must be greater than 0.
> .IP *
> Lines are terminated by newline characters.
> .IP *
> There is an (arbitrary) limit on the number of lines in the file.
> As at Linux 3.8, the limit is five lines.
> In addition, the number of bytes written to
> the file must be less than the system page size,
> .\" FIXME(Eric): the restriction "less than" rather than "less than o=
r equal"
> .\" seems strangely arbitrary. Furthermore, the comment does not agre=
e
> .\" with the code in kernel/user_namespace.c. Which is correct.
> and the write must be performed at the start of the file (i.e.,
> .BR lseek (2)
> and
> .BR pwrite (2)
> can't be used to write to nonzero offsets in the file).
> .IP *
> The range of user IDs (group IDs)
> specified in each line cannot overlap with the ranges
> in any other lines.
> In the initial implementation (Linux 3.8), this requirement was
> satisfied by a simplistic implementation that imposed the further
> requirement that
> the values in both field 1 and field 2 of successive lines must be
> in ascending numerical order,
> which prevented some otherwise valid maps from being created.
> Linux 3.9 and later
> .\" commit 0bd14b4fd72afd5df41e9fd59f356740f22fceba
> fix this limitation, allowing any valid set of nonoverlapping maps.
> .IP *
> At least one line must be written to the file.
> .PP
> Writes that violate the above rules fail with the error
> .BR EINVAL .
>
> In order for a process to write to the
> .I /proc/[pid]/uid_map
> .RI ( /proc/[pid]/gid_map )
> file, all of the following requirements must be met:
> .IP 1. 3
> The writing process must have the
> .BR CAP_SETUID
> .RB ( CAP_SETGID )
> capability in the user namespace of the process
> .IR pid .
> .IP 2.
> The writing process must be in either the user namespace of the proce=
ss
> .I pid
> or inside the parent user namespace of the process
> .IR pid .
> .IP 3.
> The mapped user IDs (group IDs) must in turn have a mapping
> in the parent user namespace.
> .IP 4.
> One of the following is true:
> .RS
> .IP * 3
> The data written to
> .I uid_map
> .RI ( gid_map )
> consists of a single line that maps the writing process's file system=
 user ID
> (group ID) in the parent user namespace to a user ID (group ID)
> in the user namespace.
> The usual case here is that this single line provides a mapping for u=
ser ID
> of the process that created the namespace.
> .IP * 3
> The process has the
> .BR CAP_SETUID
> .RB ( CAP_SETGID )
> capability in the parent user namespace.
> Thus, a privileged process can make mappings to arbitrary user IDs (g=
roup IDs)
> in the parent user namespace.
> .RE
> .PP
> Writes that violate the above rules fail with the error
> .BR EPERM .
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Unmapped user and group IDs
> .PP
> There are various places where an unmapped user ID (group ID)
> may be exposed to user space.
> For example, the first process in a new user namespace may call
> .BR getuid ()
> before a user ID mapping has been defined for the namespace.
> In most such cases, an unmapped user ID is converted
> .\" from_kuid_munged(), from_kgid_munged()
> to the overflow user ID (group ID);
> the default value for the overflow user ID (group ID) is 65534.
> See the descriptions of
> .IR /proc/sys/kernel/overflowuid
> and
> .IR /proc/sys/kernel/overflowgid
> in
> .BR proc (5).
>
> The cases where unmapped IDs are mapped in this fashion include
> system calls that return user IDs
> .RB ( getuid (2)
> .BR getgid (2),
> and similar),
> credentials passed over a UNIX domain socket,
> .\" also SO_PEERCRED
> credentials returned by
> .BR stat (2),
> .BR waitid (2),
> and the System V IPC "ctl"
> .B IPC_STAT
> operations,
> credentials exposed by
> .IR /proc/PID/status
> and the files in
> .IR /proc/sysvipc/* ,
> credentials returned via the
> .I si_uid
> field in the
> .I siginfo_t
> received with a signal (see
> .BR sigaction (2)),
> credentials written to the process accounting file (see
> .BR acct (5)),
> and credentials returned with POSIX message queue notifications (see
> .BR mq_notify (3)).
>
> There is one notable case where unmapped user and group IDs are
> .I not
> .\" from_kuid(), from_kgid()
> .\" Also F_GETOWNER_UIDS is an exception
> converted to the corresponding overflow ID value.
> When viewing a
> .I uid_map
> or
> .I gid_map
> file in which there is no mapping for the second field,
> that field is displayed as 4294967295 (\-1 as an unsigned integer);
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Set-user-ID and set-group-ID programs
> .PP
> When a process inside a user namespace executes
> a set-user-ID (set-group-ID) program,
> the process's effective user (group) ID inside the namespace is chang=
ed
> to whatever value is mapped for the user (group) ID of the file.
> However, if either the user
> .I or
> the group ID of the file has no mapping inside the namespace,
> the set-user-ID (set-group-ID) bit is silently ignored:
> the new program is executed,
> but the process's effective user (group) ID is left unchanged.
> (This mirrors the semantics of executing a set-user-ID or set-group-I=
D
> program that resides on a file system that was mounted with the
> .BR MS_NOSUID
> flag, as described in
> .BR mount (2).)
> .\"
> .\" =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> .\"
> .SS Miscellaneous
> .PP
> When a process's user and group IDs are passed over a UNIX domain soc=
ket
> to a process in a different user namespace (see the description of
> .B SCM_CREDENTIALS
> in
> .BR unix (7)),
> they are translated into the corresponding values as per the
> receiving process's user and group ID mappings.
> .\"
> .SH CONFORMING TO
> Namespaces are a Linux-specific feature.
> .\"
> .SH NOTES
> Over the years, there have been a lot of features that have been adde=
d
> to the Linux kernel that have been made available only to privileged =
users
> because of their potential to confuse set-user-ID-root applications.
> In general, it becomes safe to allow the root user in a user namespac=
e to
> use those features because it is impossible, while in a user namespac=
e,
> to gain more privilege than the root user of a user namespace has.
> .SS Availability
> Use of user namespaces requires a kernel that is configured with the
> .B CONFIG_USER_NS
> option.
> User namespaces require support in a range of subsystems across
> the kernel.
> When an unsupported subsystem is configured into the kernel,
> it is not possible to configure user namespaces support.
> As at Linux 3.8, most relevant subsystems support user namespaces,
> but there are a number of file systems that do not.
> Linux 3.9 added user namespaces support for many of the remaining
> unsupported file systems:
> Plan 9 (9P), Andrew File System (AFS), Ceph, CIFS, CODA, NFS, and OCF=
S2.
> XFS support for user namespaces is not yet available.
> .\"
> .SH EXAMPLE
> The program below is designed to allow experimenting with
> user namespaces, as well as other types of namespaces.
> It creates namespaces as specified by command-line options and then e=
xecutes
> a command inside those namespaces.
> The comments and
> .I usage()
> function inside the program provide a full explanation of the program=
=2E
> The following shell session demonstrates its use.
>
> First, we look at the run-time environment:
>
> .in +4n
> .nf
> $ \fBuname -rs\fP     # Need Linux 3.8 or later
> Linux 3.8.0
> $ \fBid -u\fP         # Running as unprivileged user
> 1000
> $ \fBid -g\fP
> 1000
> .fi
> .in
>
> Now start a new shell in new user
> .RI ( \-U ),
> mount
> .RI ( \-m ),
> and PID
> .RI ( \-p )
> namespaces, with user ID
> .RI ( \-M )
> and group ID
> .RI ( \-G )
> 1000 mapped to 0 inside the user namespace:
>
> .in +4n
> .nf
> $ \fB./userns_child_exec -p -m -U -M '0 1000 1' -G '0 1000 1' bash\fP
> .fi
> .in
>
> The shell has PID 1, because it is the first process in the new
> PID namespace:
>
> .in +4n
> .nf
> bash$ \fBecho $$\fP
> 1
> .fi
> .in
>
> Inside the user namespace, the shell has user and group ID 0,
> and a full set of permitted and effective capabilities:
>
> .in +4n
> .nf
> bash$ \fBcat /proc/$$/status | egrep '^[UG]id'\fP
> Uid:	0	0	0	0
> Gid:	0	0	0	0
> bash$ \fBcat /proc/$$/status | egrep '^Cap(Prm|Inh|Eff)'\fP
> CapInh:	0000000000000000
> CapPrm:	0000001fffffffff
> CapEff:	0000001fffffffff
> .fi
> .in
>
> Mounting a new
> .I /proc
> file system and listing all of the processes visible
> in the new PID namespace shows that the shell can't see
> any processes outside the PID namespace:
>
> .in +4n
> .nf
> bash$ \fBmount -t proc proc /proc\fP
> bash$ \fBps ax\fP
>   PID TTY      STAT   TIME COMMAND
>     1 pts/3    S      0:00 bash
>    22 pts/3    R+     0:00 ps ax
> .fi
> .in
> .SS Program source
> \&
> .nf
> /* userns_child_exec.c
>
>    Licensed under GNU General Public License v2 or later
>
>    Create a child process that executes a shell command in new
>    namespace(s); allow UID and GID mappings to be specified when
>    creating a user namespace.
> */
> #define _GNU_SOURCE
> #include <sched.h>
> #include <unistd.h>
> #include <stdlib.h>
> #include <sys/wait.h>
> #include <signal.h>
> #include <fcntl.h>
> #include <stdio.h>
> #include <string.h>
> #include <limits.h>
> #include <errno.h>
>
> /* A simple error\-handling function: print an error message based
>    on the value in \(aqerrno\(aq and terminate the calling process */
>
> #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
>                         } while (0)
>
> struct child_args {
>     char **argv;        /* Command to be executed by child, with args=
 */
>     int    pipe_fd[2];  /* Pipe used to synchronize parent and child =
*/
> };
>
> static int verbose;
>
> static void
> usage(char *pname)
> {
>     fprintf(stderr, "Usage: %s [options] cmd [arg...]\\n\\n", pname);
>     fprintf(stderr, "Create a child process that executes a shell "
>             "command in a new user namespace,\\n"
>             "and possibly also other new namespace(s).\\n\\n");
>     fprintf(stderr, "Options can be:\\n\\n");
> #define fpe(str) fprintf(stderr, "    %s", str);
>     fpe("\-i          New IPC namespace\\n");
>     fpe("\-m          New mount namespace\\n");
>     fpe("\-n          New network namespace\\n");
>     fpe("\-p          New PID namespace\\n");
>     fpe("\-u          New UTS namespace\\n");
>     fpe("\-U          New user namespace\\n");
>     fpe("\-M uid_map  Specify UID map for user namespace\\n");
>     fpe("\-G gid_map  Specify GID map for user namespace\\n");
>     fpe("\-z          Map user\(aqs UID and GID to 0 in user namespac=
e\\n");
>     fpe("            (equivalent to: \-M \(aq0 <uid> 1\(aq \-G \(aq0
> <gid> 1\(aq)\\n");
>     fpe("\-v          Display verbose messages\\n");
>     fpe("\\n");
>     fpe("If \-z, \-M, or \-G is specified, \-U is required.\\n");
>     fpe("It is not permitted to specify both \-z and either \-M or \-=
G.\\n");
>     fpe("\\n");
>     fpe("Map strings for \-M and \-G consist of records of the form:\=
\n");
>     fpe("\\n");
>     fpe("    ID\-inside\-ns   ID\-outside\-ns   len\\n");
>     fpe("\\n");
>     fpe("A map string can contain multiple records, separated"
>         " by commas;\\n");
>     fpe("the commas are replaced by newlines before writing"
>         " to map files.\\n");
>
>     exit(EXIT_FAILURE);
> }
>
> /* Update the mapping file \(aqmap_file\(aq, with the value provided =
in
>    \(aqmapping\(aq, a string that defines a UID or GID mapping. A UID=
 or
>    GID mapping consists of one or more newline\-delimited records
>    of the form:
>
>        ID_inside\-ns    ID\-outside\-ns   length
>
>    Requiring the user to supply a string that contains newlines is
>    of course inconvenient for command\-line use. Thus, we permit the
>    use of commas to delimit records in this string, and replace them
>    with newlines before writing the string to the file. */
>
> static void
> update_map(char *mapping, char *map_file)
> {
>     int fd, j;
>     size_t map_len;     /* Length of \(aqmapping\(aq */
>
>     /* Replace commas in mapping string with newlines */
>
>     map_len =3D strlen(mapping);
>     for (j =3D 0; j < map_len; j++)
>         if (mapping[j] =3D=3D \(aq,\(aq)
>             mapping[j] =3D \(aq\\n\(aq;
>
>     fd =3D open(map_file, O_RDWR);
>     if (fd =3D=3D \-1) {
>         fprintf(stderr, "ERROR: open %s: %s\\n", map_file, strerror(e=
rrno));
>         return;
>         //exit(EXIT_FAILURE);
>     }
>
>     if (write(fd, mapping, map_len) !=3D map_len) {
>         fprintf(stderr, "ERROR: write %s: %s\\n", map_file, strerror(=
errno));
>         //exit(EXIT_FAILURE);
>     }
>
>     close(fd);
> }
>
> static int              /* Start function for cloned child */
> childFunc(void *arg)
> {
>     struct child_args *args =3D (struct child_args *) arg;
>     char ch;
>
>     /* Wait until the parent has updated the UID and GID mappings.
>        See the comment in main(). We wait for end of file on a
>        pipe that will be closed by the parent process once it has
>        updated the mappings. */
>
>     close(args\->pipe_fd[1]);    /* Close our descriptor for the writ=
e
>                                    end of the pipe so that we see EOF
>                                    when parent closes its descriptor =
*/
>     if (read(args\->pipe_fd[0], &ch, 1) !=3D 0) {
>         fprintf(stderr,
>                 "Failure in child: read from pipe returned !=3D 0\\n"=
);
>         exit(EXIT_FAILURE);
>     }
>
>     /* Execute a shell command */
>
>     printf("About to exec %s\\n", args\->argv[0]);
>     execvp(args\->argv[0], args\->argv);
>     errExit("execvp");
> }
>
> #define STACK_SIZE (1024 * 1024)
>
> static char child_stack[STACK_SIZE];    /* Space for child\(aqs stack=
 */
>
> int
> main(int argc, char *argv[])
> {
>     int flags, opt, map_zero;
>     pid_t child_pid;
>     struct child_args args;
>     char *uid_map, *gid_map;
>     const int MAP_BUF_SIZE =3D 100;
>     char map_buf[MAP_BUF_SIZE];
>     char map_path[PATH_MAX];
>
>     /* Parse command\-line options. The initial \(aq+\(aq character i=
n
>        the final getopt() argument prevents GNU\-style permutation
>        of command\-line options. That\(aqs useful, since sometimes
>        the \(aqcommand\(aq to be executed by this program itself
>        has command\-line options. We don\(aqt want getopt() to treat
>        those as options to this program. */
>
>     flags =3D 0;
>     verbose =3D 0;
>     gid_map =3D NULL;
>     uid_map =3D NULL;
>     map_zero =3D 0;
>     while ((opt =3D getopt(argc, argv, "+imnpuUM:G:zv")) !=3D \-1) {
>         switch (opt) {
>         case \(aqi\(aq: flags |=3D CLONE_NEWIPC;        break;
>         case \(aqm\(aq: flags |=3D CLONE_NEWNS;         break;
>         case \(aqn\(aq: flags |=3D CLONE_NEWNET;        break;
>         case \(aqp\(aq: flags |=3D CLONE_NEWPID;        break;
>         case \(aqu\(aq: flags |=3D CLONE_NEWUTS;        break;
>         case \(aqv\(aq: verbose =3D 1;                  break;
>         case \(aqz\(aq: map_zero =3D 1;                 break;
>         case \(aqM\(aq: uid_map =3D optarg;             break;
>         case \(aqG\(aq: gid_map =3D optarg;             break;
>         case \(aqU\(aq: flags |=3D CLONE_NEWUSER;       break;
>         default:  usage(argv[0]);
>         }
>     }
>
>     /* \-M or \-G without \-U is nonsensical */
>
>     if (((uid_map !=3D NULL || gid_map !=3D NULL || map_zero) &&
>                 !(flags & CLONE_NEWUSER)) ||
>             (map_zero && (uid_map !=3D NULL || gid_map !=3D NULL)))
>         usage(argv[0]);
>
>     args.argv =3D &argv[optind];
>
>     /* We use a pipe to synchronize the parent and child, in order to
>        ensure that the parent sets the UID and GID maps before the ch=
ild
>        calls execve(). This ensures that the child maintains its
>        capabilities during the execve() in the common case where we
>        want to map the child\(aqs effective user ID to 0 in the new u=
ser
>        namespace. Without this synchronization, the child would lose
>        its capabilities if it performed an execve() with nonzero
>        user IDs (see the capabilities(7) man page for details of the
>        transformation of a process\(aqs capabilities during execve())=
=2E */
>
>     if (pipe(args.pipe_fd) =3D=3D \-1)
>         errExit("pipe");
>
>     /* Create the child in new namespace(s) */
>
>     child_pid =3D clone(childFunc, child_stack + STACK_SIZE,
>                       flags | SIGCHLD, &args);
>     if (child_pid =3D=3D \-1)
>         errExit("clone");
>
>     /* Parent falls through to here */
>
>     if (verbose)
>         printf("%s: PID of child created by clone() is %ld\\n",
>                 argv[0], (long) child_pid);
>
>     /* Update the UID and GID maps in the child */
>
>     if (uid_map !=3D NULL || map_zero) {
>         snprintf(map_path, PATH_MAX, "/proc/%ld/uid_map",
>                 (long) child_pid);
>         if (map_zero) {
>             snprintf(map_buf, MAP_BUF_SIZE, "0 %ld 1", (long) getuid(=
));
>             uid_map =3D map_buf;
>         }
>         update_map(uid_map, map_path);
>     }
>     if (gid_map !=3D NULL || map_zero) {
>         snprintf(map_path, PATH_MAX, "/proc/%ld/gid_map",
>                 (long) child_pid);
>         if (map_zero) {
>             snprintf(map_buf, MAP_BUF_SIZE, "0 %ld 1", (long) getgid(=
));
>             gid_map =3D map_buf;
>         }
>         update_map(gid_map, map_path);
>     }
>
>     /* Close the write end of the pipe, to signal to the child that w=
e
>        have updated the UID and GID maps */
>
>     close(args.pipe_fd[1]);
>
>     if (waitpid(child_pid, NULL, 0) =3D=3D \-1)      /* Wait for chil=
d */
>         errExit("waitpid");
>
>     if (verbose)
>         printf("%s: terminating\\n", argv[0]);
>
>     exit(EXIT_SUCCESS);
> }
> .fi
> .SH SEE ALSO
> .BR newgidmap (1),      \" From the shadow package
> .BR newuidmap (1),      \" From the shadow package
> .BR clone (2),
> .BR setns (2),
> .BR unshare (2),
> .BR proc (5),
> .BR subgid (5),         \" From the shadow package
> .BR subuid (5),         \" From the shadow package
> .BR credentials (7),
> .BR capabilities (7),
> .BR namespaces (7),
> .BR pid_namespaces (7)
> .sp
> The kernel source file
> .IR Documentation/namespaces/resource-control.txt .
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
