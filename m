From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Documenting execve() and EAGAIN
Date: Wed, 21 May 2014 20:12:32 +0200
Message-ID: <537CEC90.7060000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasiliy Kulikov <segoon@openwall.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: mtk.manpages@gmail.com, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Vasily (and Motohiro),

Sometime ago, Motohiro raised a documentation bug
( https://bugzilla.kernel.org/show_bug.cgi?id=3D42704 ) which=20
relates to your commit 72fa59970f8698023045ab0713d66f3f4f96945c
("move RLIMIT_NPROC check from set_user() to do_execve_common()")

I have attempted to document this, and I would like to ask you
(and Motohiro) if you would review the text proposed below for
the exceve(2) man page.

Thank you,

Michael


ERRORS
       EAGAIN (since Linux 3.1)
              Having  changed its real UID using one of the set*uid()
              calls,  the  caller  was=E2=80=94and  is  now  still=E2=80=
=94above  its
              RLIMIT_NPROC  resource limit (see setrlimit(2)).  For a
              more detailed explanation of this error, see NOTES.

NOTES
   execve() and EAGAIN
       A more detailed explanation of the EAGAIN error that can occur
       (since Linux 3.1) when calling execve() is as follows.

       The EAGAIN error can occur when a preceding call to setuid(2),
       setreuid(2), or setresuid(2) caused the real user  ID  of  the
       process  to  change,  and  that  change  caused the process to
       exceed its RLIMIT_NPROC resource limit (i.e.,  the  number  of
       processes  belonging  to the new real UID exceeds the resource
       limit).  In Linux 3.0 and earlier, this caused  the  set*uid()
       call to fail.

       Since  Linux 3.1, the scenario just described no longer causes
       the set*uid() call to fail, because it too often led to  secu=E2=
=80=90
       rity  holes because buggy applications didn't check the return
       status and assumed that=E2=80=94if the caller had root  privileg=
es=E2=80=94the
       call  would  always succeed.  Instead, the set*uid() calls now
       successfully change real UID, but the kernel sets an  internal
       flag,  named  PF_NPROC_EXCEEDED, to note that the RLIMIT_NPROC
       resource limit has been exceeded.  If the  resource  limit  is
       still exceeded at the time of a subsequent execve() call, that
       call fails with the error EAGAIN.  This kernel  logic  ensures
       that the RLIMIT_NPROC resource limit is still enforced for the
       common privileged daemon workflow=E2=80=94namely, fork(2)+  set*=
uid()+
       execve(2).

       If  the  resource  limit was not still exceeded at the time of
       the execve() call (because other processes belonging  to  this
       real  UID  terminated  between  the  set*uid()  call  and  the
       execve() call), then the execve() call succeeds and the kernel
       clears  the  PF_NPROC_EXCEEDED process flag.  The flag is also
       cleared if a subsequent call to fork(2) by this  process  suc=E2=
=80=90
       ceeds.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
