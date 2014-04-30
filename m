From: Jeff Layton <jlayton@poochiereds.net>
Subject: Re: [PATCH man-pages v1] fcntl.2: update manpage with verbiage
 about open file description locks
Date: Wed, 30 Apr 2014 08:15:01 -0400
Message-ID: <20140430081501.3aca5cba@tlielax.poochiereds.net>
References: <1398797474-744-1-git-send-email-jlayton@poochiereds.net>
	<5360D56F.4070509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <5360D56F.4070509@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, 30 Apr 2014 12:50:23 +0200
"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> wrote:

> [CC +=3D linux-man]
>=20
> Jeff,
>=20
> Thanks very much for writing this patch!
>=20
> I've taken your patch into a branch and add a number of details. I ha=
ve=20
> one or two questions below.
>=20
> On 04/29/2014 08:51 PM, Jeff Layton wrote:
> > Signed-off-by: Jeff Layton <jlayton@poochiereds.net>
> > ---
> >  man2/fcntl.2 | 112 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++--
> >  1 file changed, 109 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/man2/fcntl.2 b/man2/fcntl.2
> > index d0154a6d9f42..8d119dfec24c 100644
> > --- a/man2/fcntl.2
> > +++ b/man2/fcntl.2
> > @@ -191,6 +191,9 @@ and
> >  .BR O_SYNC
> >  flags; see BUGS, below.
> >  .SS Advisory locking
> > +This section describes traditional POSIX record locks. Also see th=
e section on
> > +open file description locks below.
> > +.PP
> >  .BR F_SETLK ,
> >  .BR F_SETLKW ,
> >  and
> > @@ -213,7 +216,8 @@ struct flock {
> >      off_t l_start;   /* Starting offset for lock */
> >      off_t l_len;     /* Number of bytes to lock */
> >      pid_t l_pid;     /* PID of process blocking our lock
> > -                        (F_GETLK only) */
> > +                        (returned for F_GETLK and F_OFD_GETLK only=
=2E Set
> > +                         to 0 for open file description locks) */
> >      ...
> >  };
> >  .fi
> > @@ -349,9 +353,13 @@ returns details about one of these locks in th=
e
> >  .IR l_type ", " l_whence ", " l_start ", and " l_len
> >  fields of
> >  .I lock
> > -and sets
> > +.
> > +If the conflicting lock is a traditional POSIX lock, then the
> > +.I l_pid
> > +to be the PID of the process holding that lock. If the
> > +conflicting lock is an open file description lock, then the
> >  .I l_pid
> > -to be the PID of the process holding that lock.
> > +will be set to \-1.
> >  Note that the information returned by
> >  .BR F_GETLK
> >  may already be out of date by the time the caller inspects it.
> > @@ -394,6 +402,104 @@ should be avoided; use
> >  and
> >  .BR write (2)
> >  instead.
> > +.SS Open file description locks (non-POSIX)
> > +.BR F_OFD_GETLK ", " F_OFD_SETLK " and  " F_OFD_SETLKW
> > +are used to acquire, release and test open file description record=
 locks.
> > +These are byte-range locks that work identically to the traditiona=
l advisory
> > +record locks described above, but are associated with the open fil=
e description
> > +on which they were acquired rather than the process, much like loc=
ks acquired
> > +with
> > +.BR flock (2)
> > +.
> > +.PP
> > +Unlike traditional advisory record locks, these locks are inherite=
d
> > +across
> > +.BR fork (2)
> > +and
> > +.BR clone (2)
> > +with
> > +.BR CLONE_FILES
> > +and are only released on the last close of the open file descripti=
on instead
> > +of being released on any close of the file.
> > +.PP
> > +Open file description locks always conflict with traditional recor=
d locks,
> > +even when they are acquired by the same process on the same file d=
escriptor.
> > +They only conflict with each other when they are acquired on diffe=
rent
> > +open file descriptions.
> > +.PP
> > +Note that in contrast to traditional record locks, the
> > +.I flock
> > +structure passed in as an argument to the open file description lo=
ck commands
> > +must have the
> > +.I l_pid
> > +value set to 0.
>=20
> In ERRORS, I added EINVAL for this case.
>=20
> > +.TP
> > +.BR F_OFD_SETLK " (\fIstruct flock *\fP)"
> > +Acquire an open file description lock (when
> > +.I l_type
> > +is
> > +.B F_RDLCK
> > +or
> > +.BR F_WRLCK )
> > +or release an open file description lock (when
> > +.I l_type
> > +is
> > +.BR F_UNLCK )
> > +on the bytes specified by the
> > +.IR l_whence ", " l_start ", and " l_len
> > +fields of
> > +.IR lock .
> > +If a conflicting lock is held by another process,
> > +this call returns \-1 and sets
> > +.I errno
> > +to
> > +.B EACCES
> > +or
> > +.BR EAGAIN .
>=20
> The "EACCES or EAGAIN" thing comes from POSIX, because different=20
> implementations of tradition record locks returned one of these error=
s.=20
> So, portable applications using traditional locks must handle either=20
> possibility. However, that argument doesn't apply for these new locks=
=2E=20
> Surely, we just want to say "set errno to EAGAIN" for this case?
>=20
> > +.TP
> > +.BR F_OFD_SETLKW " (\fIstruct flock *\fP)"
> > +As for
> > +.BR F_OFD_SETLK ,
> > +but if a conflicting lock is held on the file, then wait for that =
lock to be
> > +released. If a signal is caught while waiting, then the call is in=
terrupted
> > +and (after the signal handler has returned) returns immediately (w=
ith return
> > +value \-1 and
> > +.I errno
> > +set to
> > +.BR EINTR ;
> > +see
> > +.BR signal (7)).
> > +.TP
> > +.BR F_OFD_GETLK " (\fIstruct flock *\fP)"
> > +On input to this call,
> > +.I lock
> > +describes an open file description lock we would like to place on =
the file.
> > +If the lock could be placed,
> > +.BR fcntl ()
> > +does not actually place it, but returns
> > +.B F_UNLCK
> > +in the
> > +.I l_type
> > +field of
> > +.I lock
> > +and leaves the other fields of the structure unchanged.
> > +If one or more incompatible locks would prevent
> > +this lock being placed, then
> > +.BR fcntl ()
> > +returns details about one of these locks in the
> > +.IR l_type ", " l_whence ", " l_start ", and " l_len
> > +fields of
> > +.I lock
> > +.
> > +If the conflicting lock is a process-associated record lock, then =
the
> > +.I l_pid
> > +will be set to the PID of the process holding that lock. If the
> > +conflicting lock is an open file description lock, then the
> > +.I l_pid
> > +will be set to -1 to indicate that it is not associated with a pro=
cess.
> > +Note that the information returned by
> > +.BR F_OFD_GETLK
> > +may already be out of date by the time the caller inspects it.
> >  .SS Mandatory locking
> >  (Non-POSIX.)
> >  The above record locks may be either advisory or mandatory,
>=20
> Based on some past conversations, I added a number of details
> to the page, and also reworked your text a little to eliminate some=20
> of the redundancy with the discussion of traditional locks. Below,
> I've reproduced all of the relevant pieces from the current draft
> (including the existing text on traditional locks). Could I ask
> you to take a look at the pieces marked with '#' in column 1
> (which are places where I either tweaked your text significantly,
> or added details) and let me know if it looks okay.
>=20
>   DESCRIPTION
>    Advisory record locking
> #      Linux  implements  traditional ("process-associated") UNIX rec=
ord
> #      locks, as standardized by POSIX.  For a  Linux-specific  alter=
na=E2=80=90
> #      tive  with  better  semantics,  see  the  discussion of open f=
ile
> #      description locks below.
>=20
>        F_SETLK, F_SETLKW, and F_GETLK are used to acquire, release,  =
and
>        test for the existence of record locks (also known as byte-ran=
ge,
>        file-segment, or file-region locks).  The third  argument,  lo=
ck,
>        is  a  pointer  to  a  structure  that has at least the follow=
ing
>        fields (in unspecified order).
>=20
>            struct flock {
>                ...
>                short l_type;    /* Type of lock: F_RDLCK,
>                                    F_WRLCK, F_UNLCK */
>                short l_whence;  /* How to interpret l_start:
>                                    SEEK_SET, SEEK_CUR, SEEK_END */
>                off_t l_start;   /* Starting offset for lock */
>                off_t l_len;     /* Number of bytes to lock */
>                pid_t l_pid;     /* PID of process blocking our lock
>                                    (set by F_GETLK and F_OFD_GETLK) *=
/
>                ...
>            };
>=20
>        The l_whence, l_start, and l_len fields of this structure spec=
ify
>        the  range  of  bytes we wish to lock.  Bytes past the end of =
the
>        file may be locked, but not bytes before the start of the file=
=2E
>=20
>        l_start is the starting offset for the lock, and  is  interpre=
ted
>        relative  to  either:  the  start  of  the  file  (if l_whence=
 is
>        SEEK_SET); the current file offset (if l_whence is SEEK_CUR); =
 or
>        the  end of the file (if l_whence is SEEK_END).  In the final =
two
>        cases, l_start can be a negative number provided the offset  d=
oes
>        not lie before the start of the file.
>=20
>        l_len  specifies  the  number of bytes to be locked.  If l_len=
 is
>        positive, then the range to be locked covers bytes l_start up =
 to
>        and  including  l_start+l_len-1.   Specifying 0 for l_len has =
the
>        special meaning: lock all bytes starting at the  location  spe=
ci=E2=80=90
>        fied  by l_whence and l_start through to the end of file, no m=
at=E2=80=90
>        ter how large the file grows.
>=20
>        POSIX.1-2001 allows (but does not require) an  implementation =
 to
>        support  a negative l_len value; if l_len is negative, the int=
er=E2=80=90
>        val described by  lock  covers  bytes  l_start+l_len  up  to  =
and
>        including  l_start-1.   This  is  supported by Linux since ker=
nel
>        versions 2.4.21 and 2.5.49.
>=20
>        The l_type field can be used to place a read (F_RDLCK) or a wr=
ite
>        (F_WRLCK)  lock  on  a  file.  Any number of processes may hol=
d a
>        read lock (shared lock) on a file region, but  only  one  proc=
ess
>        may  hold  a  write  lock  (exclusive  lock).   An exclusive l=
ock
>        excludes all other locks, both shared and  exclusive.   A  sin=
gle
>        process can hold only one type of lock on a file region; if a =
new
>        lock is applied to an already-locked region,  then  the  exist=
ing
>        lock  is  converted  to the new lock type.  (Such conversions =
may
>        involve splitting, shrinking, or coalescing with an existing l=
ock
>        if  the  byte  range specified by the new lock does not precis=
ely
>        coincide with the range of the existing lock.)
>=20
>        F_SETLK (struct flock *)
>               Acquire a lock (when l_type  is  F_RDLCK  or  F_WRLCK) =
 or
>               release a lock (when l_type is F_UNLCK) on the bytes sp=
ec=E2=80=90
>               ified by the l_whence, l_start, and l_len fields of  lo=
ck.
>               If  a  conflicting  lock  is held by another process, t=
his
>               call returns -1 and sets errno to EACCES or EAGAIN.
>=20
>        F_SETLKW (struct flock *)
>               As for F_SETLK, but if a conflicting lock is held  on  =
the
>               file, then wait for that lock to be released.  If a sig=
nal
>               is caught while waiting, then the call is interrupted  =
and
>               (after  the  signal  handler has returned) returns imme=
di=E2=80=90
>               ately (with return value -1 and errno set  to  EINTR;  =
see
>               signal(7)).
>=20
>        F_GETLK (struct flock *)
>               On input to this call, lock describes a lock we would l=
ike
>               to place on the  file.   If  the  lock  could  be  plac=
ed,
>               fcntl() does not actually place it, but returns F_UNLCK=
 in
>               the l_type field of lock and leaves the  other  fields =
 of
>               the structure unchanged.
>=20
>               If  one or more incompatible locks would prevent this l=
ock
>               being placed, then fcntl() returns details  about  one =
 of
>               these  locks  in  the l_type, l_whence, l_start, and l_=
len
>               fields of lock.  If the conflicting lock is a  traditio=
nal
>               (process-associated)  record lock, then the l_pid field=
 is
>               set to the PID of the process holding that lock.   If  =
the
>               conflicting  lock  is  an open file description lock, t=
hen
>               l_pid is set to -1.  Note that  the  returned  informat=
ion
>               may already be out of date by the time the caller inspe=
cts
>               it.
>=20
>        In order to place a read lock, fd must be open for  reading.  =
 In
>        order  to  place  a  write lock, fd must be open for writing. =
 To
>        place both types of lock, open a file read-write.
>=20
>        As well as being removed by an explicit F_UNLCK, record locks =
are
>        automatically released when the process terminates.
>=20
>        Record  locks  are  not inherited by a child created via fork(=
2),
>        but are preserved across an execve(2).
>=20
>        Because of the buffering performed by the stdio(3)  library,  =
the
>        use  of  record  locking  with routines in that package should=
 be
>        avoided; use read(2) and write(2) instead.
>=20
> #      The record locks described above are associated with the  proc=
ess
> #      (unlike  the  open file description locks described below).  T=
his
> #      has some unfortunate consequences:
>=20
> #      *  If a process holding a lock on a file closes any file descr=
ip=E2=80=90
> #         tor  referring to the file, then all of the process's locks=
 on
> #         the file are released, no matter which  file  descriptor  t=
hey
> #         were  obtained  via.  This is bad: it means that a process =
can
> #         lose its locks on a file such as /etc/passwd or /etc/mtab w=
hen
> #         for  some reason a library function decides to open, read, =
and
> #         close the same file.
>=20
> #      *  The threads in a process share locks.  In other words, a  m=
ul=E2=80=90
> #         tithreaded  program  can't  use  record locking to ensure t=
hat
> #         threads don't simultaneously access the same region of a fi=
le.
>=20
> #      Open file description locks solve both of these problems.
>=20
>    Open file description locks (non-POSIX)
> #      Open file description locks are advisory byte-range  locks  wh=
ose
> #      operation is in most respects identical to the traditional rec=
ord
> #      locks described above.  This lock  type  is  Linux-specific,  =
and
> #      available since Linux 3.15.
>=20
> #      The  principal  difference  between  the  two  lock types is t=
hat
> #      whereas traditional record locks are associated with  a  proce=
ss,
> #      open  file  description  locks  are associated with the open f=
ile
> #      description on which they are acquired, much like locks  acqui=
red
> #      with  flock(2).   Consequently  (and  unlike traditional advis=
ory
> #      record locks), open file description locks are  inherited  acr=
oss
> #      fork(2)  (and  clone(2) with CLONE_FILES), and are only automa=
ti=E2=80=90
> #      cally released on the last close of the  open  file  descripti=
on,
> #      instead of being released on any close of the file.
>=20
>        Open  file  description  locks  always  conflict with traditio=
nal
>        record locks, even when they are acquired by the same process =
 on
>        the same file descriptor.
>=20
> #      Open  file  description  locks  placed  via  the  same  open f=
ile
> #      description (i.e., via the same file descriptor, or via a  dup=
li=E2=80=90
> #      cate  of the file descriptor created by fork(2), dup(2), fcntl=
(2)
> #      F_DUPFD, and so on) are always  compatible:  if  a  new  lock =
 is
> #      placed  on  an  already  locked region, then the existing lock=
 is
> #      converted to the new lock type.  (Such conversions may result =
 in
> #      splitting, shrinking, or coalescing with an existing lock as d=
is=E2=80=90
> #      cussed above.)
>=20
> #      On the other hand, open file description locks may conflict  w=
ith
> #      each  other  when  they  are  acquired  via  different  open f=
ile
> #      descriptions.  Thus, the threads in a multithreaded  program  =
can
> #      use  open  file description locks to synchronize access to a f=
ile
> #      region by having each thread perform its own open(2) on the  f=
ile
> #      and applying locks via the resulting file descriptor.
>=20
>        As  with  traditional  advisory  locks,  the  third  argument =
 to
>        fcntl(), lock, is a pointer to an flock structure.   By  contr=
ast
>        with  traditional record locks, the l_pid field of that struct=
ure
>        must be set to zero when using the commands described below.
>=20
>        The commands for working with open  file  description  locks  =
are
>        analogous to those used with traditional locks:
>=20
>        F_OFD_SETLK (struct flock *)
>               Acquire  an  open  file  description  lock (when l_type=
 is
>               F_RDLCK or F_WRLCK) or release an  open  file  descript=
ion
>               lock  (when  l_type  is F_UNLCK) on the bytes specified=
 by
>               the l_whence, l_start, and l_len fields  of  lock.   If=
  a
>               conflicting  lock  is  held  by another process, this c=
all
>               returns -1 and sets errno to EACCES or EAGAIN.
>=20
>        F_OFD_SETLKW (struct flock *)
>               As for F_OFD_SETLK, but if a conflicting lock is  held =
 on
>               the  file,  then  wait for that lock to be released.  I=
f a
>               signal is caught while waiting, then the  call  is  int=
er=E2=80=90
>               rupted and (after the signal handler has returned) retu=
rns
>               immediately (with return value -1 and errno set to  EIN=
TR;
>               see signal(7)).
>=20
>        F_OFD_GETLK (struct flock *)
>               On  input  to  this  call,  lock  describes  an  open f=
ile
>               description lock we would like to place on the  file.  =
 If
>               the  lock could be placed, fcntl() does not actually pl=
ace
>               it, but returns F_UNLCK in the l_type field  of  lock  =
and
>               leaves  the  other  fields of the structure unchanged. =
 If
>               one or more incompatible locks  would  prevent  this  l=
ock
>               being  placed,  then  details about one of these locks =
are
>               returned via lock, as described above for F_GETLK.
>=20
>    Mandatory locking
>        Warning: the Linux implementation of mandatory locking is unre=
li=E2=80=90
>        able.  See BUGS below.
>=20
> #      By  default,  both traditional (process-associated) and open f=
ile
> #      description record locks are advisory.  Advisory  locks  are  =
not
> #      enforced and are useful only between cooperating processes.
>=20
>        Both  lock  types  can  also  be  mandatory.  Mandatory locks =
are
>        enforced for all processes.  If a process  tries  to  perform =
 an
>        incompatible  access (e.g., read(2) or write(2)) on a file reg=
ion
>        that has an incompatible mandatory lock, then the result  depe=
nds
>        upon  whether  the  O_NONBLOCK  flag is enabled for its open f=
ile
>        description.  If the O_NONBLOCK flag is  not  enabled,  then  =
the
>        system  call is blocked until the lock is removed or converted=
 to
>        a mode that is compatible with the  access.   If  the  O_NONBL=
OCK
>        flag  is  enabled,  then  the  system  call  fails with the er=
ror
>        EAGAIN.
>=20
>        To make use of mandatory locks, mandatory locking must be enab=
led
>        both  on  the filesystem that contains the file to be locked, =
and
>        on the file itself.  Mandatory locking is enabled on a filesys=
tem
>        using  the  "-o mand" option to mount(8), or the MS_MANDLOCK f=
lag
>        for mount(2).  Mandatory locking is enabled on  a  file  by  d=
is=E2=80=90
>        abling group execute permission on the file and enabling the s=
et-
>        group-ID permission bit (see chmod(1) and chmod(2)).
>=20
>        Mandatory locking is not specified by POSIX.  Some other  syst=
ems
>        also  support  mandatory  locking, although the details of how=
 to
>        enable it vary across systems.
>=20
>   RETURN VALUE
>        For a successful call, the return value depends on the operati=
on:
>=20
>        F_DUPFD  The new descriptor.
>=20
>        F_GETFD  Value of file descriptor flags.
>=20
>        F_GETFL  Value of file status flags.
>=20
>        F_GETLEASE
>                 Type of lease held on file descriptor.
>=20
>        F_GETOWN Value of descriptor owner.
>=20
>        F_GETSIG Value  of  signal sent when read or write becomes pos=
si=E2=80=90
>                 ble, or zero for traditional SIGIO behavior.
>=20
>        F_GETPIPE_SZ
>                 The pipe capacity.
>=20
> #      All other commands
> #               Zero.
>=20
> #      On error, -1 is returned, and errno is set appropriately.
>=20
>   ERRORS
>   [...]
>=20
> #      EINVAL cmd is  F_OFD_SETLK,  F_OFD_SETLKW,  or  F_OFD_GETLK,  =
and
> #             l_pid was not specified as zero.
>=20
>   [...]
>=20
>   CONFORMING TO
>   [...]
>        F_OFD_SETLK, F_OFD_SETLKW, and  F_OFD_GETLK  are  Linux-specif=
ic,
>        but  work is being done to have them included in the next vers=
ion
>        of POSIX.1.
> $ vi f
> f =3D=3D> /hdd/backup/home/mtk/man-pages/man-pages/man2/f/2014-04-30_=
12:44:55
>=20
> $ cat f
>   DESCRIPTION
>   [...]
>=20
>    Advisory record locking
> #      Linux  implements  traditional ("process-associated") UNIX rec=
ord
> #      locks, as standardized by POSIX.  For a  Linux-specific  alter=
na=E2=80=90
> #      tive  with  better  semantics,  see  the  discussion of open f=
ile
> #      description locks below.
>=20
>        F_SETLK, F_SETLKW, and F_GETLK are used to acquire, release,  =
and
>        test for the existence of record locks (also known as byte-ran=
ge,
>        file-segment, or file-region locks).  The third  argument,  lo=
ck,
>        is  a  pointer  to  a  structure  that has at least the follow=
ing
>        fields (in unspecified order).
>=20
>            struct flock {
>                ...
>                short l_type;    /* Type of lock: F_RDLCK,
>                                    F_WRLCK, F_UNLCK */
>                short l_whence;  /* How to interpret l_start:
>                                    SEEK_SET, SEEK_CUR, SEEK_END */
>                off_t l_start;   /* Starting offset for lock */
>                off_t l_len;     /* Number of bytes to lock */
>                pid_t l_pid;     /* PID of process blocking our lock
>                                    (set by F_GETLK and F_OFD_GETLK) *=
/
>                ...
>            };
>=20
>        The l_whence, l_start, and l_len fields of this structure spec=
ify
>        the  range  of  bytes we wish to lock.  Bytes past the end of =
the
>        file may be locked, but not bytes before the start of the file=
=2E
>=20
>        l_start is the starting offset for the lock, and  is  interpre=
ted
>        relative  to  either:  the  start  of  the  file  (if l_whence=
 is
>        SEEK_SET); the current file offset (if l_whence is SEEK_CUR); =
 or
>        the  end of the file (if l_whence is SEEK_END).  In the final =
two
>        cases, l_start can be a negative number provided the offset  d=
oes
>        not lie before the start of the file.
>=20
>        l_len  specifies  the  number of bytes to be locked.  If l_len=
 is
>        positive, then the range to be locked covers bytes l_start up =
 to
>        and  including  l_start+l_len-1.   Specifying 0 for l_len has =
the
>        special meaning: lock all bytes starting at the  location  spe=
ci=E2=80=90
>        fied  by l_whence and l_start through to the end of file, no m=
at=E2=80=90
>        ter how large the file grows.
>=20
>        POSIX.1-2001 allows (but does not require) an  implementation =
 to
>        support  a negative l_len value; if l_len is negative, the int=
er=E2=80=90
>        val described by  lock  covers  bytes  l_start+l_len  up  to  =
and
>        including  l_start-1.   This  is  supported by Linux since ker=
nel
>        versions 2.4.21 and 2.5.49.
>=20
>        The l_type field can be used to place a read (F_RDLCK) or a wr=
ite
>        (F_WRLCK)  lock  on  a  file.  Any number of processes may hol=
d a
>        read lock (shared lock) on a file region, but  only  one  proc=
ess
>        may  hold  a  write  lock  (exclusive  lock).   An exclusive l=
ock
>        excludes all other locks, both shared and  exclusive.   A  sin=
gle
>        process can hold only one type of lock on a file region; if a =
new
>        lock is applied to an already-locked region,  then  the  exist=
ing
>        lock  is  converted  to the new lock type.  (Such conversions =
may
>        involve splitting, shrinking, or coalescing with an existing l=
ock
>        if  the  byte  range specified by the new lock does not precis=
ely
>        coincide with the range of the existing lock.)
>=20
>        F_SETLK (struct flock *)
>               Acquire a lock (when l_type  is  F_RDLCK  or  F_WRLCK) =
 or
>               release a lock (when l_type is F_UNLCK) on the bytes sp=
ec=E2=80=90
>               ified by the l_whence, l_start, and l_len fields of  lo=
ck.
>               If  a  conflicting  lock  is held by another process, t=
his
>               call returns -1 and sets errno to EACCES or EAGAIN.
>=20
>        F_SETLKW (struct flock *)
>               As for F_SETLK, but if a conflicting lock is held  on  =
the
>               file, then wait for that lock to be released.  If a sig=
nal
>               is caught while waiting, then the call is interrupted  =
and
>               (after  the  signal  handler has returned) returns imme=
di=E2=80=90
>               ately (with return value -1 and errno set  to  EINTR;  =
see
>               signal(7)).
>=20
>        F_GETLK (struct flock *)
>               On input to this call, lock describes a lock we would l=
ike
>               to place on the  file.   If  the  lock  could  be  plac=
ed,
>               fcntl() does not actually place it, but returns F_UNLCK=
 in
>               the l_type field of lock and leaves the  other  fields =
 of
>               the structure unchanged.
>=20
>               If  one or more incompatible locks would prevent this l=
ock
>               being placed, then fcntl() returns details  about  one =
 of
>               these  locks  in  the l_type, l_whence, l_start, and l_=
len
>               fields of lock.  If the conflicting lock is a  traditio=
nal
>               (process-associated)  record lock, then the l_pid field=
 is
>               set to the PID of the process holding that lock.   If  =
the
>               conflicting  lock  is  an open file description lock, t=
hen
>               l_pid is set to -1.  Note that  the  returned  informat=
ion
>               may already be out of date by the time the caller inspe=
cts
>               it.
>=20
>        In order to place a read lock, fd must be open for  reading.  =
 In
>        order  to  place  a  write lock, fd must be open for writing. =
 To
>        place both types of lock, open a file read-write.
>=20
>        As well as being removed by an explicit F_UNLCK, record locks =
are
>        automatically released when the process terminates.
>=20
>        Record  locks  are  not inherited by a child created via fork(=
2),
>        but are preserved across an execve(2).
>=20
>        Because of the buffering performed by the stdio(3)  library,  =
the
>        use  of  record  locking  with routines in that package should=
 be
>        avoided; use read(2) and write(2) instead.
>=20
> #      The record locks described above are associated with the  proc=
ess
> #      (unlike  the  open file description locks described below).  T=
his
> #      has some unfortunate consequences:
>=20
> #      *  If a process holding a lock on a file closes any file descr=
ip=E2=80=90
> #         tor  referring to the file, then all of the process's locks=
 on
> #         the file are released, no matter which  file  descriptor  t=
hey
> #         were  obtained  via.  This is bad: it means that a process =
can

"were obtained via" is a little awkward. How about "regardless of which
file descriptor on which they were obtained".

> #         lose its locks on a file such as /etc/passwd or /etc/mtab w=
hen
> #         for  some reason a library function decides to open, read, =
and
> #         close the same file.
>=20
> #      *  The threads in a process share locks.  In other words, a  m=
ul=E2=80=90
> #         tithreaded  program  can't  use  record locking to ensure t=
hat
> #         threads don't simultaneously access the same region of a fi=
le.
>=20
> #      Open file description locks solve both of these problems.
>=20
>    Open file description locks (non-POSIX)
> #      Open file description locks are advisory byte-range  locks  wh=
ose
> #      operation is in most respects identical to the traditional rec=
ord
> #      locks described above.  This lock  type  is  Linux-specific,  =
and
> #      available since Linux 3.15.
>=20
> #      The  principal  difference  between  the  two  lock types is t=
hat
> #      whereas traditional record locks are associated with  a  proce=
ss,
> #      open  file  description  locks  are associated with the open f=
ile
> #      description on which they are acquired, much like locks  acqui=
red
> #      with  flock(2).   Consequently  (and  unlike traditional advis=
ory
> #      record locks), open file description locks are  inherited  acr=
oss
> #      fork(2)  (and  clone(2) with CLONE_FILES), and are only automa=
ti=E2=80=90
> #      cally released on the last close of the  open  file  descripti=
on,
> #      instead of being released on any close of the file.
>=20
>        Open  file  description  locks  always  conflict with traditio=
nal
>        record locks, even when they are acquired by the same process =
 on
>        the same file descriptor.
>=20
> #      Open  file  description  locks  placed  via  the  same  open f=
ile
> #      description (i.e., via the same file descriptor, or via a  dup=
li=E2=80=90
> #      cate  of the file descriptor created by fork(2), dup(2), fcntl=
(2)
> #      F_DUPFD, and so on) are always  compatible:  if  a  new  lock =
 is
> #      placed  on  an  already  locked region, then the existing lock=
 is
> #      converted to the new lock type.  (Such conversions may result =
 in
> #      splitting, shrinking, or coalescing with an existing lock as d=
is=E2=80=90
> #      cussed above.)
>=20
> #      On the other hand, open file description locks may conflict  w=
ith
> #      each  other  when  they  are  acquired  via  different  open f=
ile
> #      descriptions.  Thus, the threads in a multithreaded  program  =
can
> #      use  open  file description locks to synchronize access to a f=
ile
> #      region by having each thread perform its own open(2) on the  f=
ile
> #      and applying locks via the resulting file descriptor.
>=20
>        As  with  traditional  advisory  locks,  the  third  argument =
 to
>        fcntl(), lock, is a pointer to an flock structure.   By  contr=
ast
>        with  traditional record locks, the l_pid field of that struct=
ure
>        must be set to zero when using the commands described below.
>=20
>        The commands for working with open  file  description  locks  =
are
>        analogous to those used with traditional locks:
>=20
>        F_OFD_SETLK (struct flock *)
>               Acquire  an  open  file  description  lock (when l_type=
 is
>               F_RDLCK or F_WRLCK) or release an  open  file  descript=
ion
>               lock  (when  l_type  is F_UNLCK) on the bytes specified=
 by
>               the l_whence, l_start, and l_len fields  of  lock.   If=
  a
>               conflicting  lock  is  held  by another process, this c=
all
>               returns -1 and sets errno to EACCES or EAGAIN.
>=20
>        F_OFD_SETLKW (struct flock *)
>               As for F_OFD_SETLK, but if a conflicting lock is  held =
 on
>               the  file,  then  wait for that lock to be released.  I=
f a
>               signal is caught while waiting, then the  call  is  int=
er=E2=80=90
>               rupted and (after the signal handler has returned) retu=
rns
>               immediately (with return value -1 and errno set to  EIN=
TR;
>               see signal(7)).
>=20
>        F_OFD_GETLK (struct flock *)
>               On  input  to  this  call,  lock  describes  an  open f=
ile
>               description lock we would like to place on the  file.  =
 If
>               the  lock could be placed, fcntl() does not actually pl=
ace
>               it, but returns F_UNLCK in the l_type field  of  lock  =
and
>               leaves  the  other  fields of the structure unchanged. =
 If
>               one or more incompatible locks  would  prevent  this  l=
ock
>               being  placed,  then  details about one of those locks =
are
>               returned via lock, as described above for F_GETLK.
>=20
>    Mandatory locking
>        Warning: the Linux implementation of mandatory locking is unre=
li=E2=80=90
>        able.  See BUGS below.
>=20
> #      By  default,  both traditional (process-associated) and open f=
ile
> #      description record locks are advisory.  Advisory  locks  are  =
not
> #      enforced and are useful only between cooperating processes.
>=20
>        Both  lock  types  can  also  be  mandatory.  Mandatory locks =
are
>        enforced for all processes.  If a process  tries  to  perform =
 an
>        incompatible  access (e.g., read(2) or write(2)) on a file reg=
ion
>        that has an incompatible mandatory lock, then the result  depe=
nds
>        upon  whether  the  O_NONBLOCK  flag is enabled for its open f=
ile
>        description.  If the O_NONBLOCK flag is  not  enabled,  then  =
the
>        system  call is blocked until the lock is removed or converted=
 to
>        a mode that is compatible with the  access.   If  the  O_NONBL=
OCK
>        flag  is  enabled,  then  the  system  call  fails with the er=
ror
>        EAGAIN.
>=20
>        To make use of mandatory locks, mandatory locking must be enab=
led
>        both  on  the filesystem that contains the file to be locked, =
and
>        on the file itself.  Mandatory locking is enabled on a filesys=
tem
>        using  the  "-o mand" option to mount(8), or the MS_MANDLOCK f=
lag
>        for mount(2).  Mandatory locking is enabled on  a  file  by  d=
is=E2=80=90
>        abling group execute permission on the file and enabling the s=
et-
>        group-ID permission bit (see chmod(1) and chmod(2)).
>=20
>        Mandatory locking is not specified by POSIX.  Some other  syst=
ems
>        also  support  mandatory  locking, although the details of how=
 to
>        enable it vary across systems.
>=20
>   [...]
>=20
>   RETURN VALUE
>        For a successful call, the return value depends on the operati=
on:
>=20
>        F_DUPFD  The new descriptor.
>=20
>        F_GETFD  Value of file descriptor flags.
>=20
>        F_GETFL  Value of file status flags.
>=20
>        F_GETLEASE
>                 Type of lease held on file descriptor.
>=20
>        F_GETOWN Value of descriptor owner.
>=20
>        F_GETSIG Value  of  signal sent when read or write becomes pos=
si=E2=80=90
>                 ble, or zero for traditional SIGIO behavior.
>=20
>        F_GETPIPE_SZ
>                 The pipe capacity.
>=20
> #      All other commands
> #               Zero.
>=20
> #      On error, -1 is returned, and errno is set appropriately.
>=20
>   ERRORS
>   [...]
>=20
> #      EINVAL cmd is  F_OFD_SETLK,  F_OFD_SETLKW,  or  F_OFD_GETLK,  =
and
> #             l_pid was not specified as zero.
>=20

The kernel will also return -EINVAL if it doesn't recognize the cmd
value being passed in. It may be worth mentioning that as well as
that's the best mechanism to tell whether the kernel actually supports
OFD locks.

>   [...]
>=20
>   CONFORMING TO
>   [...]
> #      F_OFD_SETLK, F_OFD_SETLKW, and  F_OFD_GETLK  are  Linux-specif=
ic,
> #      but  work is being done to have them included in the next vers=
ion
> #      of POSIX.1.
>=20
>=20
> Cheers,
>=20
> Michael
>=20
>=20

Other than the two nits above, this looks great.

Thanks!
--=20
Jeff Layton <jlayton@poochiereds.net>
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
