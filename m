From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] seccomp.2: Explain arch checking, value (non-)truncation,
 expand example
Date: Tue, 17 Mar 2015 10:23:08 -0700
Message-ID: <CAGXu5jLG_nnRXoRjxS0qJ2H5abt4VwCwg-ULO075Jj6ZNuEqaA@mail.gmail.com>
References: <20150316180154.GA10663@pc.thejh.net>
	<CAGXu5j+mjC4HQWbJVSDb+gSTud=R1+UCBJBY8ysQuj9NETrSEQ@mail.gmail.com>
	<20150316233457.GA9227@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316233457.GA9227-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 16, 2015 at 4:34 PM, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> wrote:
> On Mon, Mar 16, 2015 at 03:25:56PM -0700, Kees Cook wrote:
>> On Mon, Mar 16, 2015 at 11:01 AM, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> wrote:
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

Yeah, I think both should include it.

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

Oh man, I clearly didn't have enough coffee. Yeah, the example is
blacklisting, isn't it? Let's leave that alone and just add the mask
check, as you recommended. I still think it should avoid the AND so we
don't have to reload the syscall nr, though.

Thanks!

-Kees

>
>
>> this is how an overlapping syscall ABI
>> could be tested." or something. Additionally, I think it would be
>> better to test for >= instead of & to avoid having to reload the
>> syscall nr.
>
> Yes, sounds good.



-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
