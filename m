From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages v1] fcntl.2: update manpage with verbiage about
 open file description locks
Date: Wed, 30 Apr 2014 12:50:23 +0200
Message-ID: <5360D56F.4070509@gmail.com>
References: <1398797474-744-1-git-send-email-jlayton@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398797474-744-1-git-send-email-jlayton@poochiereds.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@poochiereds.net>
Cc: mtk.manpages@gmail.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

[CC +=3D linux-man]

Jeff,

Thanks very much for writing this patch!

I've taken your patch into a branch and add a number of details. I have=
=20
one or two questions below.

On 04/29/2014 08:51 PM, Jeff Layton wrote:
> Signed-off-by: Jeff Layton <jlayton@poochiereds.net>
> ---
>  man2/fcntl.2 | 112 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++--
>  1 file changed, 109 insertions(+), 3 deletions(-)
>=20
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index d0154a6d9f42..8d119dfec24c 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -191,6 +191,9 @@ and
>  .BR O_SYNC
>  flags; see BUGS, below.
>  .SS Advisory locking
> +This section describes traditional POSIX record locks. Also see the =
section on
> +open file description locks below.
> +.PP
>  .BR F_SETLK ,
>  .BR F_SETLKW ,
>  and
> @@ -213,7 +216,8 @@ struct flock {
>      off_t l_start;   /* Starting offset for lock */
>      off_t l_len;     /* Number of bytes to lock */
>      pid_t l_pid;     /* PID of process blocking our lock
> -                        (F_GETLK only) */
> +                        (returned for F_GETLK and F_OFD_GETLK only. =
Set
> +                         to 0 for open file description locks) */
>      ...
>  };
>  .fi
> @@ -349,9 +353,13 @@ returns details about one of these locks in the
>  .IR l_type ", " l_whence ", " l_start ", and " l_len
>  fields of
>  .I lock
> -and sets
> +.
> +If the conflicting lock is a traditional POSIX lock, then the
> +.I l_pid
> +to be the PID of the process holding that lock. If the
> +conflicting lock is an open file description lock, then the
>  .I l_pid
> -to be the PID of the process holding that lock.
> +will be set to \-1.
>  Note that the information returned by
>  .BR F_GETLK
>  may already be out of date by the time the caller inspects it.
> @@ -394,6 +402,104 @@ should be avoided; use
>  and
>  .BR write (2)
>  instead.
> +.SS Open file description locks (non-POSIX)
> +.BR F_OFD_GETLK ", " F_OFD_SETLK " and  " F_OFD_SETLKW
> +are used to acquire, release and test open file description record l=
ocks.
> +These are byte-range locks that work identically to the traditional =
advisory
> +record locks described above, but are associated with the open file =
description
> +on which they were acquired rather than the process, much like locks=
 acquired
> +with
> +.BR flock (2)
> +.
> +.PP
> +Unlike traditional advisory record locks, these locks are inherited
> +across
> +.BR fork (2)
> +and
> +.BR clone (2)
> +with
> +.BR CLONE_FILES
> +and are only released on the last close of the open file description=
 instead
> +of being released on any close of the file.
> +.PP
> +Open file description locks always conflict with traditional record =
locks,
> +even when they are acquired by the same process on the same file des=
criptor.
> +They only conflict with each other when they are acquired on differe=
nt
> +open file descriptions.
> +.PP
> +Note that in contrast to traditional record locks, the
> +.I flock
> +structure passed in as an argument to the open file description lock=
 commands
> +must have the
> +.I l_pid
> +value set to 0.

In ERRORS, I added EINVAL for this case.

> +.TP
> +.BR F_OFD_SETLK " (\fIstruct flock *\fP)"
> +Acquire an open file description lock (when
> +.I l_type
> +is
> +.B F_RDLCK
> +or
> +.BR F_WRLCK )
> +or release an open file description lock (when
> +.I l_type
> +is
> +.BR F_UNLCK )
> +on the bytes specified by the
> +.IR l_whence ", " l_start ", and " l_len
> +fields of
> +.IR lock .
> +If a conflicting lock is held by another process,
> +this call returns \-1 and sets
> +.I errno
> +to
> +.B EACCES
> +or
> +.BR EAGAIN .

The "EACCES or EAGAIN" thing comes from POSIX, because different=20
implementations of tradition record locks returned one of these errors.=
=20
So, portable applications using traditional locks must handle either=20
possibility. However, that argument doesn't apply for these new locks.=20
Surely, we just want to say "set errno to EAGAIN" for this case?

> +.TP
> +.BR F_OFD_SETLKW " (\fIstruct flock *\fP)"
> +As for
> +.BR F_OFD_SETLK ,
> +but if a conflicting lock is held on the file, then wait for that lo=
ck to be
> +released. If a signal is caught while waiting, then the call is inte=
rrupted
> +and (after the signal handler has returned) returns immediately (wit=
h return
> +value \-1 and
> +.I errno
> +set to
> +.BR EINTR ;
> +see
> +.BR signal (7)).
> +.TP
> +.BR F_OFD_GETLK " (\fIstruct flock *\fP)"
> +On input to this call,
> +.I lock
> +describes an open file description lock we would like to place on th=
e file.
> +If the lock could be placed,
> +.BR fcntl ()
> +does not actually place it, but returns
> +.B F_UNLCK
> +in the
> +.I l_type
> +field of
> +.I lock
> +and leaves the other fields of the structure unchanged.
> +If one or more incompatible locks would prevent
> +this lock being placed, then
> +.BR fcntl ()
> +returns details about one of these locks in the
> +.IR l_type ", " l_whence ", " l_start ", and " l_len
> +fields of
> +.I lock
> +.
> +If the conflicting lock is a process-associated record lock, then th=
e
> +.I l_pid
> +will be set to the PID of the process holding that lock. If the
> +conflicting lock is an open file description lock, then the
> +.I l_pid
> +will be set to -1 to indicate that it is not associated with a proce=
ss.
> +Note that the information returned by
> +.BR F_OFD_GETLK
> +may already be out of date by the time the caller inspects it.
>  .SS Mandatory locking
>  (Non-POSIX.)
>  The above record locks may be either advisory or mandatory,

Based on some past conversations, I added a number of details
to the page, and also reworked your text a little to eliminate some=20
of the redundancy with the discussion of traditional locks. Below,
I've reproduced all of the relevant pieces from the current draft
(including the existing text on traditional locks). Could I ask
you to take a look at the pieces marked with '#' in column 1
(which are places where I either tweaked your text significantly,
or added details) and let me know if it looks okay.

  DESCRIPTION
   Advisory record locking
#      Linux  implements  traditional ("process-associated") UNIX recor=
d
#      locks, as standardized by POSIX.  For a  Linux-specific  alterna=
=E2=80=90
#      tive  with  better  semantics,  see  the  discussion of open fil=
e
#      description locks below.

       F_SETLK, F_SETLKW, and F_GETLK are used to acquire, release,  an=
d
       test for the existence of record locks (also known as byte-range=
,
       file-segment, or file-region locks).  The third  argument,  lock=
,
       is  a  pointer  to  a  structure  that has at least the followin=
g
       fields (in unspecified order).

           struct flock {
               ...
               short l_type;    /* Type of lock: F_RDLCK,
                                   F_WRLCK, F_UNLCK */
               short l_whence;  /* How to interpret l_start:
                                   SEEK_SET, SEEK_CUR, SEEK_END */
               off_t l_start;   /* Starting offset for lock */
               off_t l_len;     /* Number of bytes to lock */
               pid_t l_pid;     /* PID of process blocking our lock
                                   (set by F_GETLK and F_OFD_GETLK) */
               ...
           };

       The l_whence, l_start, and l_len fields of this structure specif=
y
       the  range  of  bytes we wish to lock.  Bytes past the end of th=
e
       file may be locked, but not bytes before the start of the file.

       l_start is the starting offset for the lock, and  is  interprete=
d
       relative  to  either:  the  start  of  the  file  (if l_whence i=
s
       SEEK_SET); the current file offset (if l_whence is SEEK_CUR);  o=
r
       the  end of the file (if l_whence is SEEK_END).  In the final tw=
o
       cases, l_start can be a negative number provided the offset  doe=
s
       not lie before the start of the file.

       l_len  specifies  the  number of bytes to be locked.  If l_len i=
s
       positive, then the range to be locked covers bytes l_start up  t=
o
       and  including  l_start+l_len-1.   Specifying 0 for l_len has th=
e
       special meaning: lock all bytes starting at the  location  speci=
=E2=80=90
       fied  by l_whence and l_start through to the end of file, no mat=
=E2=80=90
       ter how large the file grows.

       POSIX.1-2001 allows (but does not require) an  implementation  t=
o
       support  a negative l_len value; if l_len is negative, the inter=
=E2=80=90
       val described by  lock  covers  bytes  l_start+l_len  up  to  an=
d
       including  l_start-1.   This  is  supported by Linux since kerne=
l
       versions 2.4.21 and 2.5.49.

       The l_type field can be used to place a read (F_RDLCK) or a writ=
e
       (F_WRLCK)  lock  on  a  file.  Any number of processes may hold =
a
       read lock (shared lock) on a file region, but  only  one  proces=
s
       may  hold  a  write  lock  (exclusive  lock).   An exclusive loc=
k
       excludes all other locks, both shared and  exclusive.   A  singl=
e
       process can hold only one type of lock on a file region; if a ne=
w
       lock is applied to an already-locked region,  then  the  existin=
g
       lock  is  converted  to the new lock type.  (Such conversions ma=
y
       involve splitting, shrinking, or coalescing with an existing loc=
k
       if  the  byte  range specified by the new lock does not precisel=
y
       coincide with the range of the existing lock.)

       F_SETLK (struct flock *)
              Acquire a lock (when l_type  is  F_RDLCK  or  F_WRLCK)  o=
r
              release a lock (when l_type is F_UNLCK) on the bytes spec=
=E2=80=90
              ified by the l_whence, l_start, and l_len fields of  lock=
=2E
              If  a  conflicting  lock  is held by another process, thi=
s
              call returns -1 and sets errno to EACCES or EAGAIN.

       F_SETLKW (struct flock *)
              As for F_SETLK, but if a conflicting lock is held  on  th=
e
              file, then wait for that lock to be released.  If a signa=
l
              is caught while waiting, then the call is interrupted  an=
d
              (after  the  signal  handler has returned) returns immedi=
=E2=80=90
              ately (with return value -1 and errno set  to  EINTR;  se=
e
              signal(7)).

       F_GETLK (struct flock *)
              On input to this call, lock describes a lock we would lik=
e
              to place on the  file.   If  the  lock  could  be  placed=
,
              fcntl() does not actually place it, but returns F_UNLCK i=
n
              the l_type field of lock and leaves the  other  fields  o=
f
              the structure unchanged.

              If  one or more incompatible locks would prevent this loc=
k
              being placed, then fcntl() returns details  about  one  o=
f
              these  locks  in  the l_type, l_whence, l_start, and l_le=
n
              fields of lock.  If the conflicting lock is a  traditiona=
l
              (process-associated)  record lock, then the l_pid field i=
s
              set to the PID of the process holding that lock.   If  th=
e
              conflicting  lock  is  an open file description lock, the=
n
              l_pid is set to -1.  Note that  the  returned  informatio=
n
              may already be out of date by the time the caller inspect=
s
              it.

       In order to place a read lock, fd must be open for  reading.   I=
n
       order  to  place  a  write lock, fd must be open for writing.  T=
o
       place both types of lock, open a file read-write.

       As well as being removed by an explicit F_UNLCK, record locks ar=
e
       automatically released when the process terminates.

       Record  locks  are  not inherited by a child created via fork(2)=
,
       but are preserved across an execve(2).

       Because of the buffering performed by the stdio(3)  library,  th=
e
       use  of  record  locking  with routines in that package should b=
e
       avoided; use read(2) and write(2) instead.

#      The record locks described above are associated with the  proces=
s
#      (unlike  the  open file description locks described below).  Thi=
s
#      has some unfortunate consequences:

#      *  If a process holding a lock on a file closes any file descrip=
=E2=80=90
#         tor  referring to the file, then all of the process's locks o=
n
#         the file are released, no matter which  file  descriptor  the=
y
#         were  obtained  via.  This is bad: it means that a process ca=
n
#         lose its locks on a file such as /etc/passwd or /etc/mtab whe=
n
#         for  some reason a library function decides to open, read, an=
d
#         close the same file.

#      *  The threads in a process share locks.  In other words, a  mul=
=E2=80=90
#         tithreaded  program  can't  use  record locking to ensure tha=
t
#         threads don't simultaneously access the same region of a file=
=2E

#      Open file description locks solve both of these problems.

   Open file description locks (non-POSIX)
#      Open file description locks are advisory byte-range  locks  whos=
e
#      operation is in most respects identical to the traditional recor=
d
#      locks described above.  This lock  type  is  Linux-specific,  an=
d
#      available since Linux 3.15.

#      The  principal  difference  between  the  two  lock types is tha=
t
#      whereas traditional record locks are associated with  a  process=
,
#      open  file  description  locks  are associated with the open fil=
e
#      description on which they are acquired, much like locks  acquire=
d
#      with  flock(2).   Consequently  (and  unlike traditional advisor=
y
#      record locks), open file description locks are  inherited  acros=
s
#      fork(2)  (and  clone(2) with CLONE_FILES), and are only automati=
=E2=80=90
#      cally released on the last close of the  open  file  description=
,
#      instead of being released on any close of the file.

       Open  file  description  locks  always  conflict with traditiona=
l
       record locks, even when they are acquired by the same process  o=
n
       the same file descriptor.

#      Open  file  description  locks  placed  via  the  same  open fil=
e
#      description (i.e., via the same file descriptor, or via a  dupli=
=E2=80=90
#      cate  of the file descriptor created by fork(2), dup(2), fcntl(2=
)
#      F_DUPFD, and so on) are always  compatible:  if  a  new  lock  i=
s
#      placed  on  an  already  locked region, then the existing lock i=
s
#      converted to the new lock type.  (Such conversions may result  i=
n
#      splitting, shrinking, or coalescing with an existing lock as dis=
=E2=80=90
#      cussed above.)

#      On the other hand, open file description locks may conflict  wit=
h
#      each  other  when  they  are  acquired  via  different  open fil=
e
#      descriptions.  Thus, the threads in a multithreaded  program  ca=
n
#      use  open  file description locks to synchronize access to a fil=
e
#      region by having each thread perform its own open(2) on the  fil=
e
#      and applying locks via the resulting file descriptor.

       As  with  traditional  advisory  locks,  the  third  argument  t=
o
       fcntl(), lock, is a pointer to an flock structure.   By  contras=
t
       with  traditional record locks, the l_pid field of that structur=
e
       must be set to zero when using the commands described below.

       The commands for working with open  file  description  locks  ar=
e
       analogous to those used with traditional locks:

       F_OFD_SETLK (struct flock *)
              Acquire  an  open  file  description  lock (when l_type i=
s
              F_RDLCK or F_WRLCK) or release an  open  file  descriptio=
n
              lock  (when  l_type  is F_UNLCK) on the bytes specified b=
y
              the l_whence, l_start, and l_len fields  of  lock.   If  =
a
              conflicting  lock  is  held  by another process, this cal=
l
              returns -1 and sets errno to EACCES or EAGAIN.

       F_OFD_SETLKW (struct flock *)
              As for F_OFD_SETLK, but if a conflicting lock is  held  o=
n
              the  file,  then  wait for that lock to be released.  If =
a
              signal is caught while waiting, then the  call  is  inter=
=E2=80=90
              rupted and (after the signal handler has returned) return=
s
              immediately (with return value -1 and errno set to  EINTR=
;
              see signal(7)).

       F_OFD_GETLK (struct flock *)
              On  input  to  this  call,  lock  describes  an  open fil=
e
              description lock we would like to place on the  file.   I=
f
              the  lock could be placed, fcntl() does not actually plac=
e
              it, but returns F_UNLCK in the l_type field  of  lock  an=
d
              leaves  the  other  fields of the structure unchanged.  I=
f
              one or more incompatible locks  would  prevent  this  loc=
k
              being  placed,  then  details about one of these locks ar=
e
              returned via lock, as described above for F_GETLK.

   Mandatory locking
       Warning: the Linux implementation of mandatory locking is unreli=
=E2=80=90
       able.  See BUGS below.

#      By  default,  both traditional (process-associated) and open fil=
e
#      description record locks are advisory.  Advisory  locks  are  no=
t
#      enforced and are useful only between cooperating processes.

       Both  lock  types  can  also  be  mandatory.  Mandatory locks ar=
e
       enforced for all processes.  If a process  tries  to  perform  a=
n
       incompatible  access (e.g., read(2) or write(2)) on a file regio=
n
       that has an incompatible mandatory lock, then the result  depend=
s
       upon  whether  the  O_NONBLOCK  flag is enabled for its open fil=
e
       description.  If the O_NONBLOCK flag is  not  enabled,  then  th=
e
       system  call is blocked until the lock is removed or converted t=
o
       a mode that is compatible with the  access.   If  the  O_NONBLOC=
K
       flag  is  enabled,  then  the  system  call  fails with the erro=
r
       EAGAIN.

       To make use of mandatory locks, mandatory locking must be enable=
d
       both  on  the filesystem that contains the file to be locked, an=
d
       on the file itself.  Mandatory locking is enabled on a filesyste=
m
       using  the  "-o mand" option to mount(8), or the MS_MANDLOCK fla=
g
       for mount(2).  Mandatory locking is enabled on  a  file  by  dis=
=E2=80=90
       abling group execute permission on the file and enabling the set=
-
       group-ID permission bit (see chmod(1) and chmod(2)).

       Mandatory locking is not specified by POSIX.  Some other  system=
s
       also  support  mandatory  locking, although the details of how t=
o
       enable it vary across systems.

  RETURN VALUE
       For a successful call, the return value depends on the operation=
:

       F_DUPFD  The new descriptor.

       F_GETFD  Value of file descriptor flags.

       F_GETFL  Value of file status flags.

       F_GETLEASE
                Type of lease held on file descriptor.

       F_GETOWN Value of descriptor owner.

       F_GETSIG Value  of  signal sent when read or write becomes possi=
=E2=80=90
                ble, or zero for traditional SIGIO behavior.

       F_GETPIPE_SZ
                The pipe capacity.

#      All other commands
#               Zero.

#      On error, -1 is returned, and errno is set appropriately.

  ERRORS
  [...]

#      EINVAL cmd is  F_OFD_SETLK,  F_OFD_SETLKW,  or  F_OFD_GETLK,  an=
d
#             l_pid was not specified as zero.

  [...]

  CONFORMING TO
  [...]
       F_OFD_SETLK, F_OFD_SETLKW, and  F_OFD_GETLK  are  Linux-specific=
,
       but  work is being done to have them included in the next versio=
n
       of POSIX.1.
$ vi f
f =3D=3D> /hdd/backup/home/mtk/man-pages/man-pages/man2/f/2014-04-30_12=
:44:55

$ cat f
  DESCRIPTION
  [...]

   Advisory record locking
#      Linux  implements  traditional ("process-associated") UNIX recor=
d
#      locks, as standardized by POSIX.  For a  Linux-specific  alterna=
=E2=80=90
#      tive  with  better  semantics,  see  the  discussion of open fil=
e
#      description locks below.

       F_SETLK, F_SETLKW, and F_GETLK are used to acquire, release,  an=
d
       test for the existence of record locks (also known as byte-range=
,
       file-segment, or file-region locks).  The third  argument,  lock=
,
       is  a  pointer  to  a  structure  that has at least the followin=
g
       fields (in unspecified order).

           struct flock {
               ...
               short l_type;    /* Type of lock: F_RDLCK,
                                   F_WRLCK, F_UNLCK */
               short l_whence;  /* How to interpret l_start:
                                   SEEK_SET, SEEK_CUR, SEEK_END */
               off_t l_start;   /* Starting offset for lock */
               off_t l_len;     /* Number of bytes to lock */
               pid_t l_pid;     /* PID of process blocking our lock
                                   (set by F_GETLK and F_OFD_GETLK) */
               ...
           };

       The l_whence, l_start, and l_len fields of this structure specif=
y
       the  range  of  bytes we wish to lock.  Bytes past the end of th=
e
       file may be locked, but not bytes before the start of the file.

       l_start is the starting offset for the lock, and  is  interprete=
d
       relative  to  either:  the  start  of  the  file  (if l_whence i=
s
       SEEK_SET); the current file offset (if l_whence is SEEK_CUR);  o=
r
       the  end of the file (if l_whence is SEEK_END).  In the final tw=
o
       cases, l_start can be a negative number provided the offset  doe=
s
       not lie before the start of the file.

       l_len  specifies  the  number of bytes to be locked.  If l_len i=
s
       positive, then the range to be locked covers bytes l_start up  t=
o
       and  including  l_start+l_len-1.   Specifying 0 for l_len has th=
e
       special meaning: lock all bytes starting at the  location  speci=
=E2=80=90
       fied  by l_whence and l_start through to the end of file, no mat=
=E2=80=90
       ter how large the file grows.

       POSIX.1-2001 allows (but does not require) an  implementation  t=
o
       support  a negative l_len value; if l_len is negative, the inter=
=E2=80=90
       val described by  lock  covers  bytes  l_start+l_len  up  to  an=
d
       including  l_start-1.   This  is  supported by Linux since kerne=
l
       versions 2.4.21 and 2.5.49.

       The l_type field can be used to place a read (F_RDLCK) or a writ=
e
       (F_WRLCK)  lock  on  a  file.  Any number of processes may hold =
a
       read lock (shared lock) on a file region, but  only  one  proces=
s
       may  hold  a  write  lock  (exclusive  lock).   An exclusive loc=
k
       excludes all other locks, both shared and  exclusive.   A  singl=
e
       process can hold only one type of lock on a file region; if a ne=
w
       lock is applied to an already-locked region,  then  the  existin=
g
       lock  is  converted  to the new lock type.  (Such conversions ma=
y
       involve splitting, shrinking, or coalescing with an existing loc=
k
       if  the  byte  range specified by the new lock does not precisel=
y
       coincide with the range of the existing lock.)

       F_SETLK (struct flock *)
              Acquire a lock (when l_type  is  F_RDLCK  or  F_WRLCK)  o=
r
              release a lock (when l_type is F_UNLCK) on the bytes spec=
=E2=80=90
              ified by the l_whence, l_start, and l_len fields of  lock=
=2E
              If  a  conflicting  lock  is held by another process, thi=
s
              call returns -1 and sets errno to EACCES or EAGAIN.

       F_SETLKW (struct flock *)
              As for F_SETLK, but if a conflicting lock is held  on  th=
e
              file, then wait for that lock to be released.  If a signa=
l
              is caught while waiting, then the call is interrupted  an=
d
              (after  the  signal  handler has returned) returns immedi=
=E2=80=90
              ately (with return value -1 and errno set  to  EINTR;  se=
e
              signal(7)).

       F_GETLK (struct flock *)
              On input to this call, lock describes a lock we would lik=
e
              to place on the  file.   If  the  lock  could  be  placed=
,
              fcntl() does not actually place it, but returns F_UNLCK i=
n
              the l_type field of lock and leaves the  other  fields  o=
f
              the structure unchanged.

              If  one or more incompatible locks would prevent this loc=
k
              being placed, then fcntl() returns details  about  one  o=
f
              these  locks  in  the l_type, l_whence, l_start, and l_le=
n
              fields of lock.  If the conflicting lock is a  traditiona=
l
              (process-associated)  record lock, then the l_pid field i=
s
              set to the PID of the process holding that lock.   If  th=
e
              conflicting  lock  is  an open file description lock, the=
n
              l_pid is set to -1.  Note that  the  returned  informatio=
n
              may already be out of date by the time the caller inspect=
s
              it.

       In order to place a read lock, fd must be open for  reading.   I=
n
       order  to  place  a  write lock, fd must be open for writing.  T=
o
       place both types of lock, open a file read-write.

       As well as being removed by an explicit F_UNLCK, record locks ar=
e
       automatically released when the process terminates.

       Record  locks  are  not inherited by a child created via fork(2)=
,
       but are preserved across an execve(2).

       Because of the buffering performed by the stdio(3)  library,  th=
e
       use  of  record  locking  with routines in that package should b=
e
       avoided; use read(2) and write(2) instead.

#      The record locks described above are associated with the  proces=
s
#      (unlike  the  open file description locks described below).  Thi=
s
#      has some unfortunate consequences:

#      *  If a process holding a lock on a file closes any file descrip=
=E2=80=90
#         tor  referring to the file, then all of the process's locks o=
n
#         the file are released, no matter which  file  descriptor  the=
y
#         were  obtained  via.  This is bad: it means that a process ca=
n
#         lose its locks on a file such as /etc/passwd or /etc/mtab whe=
n
#         for  some reason a library function decides to open, read, an=
d
#         close the same file.

#      *  The threads in a process share locks.  In other words, a  mul=
=E2=80=90
#         tithreaded  program  can't  use  record locking to ensure tha=
t
#         threads don't simultaneously access the same region of a file=
=2E

#      Open file description locks solve both of these problems.

   Open file description locks (non-POSIX)
#      Open file description locks are advisory byte-range  locks  whos=
e
#      operation is in most respects identical to the traditional recor=
d
#      locks described above.  This lock  type  is  Linux-specific,  an=
d
#      available since Linux 3.15.

#      The  principal  difference  between  the  two  lock types is tha=
t
#      whereas traditional record locks are associated with  a  process=
,
#      open  file  description  locks  are associated with the open fil=
e
#      description on which they are acquired, much like locks  acquire=
d
#      with  flock(2).   Consequently  (and  unlike traditional advisor=
y
#      record locks), open file description locks are  inherited  acros=
s
#      fork(2)  (and  clone(2) with CLONE_FILES), and are only automati=
=E2=80=90
#      cally released on the last close of the  open  file  description=
,
#      instead of being released on any close of the file.

       Open  file  description  locks  always  conflict with traditiona=
l
       record locks, even when they are acquired by the same process  o=
n
       the same file descriptor.

#      Open  file  description  locks  placed  via  the  same  open fil=
e
#      description (i.e., via the same file descriptor, or via a  dupli=
=E2=80=90
#      cate  of the file descriptor created by fork(2), dup(2), fcntl(2=
)
#      F_DUPFD, and so on) are always  compatible:  if  a  new  lock  i=
s
#      placed  on  an  already  locked region, then the existing lock i=
s
#      converted to the new lock type.  (Such conversions may result  i=
n
#      splitting, shrinking, or coalescing with an existing lock as dis=
=E2=80=90
#      cussed above.)

#      On the other hand, open file description locks may conflict  wit=
h
#      each  other  when  they  are  acquired  via  different  open fil=
e
#      descriptions.  Thus, the threads in a multithreaded  program  ca=
n
#      use  open  file description locks to synchronize access to a fil=
e
#      region by having each thread perform its own open(2) on the  fil=
e
#      and applying locks via the resulting file descriptor.

       As  with  traditional  advisory  locks,  the  third  argument  t=
o
       fcntl(), lock, is a pointer to an flock structure.   By  contras=
t
       with  traditional record locks, the l_pid field of that structur=
e
       must be set to zero when using the commands described below.

       The commands for working with open  file  description  locks  ar=
e
       analogous to those used with traditional locks:

       F_OFD_SETLK (struct flock *)
              Acquire  an  open  file  description  lock (when l_type i=
s
              F_RDLCK or F_WRLCK) or release an  open  file  descriptio=
n
              lock  (when  l_type  is F_UNLCK) on the bytes specified b=
y
              the l_whence, l_start, and l_len fields  of  lock.   If  =
a
              conflicting  lock  is  held  by another process, this cal=
l
              returns -1 and sets errno to EACCES or EAGAIN.

       F_OFD_SETLKW (struct flock *)
              As for F_OFD_SETLK, but if a conflicting lock is  held  o=
n
              the  file,  then  wait for that lock to be released.  If =
a
              signal is caught while waiting, then the  call  is  inter=
=E2=80=90
              rupted and (after the signal handler has returned) return=
s
              immediately (with return value -1 and errno set to  EINTR=
;
              see signal(7)).

       F_OFD_GETLK (struct flock *)
              On  input  to  this  call,  lock  describes  an  open fil=
e
              description lock we would like to place on the  file.   I=
f
              the  lock could be placed, fcntl() does not actually plac=
e
              it, but returns F_UNLCK in the l_type field  of  lock  an=
d
              leaves  the  other  fields of the structure unchanged.  I=
f
              one or more incompatible locks  would  prevent  this  loc=
k
              being  placed,  then  details about one of those locks ar=
e
              returned via lock, as described above for F_GETLK.

   Mandatory locking
       Warning: the Linux implementation of mandatory locking is unreli=
=E2=80=90
       able.  See BUGS below.

#      By  default,  both traditional (process-associated) and open fil=
e
#      description record locks are advisory.  Advisory  locks  are  no=
t
#      enforced and are useful only between cooperating processes.

       Both  lock  types  can  also  be  mandatory.  Mandatory locks ar=
e
       enforced for all processes.  If a process  tries  to  perform  a=
n
       incompatible  access (e.g., read(2) or write(2)) on a file regio=
n
       that has an incompatible mandatory lock, then the result  depend=
s
       upon  whether  the  O_NONBLOCK  flag is enabled for its open fil=
e
       description.  If the O_NONBLOCK flag is  not  enabled,  then  th=
e
       system  call is blocked until the lock is removed or converted t=
o
       a mode that is compatible with the  access.   If  the  O_NONBLOC=
K
       flag  is  enabled,  then  the  system  call  fails with the erro=
r
       EAGAIN.

       To make use of mandatory locks, mandatory locking must be enable=
d
       both  on  the filesystem that contains the file to be locked, an=
d
       on the file itself.  Mandatory locking is enabled on a filesyste=
m
       using  the  "-o mand" option to mount(8), or the MS_MANDLOCK fla=
g
       for mount(2).  Mandatory locking is enabled on  a  file  by  dis=
=E2=80=90
       abling group execute permission on the file and enabling the set=
-
       group-ID permission bit (see chmod(1) and chmod(2)).

       Mandatory locking is not specified by POSIX.  Some other  system=
s
       also  support  mandatory  locking, although the details of how t=
o
       enable it vary across systems.

  [...]

  RETURN VALUE
       For a successful call, the return value depends on the operation=
:

       F_DUPFD  The new descriptor.

       F_GETFD  Value of file descriptor flags.

       F_GETFL  Value of file status flags.

       F_GETLEASE
                Type of lease held on file descriptor.

       F_GETOWN Value of descriptor owner.

       F_GETSIG Value  of  signal sent when read or write becomes possi=
=E2=80=90
                ble, or zero for traditional SIGIO behavior.

       F_GETPIPE_SZ
                The pipe capacity.

#      All other commands
#               Zero.

#      On error, -1 is returned, and errno is set appropriately.

  ERRORS
  [...]

#      EINVAL cmd is  F_OFD_SETLK,  F_OFD_SETLKW,  or  F_OFD_GETLK,  an=
d
#             l_pid was not specified as zero.

  [...]

  CONFORMING TO
  [...]
#      F_OFD_SETLK, F_OFD_SETLKW, and  F_OFD_GETLK  are  Linux-specific=
,
#      but  work is being done to have them included in the next versio=
n
#      of POSIX.1.


Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
