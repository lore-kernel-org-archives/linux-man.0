From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting execve() and EAGAIN
Date: Thu, 22 May 2014 15:28:03 +0200
Message-ID: <CAKgNAkjhzO7r8MTb408ePiEKb1qfxq6Dr7K+oMNPmhERpe78WA@mail.gmail.com>
References: <537CEC90.7060000@gmail.com> <20140522114102.66129305@notabene.brown>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140522114102.66129305-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Vasiliy Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 22, 2014 at 3:41 AM, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org> wrote:
> On Wed, 21 May 2014 20:12:32 +0200 "Michael Kerrisk (man-pages)"
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Vasily (and Motohiro),
>>
>> Sometime ago, Motohiro raised a documentation bug
>> ( https://bugzilla.kernel.org/show_bug.cgi?id=3D42704 ) which
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
>
> I don't know how detailed/precise you want to be, but this failure wa=
s from
> 2.6.0 to 3.0.
> Prior to 2.6, the limit was not imposed on processes that changed the=
ir uid.
>
> http://git.kernel.org/cgit/linux/kernel/git/history/history.git/commi=
t/?id=3D909cc4ae86f3380152a18e2a3c44523893ee11c4
>
> $ git describe --contains 909cc4ae86f3380152a18e2a3c44523893ee11c4
> v2.6.0-test2~85^2~5^2~15
>
> Otherwise the description fits my understanding.

Thanks Neil, I've added the details you mention to the draft.

Cheers,

Michael


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
>>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
