From: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Tue, 23 May 2017 14:03:27 +0300
Message-ID: <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3907bc2a-0645-8d93-6ee5-3f99874e7022-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-MW
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

23.05.2017 13:35, Michael Kerrisk (man-pages) пишет:
> Hello Stas,
Hi. :)


>> Because I don't think we broke the existing code, or did we?
> Probably not, but it seems to me that there is some small
> possibility that library code that makes use of sigaltstack()
> to test whether a signal is being handled on an alternate signal
> stack, unaware that the main program employed SS_AUTODISARM,
> could be confused/broken. I've no idea how likely this scenario
> is though. (I imagine it's rather unlikely.)
OK, so the original problem was that to get the
more consistent checks, you'd need to keep alt
stack still set up but disarmed, while inside the
sighandler. If someone uses siglongjmp() at that
point, then it will be left dangling. Likely there are
ways around this, but nothing simple that I could
think of.

>> and posix seems to allow any
>> other value for enable, which can be (on linux) SS_ONSTACK,
>> not only 0.
> Yes, long ago someone got confused, as I've noted in a recently added
> BUGS section in the page:
But my understanding differs.
http://pubs.opengroup.org/onlinepubs/009695399/functions/sigaltstack.html
---
The /ss_flags/ member specifies the new stack state.
If it is set to SS_DISABLE, the stack is disabled and /ss_sp/
and /ss_size/ are ignored. Otherwise, the stack shall be enabled
---

As you can see, it doesn't say "SS_DISABLE or 0 are
only possible values". It does not even mention 0 at all
as being a possible or suggested value, it only uses it in
an example.
So what you call a confusion, looks valid to me, according
to the above spec. Moreover, I use it in a real-life code,
and it would be interesting to know how many other people
do the same. If its just me, its one thing, but if it is a common
practice, then perhaps this part of a man page should be
reconsidered.

>> And SS_AUTODISARM can be ORed with the value.
>>
>>>                 ┌─────────────────────────────────────────────────────┐
>>>                 │FIXME                                                │
>>>                 ├─────────────────────────────────────────────────────┤
>>>                 │Was it intended that one  can  set  up  a  different │
>>>                 │alternative signal stack in this scenario? (In pass‐ │
>>>                 │ing,  if  one  does  this,   the   sigaltstack(NULL, │
>>>                 │&old_ss)  now returns old_ss.ss_flags==SS_AUTODISARM │
>>>                 │rather  than  old_ss.ss_flags==SS_DISABLE.  The  API │
>>>                 │design here seems confusing...                       │
>>>                 └─────────────────────────────────────────────────────┘
>> My memory may be wrong here, but I think setting
>> up another alt stack was not supposed because the
>> previous settings would be restored upon sighandler
>> return. AFAIK I was trying to make up a proposal to
>> get such attempts explicitly blocked rather than
>> silently ignored, but again the simplicity was chosen.
> So, I've done only limited experimentation here, but this is what
> I see in one experiment:
>
> [[
> * Set up two handlers for SIGX and SIGY, both using SA_ONSTACK.
> * Establish alternate SS (1) using SS_AUTODISARM
>    
>    [SIGA is delivered]
>
> * Handler for SIGA is called and handler is executed on alternate SS 1.
> * The handler establishes a new alternate SS (2) with SS_AUTODISARM.
>
>    [SIGB is delivered]
>
> * Handler for SIGB is called and handler is executed on alternate SS 2.
> * Handler for SIGB returns
>
>    [SIGB is delivered]
>
> * Handler for SIGB is called and handler is executed on alternate SS 2.
> * Handler for SIGB returns
> * Handler of SIGA returns
At this point the alt stack is set back to SS1,
undoing the effect of the just-done sigaltstack()
call.

>    [SIGA is delivered]
>
> * Handler for SIGA is called and handler is executed on alternate SS 1.
> ]]
>
> Summary: setting up another alternate signal stack seems to "work".
Only if you deliver SIGB while still inside SIGA handler,
which is a bit unusual. Certainly not worth calling this
"works" IMHO. The fact that this will be undone at SIGA
exit, is much more confusing to the user, so I'd say just
don't do that.
There IS a way to set a new alt stack while inside SIGA,
and I use that in a real-life code. It is to write the new
values to uc_stack. If you do this, the new settings will
be activated at the return from SIGA handler. Maybe
you can mention this possibility instead.

> API history is littered with stories where users found out that
> something unforeseen "worked", and so they used it. The question
> is: what can go wrong if people do try using this "feature"?
It will disappear at the exit from SIGA.
To me this is "wrong enough" to not suggest doing so.

>>>          SS_AUTODISARM
>>>                 The  alternate  signal  stack  has  been  marked  to  be
>>>                 autodisarmed as described above.
>> Initially this flag was supposed to be ORed with
>> the old values. Your descrition is correct, but if
>> more bit flags are added, this may became a
>> problem, as you are always treating it as a separate
>> value, not a bit flag.
> Thanks for the confirmation.
>
> At the end of this mail is a test program that I used to experiment
> with this stuff. Here's a sample run that demonstrates the scenario
> described above:
The kernel already has the sigaltstack test-case,
so maybe you can add some checks to it from your
test-case.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
