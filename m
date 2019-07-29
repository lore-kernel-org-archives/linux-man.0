From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Mon, 29 Jul 2019 21:32:59 +0200
Message-ID: <5725e69e-cb7d-042c-2eb2-d43f0be75f18@gmail.com>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
 <8736liit24.fsf@oldenburg2.str.redhat.com>
 <20190513141746.mail6ny43wh4t5oj@localhost.localdomain>
 <87y335m6fq.fsf@oldenburg2.str.redhat.com>
 <20190517155057.vr5uk6hfkyp44y3t@localhost.localdomain>
 <CAEMqeSrCMFZ8GQU=kR_+KXaqnd9m-3qUSQk1PNZ2xHjZ_YVHFg@mail.gmail.com>
 <alpine.DEB.2.21.1905201651260.2935@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-104026-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <alpine.DEB.2.21.1905201651260.2935@digraph.polyomino.org.uk>
To: Joseph Myers <joseph@codesourcery.com>, Carlos O'Donell <carlos@redhat.com>
Cc: mtk.manpages@gmail.com, "G. Branden Robinson" <g.branden.robinson@gmail.com>, Florian Weimer <fweimer@redhat.com>, linux-man <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Hello Joseph,

On 5/20/19 6:58 PM, Joseph Myers wrote:
> On Fri, 17 May 2019, Carlos O'Donell wrote:
> 
>> On Fri, May 17, 2019 at 11:51 AM G. Branden Robinson
>> <g.branden.robinson@gmail.com> wrote:
>>> What would you prefer?  That the man page not document the bug at all?
>>> Was it a mistake in your view to have added the information about the
>>> bug to the man page in the first place?
>>
>> I think having the glibc upstream version information is useful.
> 
> Likewise - if a bug is worth documenting there I think it's unavoidable 
> that the version numbers describe when things changed in glibc upstream.
> 
> What's more of an issue is when the BUGS section gets out of date or the 
> descriptions of the conditions for an issue are misleading.  pow(3) is a 
> case in point; it says "On 64-bits" meaning "on systems using the generic 
> implementation" (i.e., it's written from an assumption that x86_64 and 
> i386 are the only architectures and that i386 is the default) and that> issue was fixed in 2.28,

So should the text now read something like: "Before glibc 2.28, on 64-bit
systems [this bug existed]"?

> while the "If x is negative" described there was 
> both i386-specific (not mentioned as such) and fixed in 2.16.

And similarly, should the text now read something like: "On i386 systems
and glibc versions earlier than 2.16..."?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
