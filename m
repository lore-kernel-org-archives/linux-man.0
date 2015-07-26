From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Sun, 26 Jul 2015 22:29:59 +0200
Message-ID: <55B54347.5050806@gmail.com>
References: <550ED3F4.1080403@gmail.com>	<550F363B.801@gmail.com>	<55B1EFFA.9070608@gmail.com>	<CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com>	<55B54215.6070502@gmail.com> <CAODz2cAmqVtkoNSwUA5p0_=pcFAdrS3ovohyjwnXMapgEhc4qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAODz2cAmqVtkoNSwUA5p0_=pcFAdrS3ovohyjwnXMapgEhc4qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/26/2015 10:27 PM, Nicholas Miell wrote:
> Sounds good.

That was quick! Thanks for checking, and thanks for the report, Nichola=
s!

Cheers,

Michael


> On Sun, Jul 26, 2015 at 1:24 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 07/24/2015 05:51 PM, Nicholas Miell wrote:
>>> PTHREAD_PROCESS_SHARED says any thread with access to the memory co=
ntaining
>>> the mutex can operate on the mutex and POSIX basically ignores the =
idea
>>> that different processes could be running completely incompatible
>>> executables or whatever.
>>>
>>> pthread_mutex_t has a bunch of #ifdefs in the middle of it that cha=
nge the
>>> structure size and layout between i386 and x86_64.
>>>
>>> Most importantly, the positions of the __nusers and __kind fields a=
re
>>> swapped (this looks to be an oversight dating back to 2003 when __n=
users
>>> was first introduced and carefully preserved when the separate i386=
 and
>>> x86_64 versions of pthreadtypes.h were merged into the single x86 v=
ersion),
>>> which means that when the lock and unlock functions attempt to figu=
re out
>>> what kind of mutex it is (recursive/adaptive/whatever), they'll loo=
k at the
>>> wrong field if the mutex is from the wrong architecture and then th=
ings
>>> will break.
>>>
>>> And then there's the fact that the rest of the struct is a union in=
 the
>>> 32-bit version and flat in the 64-bit version, but that could have =
been
>>> worked around if you put a flag in the __kind field that tells the =
64-bit
>>> pthread library that it is looking at a 32-bit mutex.
>>
>> Thanks for the additional detail, Nicholas. So, how about a paragrap=
h such
>> as the following for the manual page:
>>
>>        POSIX says that any thread in any process with access to the =
mem=E2=80=90
>>        ory containing a  process-shared  (PTHREAD_PROCESS_SHARED)  m=
utex
>>        can  operate  on that mutex.  However, on 64-bit x86 systems,=
 the
>>        mutex definition for x86-64 is incompatible with the mutex  d=
efi=E2=80=90
>>        nition  for  i386,  meaning that 32-bit and 64-bit binaries c=
an't
>>        share mutexes on x86-64 systems.
>> ?
>>
>> Cheers,
>>
>> Michael
>>
>>
>>> On Fri, Jul 24, 2015 at 12:57 AM, Michael Kerrisk (man-pages) <
>>> mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> On 03/22/2015 10:38 PM, Nicholas Miell wrote:
>>>>> On 03/22/2015 07:38 AM, Michael Kerrisk (man-pages) wrote:
>>>>>> Hello all,
>>>>>>
>>>>>> I wrote a short man page documented some of the details of
>>>>>> NPTL that might affect application developers. Review comments
>>>>>> would be most welcome.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Michael
>>>>>
>>>>> POSIX specifies that process-shared pthread_mutex_t's can be mani=
pulated
>>>>> by independent processes, however the AMD64 and i386 versions of =
the
>>>>> mutex structures are incompatible and cannot be shared.
>>>>>
>>>>> This might be true of the other supposedly sharable primitives, I=
 never
>>>>> bothered to check the rest when I first noticed the problem with =
mutexes.
>>>>
>>>> Nicholas,
>>>>
>>>> Can you provide pointers to further information on this topic?
>>>>
>>>> Cheers,
>>>>
>>>> Michael
>>>>
>>>>
>>>> --
>>>> Michael Kerrisk
>>>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>>>> Linux/UNIX System Programming Training: http://man7.org/training/
>>>>
>>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
