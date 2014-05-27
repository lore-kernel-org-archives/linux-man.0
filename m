From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Documenting execve() and EAGAIN
Date: Tue, 27 May 2014 07:51:53 +0200
Message-ID: <538427F9.7090501@gmail.com>
References: <537CEC90.7060000@gmail.com> <20140526181120.GB11145@cachalot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140526181120.GB11145@cachalot>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: mtk.manpages@gmail.com, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Vasiliy,

On 05/26/2014 08:11 PM, Vasiliy Kulikov wrote:
> Hi Michael,
>=20
> On Wed, May 21, 2014 at 20:12 +0200, Michael Kerrisk (man-pages) wrot=
e:
>> Vasily (and Motohiro),
>>
>> Sometime ago, Motohiro raised a documentation bug
>> ( https://bugzilla.kernel.org/show_bug.cgi?id=3D42704 ) which=20
>> relates to your commit 72fa59970f8698023045ab0713d66f3f4f96945c
>> ("move RLIMIT_NPROC check from set_user() to do_execve_common()")
>>
>> I have attempted to document this, and I would like to ask you
>> (and Motohiro) if you would review the text proposed below for
>> the exceve(2) man page.
>>
>> Thank you,
>>
>> Michael
>>
>>
>> ERRORS
>>        EAGAIN (since Linux 3.1)
>>               Having  changed its real UID using one of the set*uid(=
)
>>               calls,  the  caller  was=E2=80=94and  is  now  still=E2=
=80=94above  its
>>               RLIMIT_NPROC  resource limit (see setrlimit(2)).  For =
a
>>               more detailed explanation of this error, see NOTES.
>>
>> NOTES
>>    execve() and EAGAIN
>>        A more detailed explanation of the EAGAIN error that can occu=
r
>>        (since Linux 3.1) when calling execve() is as follows.
>>
>>        The EAGAIN error can occur when a preceding call to setuid(2)=
,
>>        setreuid(2), or setresuid(2) caused the real user  ID  of  th=
e
>>        process  to  change,  and  that  change  caused the process t=
o
>>        exceed its RLIMIT_NPROC resource limit (i.e.,  the  number  o=
f
>>        processes  belonging  to the new real UID exceeds the resourc=
e
>>        limit).  In Linux 3.0 and earlier, this caused  the  set*uid(=
)
>>        call to fail.
>>
>>        Since  Linux 3.1, the scenario just described no longer cause=
s
>>        the set*uid() call to fail, because it too often led to  secu=
=E2=80=90
>>        rity  holes because buggy applications didn't check the retur=
n
>>        status and assumed that=E2=80=94if the caller had root  privi=
leges=E2=80=94the
>>        call  would  always succeed.  Instead, the set*uid() calls no=
w
>>        successfully change real UID, but the kernel sets an  interna=
l
>>        flag,  named  PF_NPROC_EXCEEDED, to note that the RLIMIT_NPRO=
C
>>        resource limit has been exceeded.  If the  resource  limit  i=
s
>>        still exceeded at the time of a subsequent execve() call, tha=
t
>>        call fails with the error EAGAIN.  This kernel  logic  ensure=
s
>>        that the RLIMIT_NPROC resource limit is still enforced for th=
e
>>        common privileged daemon workflow=E2=80=94namely, fork(2)+  s=
et*uid()+
>>        execve(2).
>>
>>        If  the  resource  limit was not still exceeded at the time o=
f
>>        the execve() call (because other processes belonging  to  thi=
s
>>        real  UID  terminated  between  the  set*uid()  call  and  th=
e
>>        execve() call), then the execve() call succeeds and the kerne=
l
>>        clears  the  PF_NPROC_EXCEEDED process flag.  The flag is als=
o
>>        cleared if a subsequent call to fork(2) by this  process  suc=
=E2=80=90
>>        ceeds.
>=20
> Probably explicitly state that NPROC check on execve() is processed o=
nly
> in case of a previous set*uid() call?  If there was no previous
> set*uid() call the semantics of execve() checks are the same as befor=
e
> (IOW, RLIMIT_NPROC is ignored).

Yes, good idea. I'll add some words to make that clearer.

> The rest is fine.

Thanks for checking it!

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
