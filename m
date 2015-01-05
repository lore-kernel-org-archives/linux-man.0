From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Mon, 05 Jan 2015 09:25:07 -0500
Message-ID: <54AA9EC3.5040006@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>	<20141230230529.GT4574@brightrain.aerifal.cx>	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>	<ortx0cdv3c.fsf@livre.home> <54A41595.4010007@redhat.com> <ord26zdlqt.fsf@livre.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-55978-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <ord26zdlqt.fsf@livre.home>
To: Alexandre Oliva <aoliva@redhat.com>
Cc: Rich Felker <dalias@libc.org>, Michael Kerrisk <mtk.manpages@gmail.com>, Peng Haitao <penght@cn.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 01/01/2015 02:05 AM, Alexandre Oliva wrote:
> On Dec 31, 2014, "Carlos O'Donell" <carlos@redhat.com> wrote:
> 
>> I did not know malloc was required to be AS-safe for POSIX compliance.
> 
> Ugh.  Sorry, my bad, it's not.  malloc's AS-safety goal seems to have
> jumped from "desirable" to "mandatory" in my mind :-(

No worries. That's why we work together.

>> See: http://pubs.opengroup.org/onlinepubs/009695399/functions/xsh_chap02_04.html
>> 2.4.3 Signal Actions.
> 
>> The list of functions does not list malloc.
> 
> Beware, that's a very old version of POSIX that you referenced above.
> What led me to realize it was the use of the term "reentrant" there ;-)

You are correct, issue 6 is old, issue 7 is the most recent, with text here:
http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03

> Anyway, the corresponding table in current POSIX fails to list malloc as
> AS-Safe just the same ;-)

So to recap:

We would complicate a user malloc implementation by forcing them to use only 
AS-safe functions.

We want to expand the list of usable functions the user can call from their
malloc without requiring it be all functions.

The tentative initial list is "all AS-Safe and SR-safe function." Where SR-safe
stands for synchronously reentrant e.g. can be reentered by the same thread, but
not from asynchronous contexts.

Cheers,
Carlos.
