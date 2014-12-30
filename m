From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 15:08:04 -0500
Message-ID: <54A30624.7070207@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <54A302A1.3020706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-55911-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <54A302A1.3020706@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Peng Haitao <penght@cn.fujitsu.com>, Alexandre Oliva <aoliva@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 12/30/2014 02:53 PM, Michael Kerrisk (man-pages) wrote:
> You better turn on the spell checker in your mailer (or update
> its dictionary) ;-). ("Ree_n_tran*")

Spell checker? :-)

>> * Add some introductory text about reetrancy in the safety
>>   section. This text will discuss that AS-safe functions
>>   are reetrant because they must be to be AS-safe. Note that
>>   reetrant functions need not be AS-safe nor MT-safe.
> 
> Sounds good to me.
> 
>> * Add a "R-Safe" and "R-Unsafe" to indicate safety with respect
>>   to reetrancy.
> 
> Sounds odd to me. Why not just say "Reentrant" and "Nonreentrant",
> rather than add new terms?

Sounds good to me.

The only down side is that both of those words are quite long.

This makes the safety notes visually long.

Any thoughts on a short form?

>> * Immediately annotate all AS-safe functions as R-Safe.
> 
> Okay -- modulo preceding point
> 
>> * Review all of the "_r" functions for reetrance safety.
> 
> Okay.
>  
>> Thoughts?
>>
>> My review of other Unices indicates this is probably the
>> last type of safety that documented by other systems.
> 
> I am not quite clear what you mean by "last...documented".
> Do you mean: few other systems document it?

I mean to imply that I hope we need not add any other safety
notations aside from thread safety, signal safety, cancellation
safety, and reentrancy. I have not seen any other notes in other
Unices with the exception of fork1-safe in Solaris. Have you
seen any other kinds of notes we might prepare to need in the
future?

Cheers,
Carlos.
