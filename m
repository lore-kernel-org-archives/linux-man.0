From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 21:35:36 +0100
Message-ID: <54A30C98.4090907@gmail.com>
References: <54A2C8A6.9050100@redhat.com> <54A302A1.3020706@gmail.com> <54A30624.7070207@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A30624.7070207-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2014 09:08 PM, Carlos O'Donell wrote:
> On 12/30/2014 02:53 PM, Michael Kerrisk (man-pages) wrote:
>> You better turn on the spell checker in your mailer (or update
>> its dictionary) ;-). ("Ree_n_tran*")
> 
> Spell checker? :-)
> 
>>> * Add some introductory text about reetrancy in the safety
>>>   section. This text will discuss that AS-safe functions
>>>   are reetrant because they must be to be AS-safe. Note that
>>>   reetrant functions need not be AS-safe nor MT-safe.
>>
>> Sounds good to me.
>>
>>> * Add a "R-Safe" and "R-Unsafe" to indicate safety with respect
>>>   to reetrancy.
>>
>> Sounds odd to me. Why not just say "Reentrant" and "Nonreentrant",
>> rather than add new terms?
> 
> Sounds good to me.
> 
> The only down side is that both of those words are quite long.

<nod>

> This makes the safety notes visually long.
> 
> Any thoughts on a short form?

Well, I'd say at least keep it to a recognizable abbreviation. 
("Reent", "Nonreent"?)

>>> * Immediately annotate all AS-safe functions as R-Safe.
>>
>> Okay -- modulo preceding point
>>
>>> * Review all of the "_r" functions for reetrance safety.
>>
>> Okay.
>>  
>>> Thoughts?
>>>
>>> My review of other Unices indicates this is probably the
>>> last type of safety that documented by other systems.
>>
>> I am not quite clear what you mean by "last...documented".
>> Do you mean: few other systems document it?
> 
> I mean to imply that I hope we need not add any other safety
> notations aside from thread safety, signal safety, cancellation
> safety, and reentrancy. I have not seen any other notes in other
> Unices with the exception of fork1-safe in Solaris. Have you
> seen any other kinds of notes we might prepare to need in the
> future?

Okay -- gotcha now. No, I think those four are the main one to 
worry about.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
