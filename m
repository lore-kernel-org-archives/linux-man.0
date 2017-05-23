From: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Wed, 24 May 2017 02:01:19 +0300
Message-ID: <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-MW
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

23.05.2017 15:26, Michael Kerrisk (man-pages) пишет:
>>>> and posix seems to allow any
>>>> other value for enable, which can be (on linux) SS_ONSTACK,
>>>> not only 0.
>>> Yes, long ago someone got confused, as I've noted in a recently added
>>> BUGS section in the page:
>> But my understanding differs.
>> http://pubs.opengroup.org/onlinepubs/009695399/functions/sigaltstack.html
>> ---
>> The /ss_flags/ member specifies the new stack state.
>> If it is set to SS_DISABLE, the stack is disabled and /ss_sp/
>> and /ss_size/ are ignored. Otherwise, the stack shall be enabled
>> ---
>>
>> As you can see, it doesn't say "SS_DISABLE or 0 are
>> only possible values". It does not even mention 0 at all
>> as being a possible or suggested value, it only uses it in
>> an example.
>> So what you call a confusion, looks valid to me, according
>> to the above spec.
> I think this is a misreading of the spec. The spec is saying that
>
>      (ss_flags & SS_DISABLE) != 0
>
> means disable the stack and
>
>      (ss_flags & SS_DISABLE) == 0
>
> means disable the stack.
You probably meant to say "enable" somewhere along
the lines.
Could you please point and cite the spec that says
exactly this?

> POSIX.1 make no statement about the use of SS_ONSTACK to enable the
> stack.
Unfortunately the spec mentions only "SS_DISABLE"
and "otherwise". So the one can assume "SS_DISABLE+1",
"SS_DISABLE-1" and "SS_DISABLE+100" to enable sas,
but never 0.
0 can be assumed _only_ if you know exactly that
flags is a bit-mask and SS_DISABLE is its (only possible)
bit. You claim above that "spec is saying" it to be a bit-mask.
Unfortunately I haven't seen such spec, and until that
I assume SS_DISABLE is a value, not a bit of bitmask.
And the value can itself be 0, so unless the spec is very
clear on this (and it is likely not), I assume it is much
safer to use SS_ONSTACK for the very simple fact: it is
guaranteed to not be equal to SS_DISABLE, while 0,
with my understanding of spec, is not guaranteed to
be different from SS_DISABLE.

>   And as far as I know, no other implementation attaches meaning
> to SS_ONSTACK when establishing a signal stack. Some systems' man
> pages are loosely worded in the manner of POSIX, but others are quite
> explicit, with Solaris 8 and Irix 6.5 containing text such as the
> following:
>
>       If    ss is not NULL,    it points to a structure specifying the
>    alternate
>       signal stack that will take effect    upon return from sigaltstack.  [...]
>      The ss_flags field specifies the new stack state and may be set
>       to    the following:
>
>       SS_DISABLE       The stack is    to be disabled and ss_sp and ss_size are
>             ignored.  If    SS_DISABLE is not set, the stack will be
>             enabled.
>
> The strong implication there is that no value other than SS_DISABLE is
I guess you take "SS_DISABLE is not set" as a witness that
it is a bitmask, but I wonder if that solaris-specific witness
is strong enough to claim that the linux implementation is
a confusion...

> meaningful in ss.ss_flags. No other man page that I could find (and I
> have quite a collection) suggested the (ss.ss_flags == SSONSTACK) is
> meaningful.
SS_ONSTACK is meaningful in a sense to always be != SS_DISABLE.

> So, using SS_ONSTACK on Linux is a no-op that decreases code
> portability. (And I am supposing that you use (ss.ss_flags ==
> SS_ONSTACK) only because you've been misled into thinking its
> legitimate from reading the kernel source.)
How about me supposing you use SS_DISABLE as a bitmask
only because you took that view from the opensolaris and
freebsd sources? :)
Well, this is definitely under-specced, so we are unlikely to
find any kind of "truth" here. But I am disappointed with the
fact that the linux implementation was called a "confusion"
based on a very small evidence from the solaris man page.
IMHO to put such claims into a man page, the one had to
open a defect report to posix, asking them to clarify first.
And even if they confirm this view, the linux implementation
should not be regarded as a confusion, but as a "consequence
of the ambiguous wording in posix".

>>>     [SIGA is delivered]
>>>
>>> * Handler for SIGA is called and handler is executed on alternate SS 1.
>>> ]]
>>>
>>> Summary: setting up another alternate signal stack seems to "work".
>> Only if you deliver SIGB while still inside SIGA handler,
>> which is a bit unusual. Certainly not worth calling this
>> "works" IMHO. The fact that this will be undone at SIGA
>> exit, is much more confusing to the user, so I'd say just
>> don't do that.
> I agree that it is an unusual scenario. But, user-space programmers
> outnumber kernel developers 10000 to 1, and over time they will find
> every possible way to creatively use an API if it "works for them".
Another danger is someone trying to set up the
same sas before exiting from the sighandler. If
they set up same sas and get nested handler, the
stack will be corrupted. This was not possible before,
because without SS_AUTODISARM you'd get EPERM
in such case.

>>> API history is littered with stories where users found out that
>>> something unforeseen "worked", and so they used it. The question
>>> is: what can go wrong if people do try using this "feature"?
>> It will disappear at the exit from SIGA.
>> To me this is "wrong enough" to not suggest doing so.
> See my comment above. It's weird because it will disappear at exit
> from SIGA, but not "wrong".
What do you mean?
There was no any notion of the "sigaltstack scope",
so with the existing semantic it is wrong, because
currently sigaltstack has no scope and can't change
at random moments. You can make it "not wrong"
by inventing a new semantic with some notion of
the "sigaltstack scope" though. Whether it worth the
troubles, is what we will see. :)

>> The kernel already has the sigaltstack test-case,
>> so maybe you can add some checks to it from your
>> test-case.
> I must admit I'm still trying to grasp some details of what's
> possible. What tests do you think could be usefully added?
If you are going to add the scoped/nested sigaltstacks,
then perhaps you should add the test that nesting works
correctly (you have that already in your test-case), and
maybe also the direct manipulations to uc_stack, as this
is the only _reliable_ way to set the new sas inside the
sighandler, that I can think of.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
