From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: For review: nptl(7) man page
Date: Thu, 06 Aug 2015 12:06:18 +0200
Message-ID: <55C3319A.7020408@gmail.com>
References: <CAODz2cDq4o85NOzqCDg9cH8eCvqt3Tq5QXKMMJtXbik5h5bL+Q@mail.gmail.com> <55B54215.6070502@gmail.com> <1438616740.20974.81.camel@localhost.localdomain> <20150803200825.GJ16376@brightrain.aerifal.cx> <20150804150648.9E9F42C3B01@topped-with-meat.com> <3848244D-C3FE-4FD1-B137-AF7AD6252659@gmail.com> <1438767393.20974.211.camel@localhost.localdomain> <BCB9D422-563C-4317-B0CB-B14001FE0EA3@gmail.com> <20150805182327.GA14639@brightrain.aerifal.cx> <55C25D2B.4040905@gmail.com> <20150805194613.GB14639@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-61758-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20150805194613.GB14639@brightrain.aerifal.cx>
To: Rich Felker <dalias@libc.org>
Cc: mtk.manpages@gmail.com, Nicholas Miell <nmiell@gmail.com>, Torvald Riegel <triegel@redhat.com>, Roland McGrath <roland@hack.frob.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Carlos O'Donell <carlos@redhat.com>
List-Id: linux-man@vger.kernel.org

On 08/05/2015 09:46 PM, Rich Felker wrote:
> On Wed, Aug 05, 2015 at 08:59:55PM +0200, Michael Kerrisk (man-pages) wrote:
>>>>> The semaphore example shows that there can be a disadvantage to
>>>>> guaranteeing 32/64b interoperability (specifically, the 64b code is more
>>>>> efficient).  For mutex, I *currently* don't see a reason why we couldn't
>>>>> get away with just doing 32b stuff for the pshared case, but there's no
>>>>> guarantee that I can foresee all future needs either.
>>>>>
>>>>> Thus, if we would decide to guarantee 32/64b interoperability, we'd need
>>>>> to have at least strong use cases for that and a decent amount of
>>>>> confidence that making such a guarantee is unlikely to constrain the
>>>>> implementation in the future.
>>>>
>>>> Well, POSIX semaphores are supposed to be a replacement for System V
>>>> semaphores (and this extends to the rest of the POSIX IPC
>>>> primitives); right now they aren't.
>>>
>>> Only for some usage cases. As far as I can tell, POSIX semaphores are
>>> not intended to be required to be implemented as a kernel resource.
>>
>> That last is also true of SysV semaphores, surely?
> 
> The grammar of my sentence was rather complicated and perhaps
> confusing. The intent was to say that SysV semaphores absolutely have
> to be a kernel resource, but POSIX semaphores don't (and aren't).

I'm still puzzled. POSIX certainly doesn't make any requirements here.
So who does or doesn't "require" this? Also, I am not sure of the
distinction you're trying to make here. In the Linux implementation of
POSIX semaphores, kernel involvement is required in the contended case.

>>> They don't have permissions enforcement/safety against malicious
>>> processes, 
>>
>> (I'm a little lost here. POSIX semaphores do have a permissions mask.)
> 
> Yes, named semaphores have fs-like permissions, and of course you can
> do that with unnamed ones in named shared memory objects or files.
> However, as implemented in the real world, that provides no protection
> from a malicious process that _does_ have access permissions. With SysV
> semaphores, the worst a malicious process with access can do is
> wait/post the semaphore. With current implementations of POSIX
> semaphores, and other process-shared pthread sync objects, a malicious
> process that has access can utterly corrupt the state of the object. I
> am not sure of the extent of damage that can be achieved here, but
> there is not explicit effort to harden against it.

Again, I'm clear on the distinction here. By "corrupted", I assume
you're talking about (say) directly opening the SHM object used
to implement the semaphore and tweaking bits arbitrarily.
But, if someone can wait/post maliciously, you're pretty much
hosed anyway.

>>>  backout on async process termination, etc.
>>
>> Actually, System V semaphores don't reliably have this either (see BUGS
>> in semop(2)).
> 
> That's something of a design bug, but irrelevant to the reasonable
> usage which would be to post, not wait.

Why is that the only reasonable usage? 

It totally depends on the design of the sync protocol that you're
layering on top of SysV semaphores. SEM_UNDO is a fundamentally
broken concept, AFAICS.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
