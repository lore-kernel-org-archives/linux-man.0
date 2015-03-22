From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] seccomp.2: Explain arch checking, value (non-)truncation,
 expand example
Date: Sun, 22 Mar 2015 16:58:17 +0100
Message-ID: <CAKgNAkjsNCQSCmpxgeo9Vq6oEHzUzWgT8rz5Bec6=Pqgtwi4Tw@mail.gmail.com>
References: <20150316180154.GA10663@pc.thejh.net> <CAGXu5j+mjC4HQWbJVSDb+gSTud=R1+UCBJBY8ysQuj9NETrSEQ@mail.gmail.com>
 <20150316233457.GA9227@pc.thejh.net>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150316233457.GA9227@pc.thejh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jann Horn <jann@thejh.net>
Cc: Kees Cook <keescook@chromium.org>, linux-man <linux-man@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
List-Id: linux-man@vger.kernel.org

Hi Jann,

Thanks for working on this page. I'm a little unclear at this point.
Am I correct to assume you are going to revise this patch in the light
of Kees's comments and send a new patch?

Thanks,

Michael


On 17 March 2015 at 00:34, Jann Horn <jann@thejh.net> wrote:
> On Mon, Mar 16, 2015 at 03:25:56PM -0700, Kees Cook wrote:
>> On Mon, Mar 16, 2015 at 11:01 AM, Jann Horn <jann@thejh.net> wrote:
>> > Document some more-or-less surprising things about seccomp.
>> > I'm not sure whether changing the example code like that is a
>> > good idea - maybe that part of the patch should be left out?
>> >
>> > Demo code for the X32 issue:
>> > https://gist.github.com/thejh/c5b670a816bbb9791a6d
>> >
>> > Demo code for full 64bit registers being visible in seccomp
>> > if the i386 ABI is used on a 64bit system:
>> > https://gist.github.com/thejh/c37b27aefc44ab775db5
>>
>> So, it is probably worth noting the x32 ABI somewhere, and seccomp.2
>> is probably reasonable, though maybe it should be explicitly detailed
>> in syscall.2?
>
> I guess that would be sensible. However, I still think that the seccomp
> manpage should mention it, too, or advise the reader to also carefully
> read the syscall.2 manpage.
>
>
>> In the seccomp.2 manpage, though, I think we should discourage
>> blacklisting, since whitelisting is a much more effective way to do
>> attack surface reduction on syscalls. (And, as such, x32 would be
>> already eliminated from x86-64 filters.)
>
> I agree, whitelisting should be encouraged. However, as far as I can
> tell, people use seccomp not only for proper, strict sandboxing, but
> also to e.g. fix small security problems in containers or to provide
> additional precautions for them. In that case, I think that the use
> of a blacklist is more understandable, and various project use
> seccomp that way or at least support the use of blacklists: The
> default policy of LXC is a blacklist, sandstorm.io uses a seccomp
> blacklist and blacklists specific ptrace calls, systemd-nspawn uses a
> blacklist (although the manpage says that that's meant as a precaution
> against accidental damage, not as a security measure), systemd
> supports both whitelists and blacklists in the SystemCallFilter
> directive.
>
>
>> It is, however, reasonable to update the example just so it can be
>> super-explicit, though I'd change the comments to say something more
>> direct about the whitelisting vs blacklisting, like "While this
>> example uses whitelisting,
>
> You mean you would want to change the example to use whitelisting?
> That sounds like a good idea.
>
>
>> this is how an overlapping syscall ABI
>> could be tested." or something. Additionally, I think it would be
>> better to test for >= instead of & to avoid having to reload the
>> syscall nr.
>
> Yes, sounds good.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
