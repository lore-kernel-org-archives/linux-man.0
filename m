From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Wed, 24 May 2017 13:09:48 +0200
Message-ID: <026308b5-4e92-4439-1eb2-82b67584d548@gmail.com>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
 <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Oleg Nesterov <oleg@redhat.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Stas,

On 05/24/2017 01:01 AM, Stas Sergeev wrote:
> 23.05.2017 15:26, Michael Kerrisk (man-pages) пишет:
>>>>> and posix seems to allow any
>>>>> other value for enable, which can be (on linux) SS_ONSTACK,
>>>>> not only 0.
>>>> Yes, long ago someone got confused, as I've noted in a recently added
>>>> BUGS section in the page:
>>> But my understanding differs.
>>> http://pubs.opengroup.org/onlinepubs/009695399/functions/sigaltstack.html
>>> ---
>>> The /ss_flags/ member specifies the new stack state.
>>> If it is set to SS_DISABLE, the stack is disabled and /ss_sp/
>>> and /ss_size/ are ignored. Otherwise, the stack shall be enabled
>>> ---
>>>
>>> As you can see, it doesn't say "SS_DISABLE or 0 are
>>> only possible values". It does not even mention 0 at all
>>> as being a possible or suggested value, it only uses it in
>>> an example.

I missed this point earlier, but I think that detail is also relevant.

>>> So what you call a confusion, looks valid to me, according
>>> to the above spec.
>> I think this is a misreading of the spec. The spec is saying that
>>
>>      (ss_flags & SS_DISABLE) != 0
>>
>> means disable the stack and
>>
>>      (ss_flags & SS_DISABLE) == 0
>>
>> means disable the stack.
> You probably meant to say "enable" somewhere along
> the lines.

Yes.

> Could you please point and cite the spec that says
> exactly this?

I take your point: the text of the spec could be more precise. It
does not provide a complete support for my assertion. 

But, I do think the interpretation I suggest is the more natural one, 
for many reasons:

1. The field is named '*flags', which commonly means a bit mask.
2. The example in that you mention that is in the spec is part of 
   the spec. It illustrates the understanding of the developers
   of the spec about the interface they were specifying.
3. Various existing implementations treat the field as a bit mask
   for which there is only one valid bit (SS_DISABLE), doing
   tests of the form (ss.ss_flags & SS_DISABLE).
4. Some implementations (including *all* the ones that I looked at 
   the source code for, that is Illumos, FreeBSD, OpenBSD)
   explicitly error if ss.ss_flags has bits other than SS_DISABLE set.
5. The man pages on Solaris and Irix explicitly note that SS_DISABLE
   is the only value (other than no value, i.e., 0) that may be
   placed in ss.ss_flags. No man page that I can find suggests the 
   use of SS_ONSTACK in ss.ss_flags.
6. Before kernel 2.4 (Jan 2001), Linux also used to do 3 & 4!
7. Re points 3 and 4, POSIX/SUS normally specifies existing behavior.
   The SUS specification of sigaltstack() dates back at least to 
   1994 (SUSv1). This presumably means that the text came from 
   the original POSIX.1-1990. The SUSv1 spec includes the example
   code snippet.
8. The standard explicitly mentions that SS_ONSTACK may be returned
   in old_ss.ss_flags, but makes no mention of the use of SS_ONSTACK 
   in ss.ss_flags. That fact should, IMO, be taken as a strong hint
   that the standard developers did not believe that SS_ONSTACK was
   to be used with ss.ss_flags.

On top of the above (to repeat what I already said earlier):

* SS_ONSTACK in ss.ss_flags is a no-op on Linux.
* SS_ONSTACK in ss.ss_flags in flags explicitly errors on various
  implementations (see points 4 and 6 above).
   
>> POSIX.1 make no statement about the use of SS_ONSTACK to enable the
>> stack.
> Unfortunately the spec mentions only "SS_DISABLE"
> and "otherwise". So the one can assume "SS_DISABLE+1",
> "SS_DISABLE-1" and "SS_DISABLE+100" to enable sas,
> but never 0.

That's a possible reading of the standard, but not a natural one I 
would say, given the points above.

> 0 can be assumed _only_ if you know exactly that
> flags is a bit-mask and SS_DISABLE is its (only possible)
> bit. You claim above that "spec is saying" it to be a bit-mask.
> Unfortunately I haven't seen such spec, and until that
> I assume SS_DISABLE is a value, not a bit of bitmask.
> And the value can itself be 0, so unless the spec is very
> clear on this (and it is likely not), I assume it is much
> safer to use SS_ONSTACK for the very simple fact: it is
> guaranteed to not be equal to SS_DISABLE, while 0,

That's my point. It is not safe: it breaks portability.

> with my understanding of spec, is not guaranteed to
> be different from SS_DISABLE.
> 
>>   And as far as I know, no other implementation attaches meaning
>> to SS_ONSTACK when establishing a signal stack. Some systems' man
>> pages are loosely worded in the manner of POSIX, but others are quite
>> explicit, with Solaris 8 and Irix 6.5 containing text such as the
>> following:
>>
>>       If    ss is not NULL,    it points to a structure specifying the
>>    alternate
>>       signal stack that will take effect    upon return from sigaltstack.  [...]
>>      The ss_flags field specifies the new stack state and may be set
>>       to    the following:
>>
>>       SS_DISABLE       The stack is    to be disabled and ss_sp and ss_size are
>>             ignored.  If    SS_DISABLE is not set, the stack will be
>>             enabled.
>>
>> The strong implication there is that no value other than SS_DISABLE is
> I guess you take "SS_DISABLE is not set" as a witness that
> it is a bitmask, but I wonder if that solaris-specific witness
> is strong enough to claim that the linux implementation is
> a confusion...

It's not just Solaris specific. By now we have Solaris (Illumos), 
FreeBSD, OpenBSD, and Irix. How many more do you need ? :-)

>> meaningful in ss.ss_flags. No other man page that I could find (and I
>> have quite a collection) suggested the (ss.ss_flags == SSONSTACK) is
>> meaningful.
> SS_ONSTACK is meaningful in a sense to always be != SS_DISABLE.
> 
>> So, using SS_ONSTACK on Linux is a no-op that decreases code
>> portability. (And I am supposing that you use (ss.ss_flags ==
>> SS_ONSTACK) only because you've been misled into thinking its
>> legitimate from reading the kernel source.)
> How about me supposing you use SS_DISABLE as a bitmask
> only because you took that view from the opensolaris and
> freebsd sources? :)

Well, you could suppose that :-). But actually, it's from my reading
of the standards 15+ years ago. (I only read the opensolkaris and 
FreeBSD source code yesterday.)

> Well, this is definitely under-specced, so we are unlikely to
> find any kind of "truth" here. But I am disappointed with the
> fact that the linux implementation was called a "confusion"
> based on a very small evidence from the solaris man page.

Solaris (Illumos), FreeBSD, OpenBSD, Irix...

> IMHO to put such claims into a man page, the one had to
> open a defect report to posix, asking them to clarify first.
> And even if they confirm this view, the linux implementation
> should not be regarded as a confusion, but as a "consequence
> of the ambiguous wording in posix".

One could do this I suppose, but I read POSIX differently from
you and, more importantly, SS_ONSTACK breaks portability on 
numerous other systems and is a no-op on Linux. So, the Linux man 
page really should warn against its use in the strongest terms.

>>>>     [SIGA is delivered]
>>>>
>>>> * Handler for SIGA is called and handler is executed on alternate SS 1.
>>>> ]]
>>>>
>>>> Summary: setting up another alternate signal stack seems to "work".
>>> Only if you deliver SIGB while still inside SIGA handler,
>>> which is a bit unusual. Certainly not worth calling this
>>> "works" IMHO. The fact that this will be undone at SIGA
>>> exit, is much more confusing to the user, so I'd say just
>>> don't do that.
>> I agree that it is an unusual scenario. But, user-space programmers
>> outnumber kernel developers 10000 to 1, and over time they will find
>> every possible way to creatively use an API if it "works for them".
> Another danger is someone trying to set up the
> same sas before exiting from the sighandler. If
> they set up same sas and get nested handler, the
> stack will be corrupted. This was not possible before,
> because without SS_AUTODISARM you'd get EPERM
> in such case.
> 
>>>> API history is littered with stories where users found out that
>>>> something unforeseen "worked", and so they used it. The question
>>>> is: what can go wrong if people do try using this "feature"?
>>> It will disappear at the exit from SIGA.
>>> To me this is "wrong enough" to not suggest doing so.
>> See my comment above. It's weird because it will disappear at exit
>> from SIGA, but not "wrong".
> What do you mean?
> There was no any notion of the "sigaltstack scope",
> so with the existing semantic it is wrong, because
> currently sigaltstack has no scope and can't change

I'm not sure what you mean by "currently" here. I'm pointing
out that whereas before one could not change the signal stack 
while executing a handler that is using a signal stack, now it
seems to be possible. But, it's not random: the programmer must
explicitly make this happen (and be lucky in the timing of signals).

> at random moments. You can make it "not wrong"
> by inventing a new semantic with some notion of
> the "sigaltstack scope" though. Whether it worth the
> troubles, is what we will see. :)

I don't think I'm inventing a new semantic. I think you already 
did that :-). The question is what we should say about it in the 
man page. I don't think being silent on this detail is the way to
go. Perhaps noting a few details and warning the reader strongly
against relying on this "feature" in any way is appropriate?

>>> The kernel already has the sigaltstack test-case,
>>> so maybe you can add some checks to it from your
>>> test-case.
>> I must admit I'm still trying to grasp some details of what's
>> possible. What tests do you think could be usefully added?
> If you are going to add the scoped/nested sigaltstacks,
> then perhaps you should add the test that nesting works
> correctly (you have that already in your test-case), and
> maybe also the direct manipulations to uc_stack, as this
> is the only _reliable_ way to set the new sas inside the
> sighandler, that I can think of.

See above. I'm not sure that we want to specify things to this
level. But my point is that in the lack of any text in the man 
page on the topic, some user-space programmers will discover the
feature and perhaps try to use it. The question is what the man 
page should say to those programmers. Do you see what I mean?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
