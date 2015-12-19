From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Sat, 19 Dec 2015 07:54:24 +0100
Message-ID: <5674FF20.9030609@gmail.com>
References: <56701916.4090203@gmail.com>
 <20151215211816.GR11972@malice.jf.intel.com> <5671891E.404@gmail.com>
 <1450437061.26597.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-65782-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <1450437061.26597.45.camel@localhost.localdomain>
To: Torvald Riegel <triegel@redhat.com>
Cc: mtk.manpages@gmail.com, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, lkml <linux-kernel@vger.kernel.org>, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>, Carlos O'Donell <carlos@redhat.com>, Roland McGrath <roland@hack.frob.com>, Davidlohr Bueso <dave@stgolabs.net>, Jakub Jelinek <jakub@redhat.com>, Ingo Molnar <mingo@elte.hu>, bill o gallmeister <bgallmeister@gmail.com>, bert hubert <bert.hubert@netherlabs.nl>, Jan Kiszka <jan.kiszka@siemens.com>, Eric Dumazet <edumazet@google.com>, Arnd Bergmann <arnd@arndb.de>, Rusty Russell <rusty@rustcorp.com.au>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Andy Lutomirski <luto@amacapital.net>, Daniel Wagner <wagi@monom.org>, Anton Blanchard <anton@samba.org>, Steven Rostedt <rostedt@goodmis.org>, Rich Felker <dalias@libc.org>, Jonathan Wakely <jwakely@redhat.com>, Mike
List-Id: linux-man@vger.kernel.org

On 12/18/2015 12:11 PM, Torvald Riegel wrote:
> On Wed, 2015-12-16 at 16:54 +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Darren,
>>
>> On 12/15/2015 10:18 PM, Darren Hart wrote:
>>> On Tue, Dec 15, 2015 at 02:43:50PM +0100, Michael Kerrisk (man-pages) wrote:
>>
>> [...]
>>
>>>>        When executing a futex operation that requests to block a thread,
>>>>        the kernel will block only if the futex word has the  value  that
>>>>        the  calling  thread  supplied  (as  one  of the arguments of the
>>>>        futex() call) as the expected value of the futex word.  The load‐
>>>>        ing  of the futex word's value, the comparison of that value with
>>>>        the expected value, and the actual blocking  will  happen  atomi‐
>>>>
>>>> FIXME: for next line, it would be good to have an explanation of
>>>> "totally ordered" somewhere around here.
>>>>
>>>>        cally  and totally ordered with respect to concurrently executing
>>>
>>> Totally ordered with respect futex operations refers to semantics of the
>>> ACQUIRE/RELEASE operations and how they impact ordering of memory reads and
>>> writes. The kernel futex operations are protected by spinlocks, which ensure
>>> that that all operations are serialized with respect to one another.
>>>
>>> This is a lot to attempt to define in this document. Perhaps a reference to
>>> linux/Documentation/memory-barriers.txt as a footnote would be sufficient? Or
>>> perhaps for this manual, "serialized" would be sufficient, with a footnote
>>> regarding "totally ordered" and a pointer to the memory-barrier documentation?
>>
>> I think I'll just settle for writing serialized in the man page, and be 
>> done with it :-).
> 
> I'd prefer if you'd not just use "serialized" :)  

Sigh :-). Okay--removed.

> Eventually, I'd prefer
> if we can explain the semantics for the user in terms of the terminology
> and semantics of the memory model of the programming language that users
> will likely use to call futex ops (ie, C11 / C++11).

And I'd be really happy to see such an explanation land in the page.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
