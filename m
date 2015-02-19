From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: GSoc 2015 man-pages proposal: a parser for glibc feature test macros
Date: Thu, 19 Feb 2015 19:28:14 +0100
Message-ID: <CAKgNAkjmcP=ZKJpPzXAgPXRTAG7pNK9Wr3DKDk+DVf3DJ07B6Q@mail.gmail.com>
References: <CAKgNAkgXgVjNDU=aSVXfdZ5xmo6TZ6qCXhVRNBqte69u6Kas3A@mail.gmail.com>
 <54E5F695.1060400@redhat.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <libc-alpha-return-57156-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <54E5F695.1060400@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Carlis,

On 19 February 2015 at 15:43, Carlos O'Donell <carlos@redhat.com> wrote:
> On 02/19/2015 03:30 AM, Michael Kerrisk (man-pages) wrote:
>> Hi Carlos,
>>
>> I wonder if I might be able to engage you as a backup mentor for a
>> GSoC project that I am proposing here:
>> https://www.kernel.org/doc/man-pages/gsoc_2015.html
>>
>> The basic idea is to produce a parser for glibc code to tell answer
>> the questions: what feature test macros (FTMs) can be defined to
>> expose the definition of function foo(). The purpose is then to use
>> that information to update FTM information contained in the man pages.
>> However, it would of course also be useful information for the glibc
>> manual, should the project wish to start documenting such things. (I
>> believe this information is little documented in the manual at the
>> moment.)
>>
>> What do you think of the idea? And would you be willing to be a backup
>> mentor? (I expect little effort to be involved on your part, but GSoc
>> requires two mentors for a proposal.)
>>
>> BTW, if any other glibc maintainer would be willing to act as a backup
>> mentor, I'd be happy hear from you.
>
> I would be happy to be a backup mentor.

Thank you, Carlos! Do you by chance have a login on the GSoC system;
if so, I will add you as a project mentor there.

> The idea sounds interesting. I don't know that all combinations of
> FTMs are designed to be allowed, and I expect that the result will
> always need some human expert cleanup.

Agreed. But I hope for a tool that significantly eases the human task.

> Therefore it would be good
> to have glibc developer review of the results. I'm not suggesting
> I should be that reviewer, but the community should review to make
> sure it's correct.

Yes, review would be good. In the first instance, we have a lot of
existing mark-up in the man pages that can serve as an initial measure
of correctness. (Of course, the man pages are also not perfectly up to
date, so we'd discover the problems in the pages as we go.)

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
