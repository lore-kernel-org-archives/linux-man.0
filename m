From: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Wed, 24 May 2017 23:12:10 +0300
Message-ID: <6f622987-9517-ee7c-2016-ea8c43645e39@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
 <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
 <026308b5-4e92-4439-1eb2-82b67584d548@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <026308b5-4e92-4439-1eb2-82b67584d548-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-MW
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

24.05.2017 14:09, Michael Kerrisk (man-pages) пишет:
>> Could you please point and cite the spec that says
>> exactly this?
> I take your point: the text of the spec could be more precise. It
> does not provide a complete support for my assertion.
>
> But, I do think the interpretation I suggest is the more natural one,
> for many reasons:
Note: below I am not arguing to whether it is
good or bad to use SS_ONSTACK. This question
is closed as soon as you pointed to EINVAL in
other OSes (it doesn't make it bad immediately,
but at least the outcome of its usage is now
pretty clear for me).
What I still want to point out is the fact that the
implementation in linux was very unlikely caused
by a confusion. It was the decision made in agreement
with the most straight-forward reading of the posix
spec, just maybe without knowing about this EINVAL
problem. And it can't create a compatibility problem
by itself because no one have explicitly promoted its
use: 0 is still accepted.
Why it could create a compatibility problem is only
because people suddenly started to use it, and for
the very simple reason (judging by myself): I was
absolutely confused with this '0' in the example, and
after many attempts to find even a slightest hint in
the same doc why it is safe (why SS_DISABLE can't
be 0), I resorted to looking into the kernel and the
code of other projects. And SS_ONSTACK looked
like a perfectly valid solution, fully agreeing with
the text (i.e. SS_ONSTACK != SS_DISABLE).
So what really creates a compatibility problem here,
is only a misleading text (or a misleading implementation
of it in other OSes). And as such, stating that "someone
was confused" looks more like an unjustified insult to me. :)

> 1. The field is named '*flags', which commonly means a bit mask.
Indeed, but the value suggests otherwise.
The name for a flag could be "SS_DISABLED"
(with D at the end), while "SS_DISABLE" suggests
an action. And indeed, it doesn't change a property
of a performing action the way SS_AUTODISARM
does. Instead it changes the action itself: the sas
get cleared instead of being set, and all the other
arguments are ignored. Eg I would be very surprised
seeing the "MAP_UNMAP" flag to mmap() that turns
it into munmap(). This more resembles the "action"
argument of the sigprocmask() call.

> 2. The example in that you mention that is in the spec is part of
>     the spec. It illustrates the understanding of the developers
>     of the spec about the interface they were specifying.
> 3. Various existing implementations treat the field as a bit mask
>     for which there is only one valid bit (SS_DISABLE), doing
>     tests of the form (ss.ss_flags & SS_DISABLE).
> 4. Some implementations (including *all* the ones that I looked at
>     the source code for, that is Illumos, FreeBSD, OpenBSD)
>     explicitly error if ss.ss_flags has bits other than SS_DISABLE set.
Well, yes, those are the practical arguments that
can't be ignored... Of course the one can try to
submit the patch to these projects that nullifies
this argument. :)

> 6. Before kernel 2.4 (Jan 2001), Linux also used to do 3 & 4!
Is there a discussion about this change somewhere?

> 8. The standard explicitly mentions that SS_ONSTACK may be returned
>     in old_ss.ss_flags, but makes no mention of the use of SS_ONSTACK
>     in ss.ss_flags. That fact should, IMO, be taken as a strong hint
>     that the standard developers did not believe that SS_ONSTACK was
>     to be used with ss.ss_flags.
But this doesn't matter as they "seemingly" allow
any other value than SS_DISABLE, and this one is
the most reasonable value of all (unless you know
this is a bitmask, of course).

So to make it clear: I am not arguing to what is
better or more portable. I am just not satisfied
with the statement that whoever implemented
it that way (and whoever uses it, too, obviously),
was confused or read the standard badly. It is
not the case. Also I don't agree that this implementation
can create any (portability or any other) kind of
problem: it still accepts 0, and its author didn't
advice anyone to use SS_ONSTACK. So in my eyes
the implementation is perfectly valid, no ifs no
buts. :) Man page can warn people to not use
SS_ONSTACK, but it shouldn't blame the author
of the kernel code in question IMHO.

>>>>> API history is littered with stories where users found out that
>>>>> something unforeseen "worked", and so they used it. The question
>>>>> is: what can go wrong if people do try using this "feature"?
>>>> It will disappear at the exit from SIGA.
>>>> To me this is "wrong enough" to not suggest doing so.
>>> See my comment above. It's weird because it will disappear at exit
>>> from SIGA, but not "wrong".
>> What do you mean?
>> There was no any notion of the "sigaltstack scope",
>> so with the existing semantic it is wrong, because
>> currently sigaltstack has no scope and can't change
> I'm not sure what you mean by "currently" here. I'm pointing
> out that whereas before one could not change the signal stack
> while executing a handler that is using a signal stack, now it
> seems to be possible. But, it's not random: the programmer must
> explicitly make this happen (and be lucky in the timing of signals).
By "random points" I meant that sas swaps back
to the previous one on a sighandler return. This
sighandler return is just a random point for anyone
who assumes the global scope of the sas. And the
scope of sas was always global, so from that POV
it doesn't work reliably. If you invent some notion
of the scoped sigaltstacks, then you will turn that
into a working functionality with new semantic.
But I don't think you can call this "working" without
first inventing an adequate semantic for it.

>> at random moments. You can make it "not wrong"
>> by inventing a new semantic with some notion of
>> the "sigaltstack scope" though. Whether it worth the
>> troubles, is what we will see. :)
> I don't think I'm inventing a new semantic. I think you already
> did that :-). The question is what we should say about it in the
> man page. I don't think being silent on this detail is the way to
> go. Perhaps noting a few details and warning the reader strongly
> against relying on this "feature" in any way is appropriate?
This is entirely up to you. My point is just that it is
not a "few details", but really a new semantic with
a notion of a sas's scope. I.e. when the control goes
out of current scope (sighandler return), sas reverts
to the one of the parent scope. Since this was not
envisioned and is unlikely needed to anyone, I was
just suggesting to not do this, but if you want to spec
this all - why not. :)

>>>> The kernel already has the sigaltstack test-case,
>>>> so maybe you can add some checks to it from your
>>>> test-case.
>>> I must admit I'm still trying to grasp some details of what's
>>> possible. What tests do you think could be usefully added?
>> If you are going to add the scoped/nested sigaltstacks,
>> then perhaps you should add the test that nesting works
>> correctly (you have that already in your test-case), and
>> maybe also the direct manipulations to uc_stack, as this
>> is the only _reliable_ way to set the new sas inside the
>> sighandler, that I can think of.
> See above. I'm not sure that we want to specify things to this
> level. But my point is that in the lack of any text in the man
> page on the topic, some user-space programmers will discover the
> feature and perhaps try to use it. The question is what the man
> page should say to those programmers. Do you see what I mean?
Yes, but I don't see what the man page should say
to those programmers. :) Or if I do, the description
would became too lengthy and complex.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
