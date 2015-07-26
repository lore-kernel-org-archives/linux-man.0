From: Nicholas Miell <nmiell@gmail.com>
Subject: Re: For review: nptl(7) man page
Date: Sun, 26 Jul 2015 13:27:14 -0700
Message-ID: <CAODz2cAmqVtkoNSwUA5p0_=pcFAdrS3ovohyjwnXMapgEhc4qg@mail.gmail.com>
References: <550ED3F4.1080403@gmail.com>
	<550F363B.801@gmail.com>
	<55B1EFFA.9070608@gmail.com>
	<CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com>
	<55B54215.6070502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-61412-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <55B54215.6070502@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

Sounds good.

On Sun, Jul 26, 2015 at 1:24 PM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> On 07/24/2015 05:51 PM, Nicholas Miell wrote:
>> PTHREAD_PROCESS_SHARED says any thread with access to the memory contain=
ing
>> the mutex can operate on the mutex and POSIX basically ignores the idea
>> that different processes could be running completely incompatible
>> executables or whatever.
>>
>> pthread_mutex_t has a bunch of #ifdefs in the middle of it that change t=
he
>> structure size and layout between i386 and x86_64.
>>
>> Most importantly, the positions of the __nusers and __kind fields are
>> swapped (this looks to be an oversight dating back to 2003 when __nusers
>> was first introduced and carefully preserved when the separate i386 and
>> x86_64 versions of pthreadtypes.h were merged into the single x86 versio=
n),
>> which means that when the lock and unlock functions attempt to figure ou=
t
>> what kind of mutex it is (recursive/adaptive/whatever), they'll look at =
the
>> wrong field if the mutex is from the wrong architecture and then things
>> will break.
>>
>> And then there's the fact that the rest of the struct is a union in the
>> 32-bit version and flat in the 64-bit version, but that could have been
>> worked around if you put a flag in the __kind field that tells the 64-bi=
t
>> pthread library that it is looking at a 32-bit mutex.
>
> Thanks for the additional detail, Nicholas. So, how about a paragraph suc=
h
> as the following for the manual page:
>
>        POSIX says that any thread in any process with access to the mem=
=E2=80=90
>        ory containing a  process-shared  (PTHREAD_PROCESS_SHARED)  mutex
>        can  operate  on that mutex.  However, on 64-bit x86 systems, the
>        mutex definition for x86-64 is incompatible with the mutex  defi=
=E2=80=90
>        nition  for  i386,  meaning that 32-bit and 64-bit binaries can't
>        share mutexes on x86-64 systems.
> ?
>
> Cheers,
>
> Michael
>
>
>> On Fri, Jul 24, 2015 at 12:57 AM, Michael Kerrisk (man-pages) <
>> mtk.manpages@gmail.com> wrote:
>>
>>> On 03/22/2015 10:38 PM, Nicholas Miell wrote:
>>>> On 03/22/2015 07:38 AM, Michael Kerrisk (man-pages) wrote:
>>>>> Hello all,
>>>>>
>>>>> I wrote a short man page documented some of the details of
>>>>> NPTL that might affect application developers. Review comments
>>>>> would be most welcome.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Michael
>>>>
>>>> POSIX specifies that process-shared pthread_mutex_t's can be manipulat=
ed
>>>> by independent processes, however the AMD64 and i386 versions of the
>>>> mutex structures are incompatible and cannot be shared.
>>>>
>>>> This might be true of the other supposedly sharable primitives, I neve=
r
>>>> bothered to check the rest when I first noticed the problem with mutex=
es.
>>>
>>> Nicholas,
>>>
>>> Can you provide pointers to further information on this topic?
>>>
>>> Cheers,
>>>
>>> Michael
>>>
>>>
>>> --
>>> Michael Kerrisk
>>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>>> Linux/UNIX System Programming Training: http://man7.org/training/
>>>
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
