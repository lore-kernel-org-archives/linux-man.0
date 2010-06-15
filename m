From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Tue, 15 Jun 2010 07:25:36 +0200
Message-ID: <AANLkTikvazub4Ni-3aL4CFhimfVoTYz4xI1FskFUMSGd@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org>
	<AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com>
	<20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com>
	<20100613103343.GE31464@basil.fritz.box> <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0@mail.gmail.com>
	<20100614082054.GD17092@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100614082054.GD17092-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Mon, Jun 14, 2010 at 10:20 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrot=
e:
> On Mon, Jun 14, 2010 at 07:10:06AM +0200, Michael Kerrisk wrote:
>> >> * It's incomplete. If you compare against the corresponding
>> >> information in sigaction(2) [better pull the latest page from git=
 for
>> >> this comparison], there is more information about which fields ar=
e set
>> >> by the various signals. Also, various siginfo_t fields (si_signo)=
 are
>> >> missing from your table.
>> >
>> > Ok it could be listed.
>>
>> This was an example. I didn't check for all incomplete pieces.
>
> What else should be missing?

I'm not sure. si_signo was one that immediately jumped out at me. I
didn't exhaustively check. Another quick scan doesn't show anything
else obviously missing.

> I generated the table by looking at the trap handlers.
>
>> >> Likewise, it suggests that there is useful info in si_trapno, but
>> >> usually there is not. The entry for SIGKILL also seems strange.
>> >
>> > There is useful information in trapno for the signals where
>> > I listed it.
>>
>> So, there may be a problem here. sigaction.2 currently states
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int =A0 =A0 =A0si_trapno; =A0 /* Trap=
 number that caused
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 hardware-generated signal
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (unused on most architectures) */
>>
>> Is the last line true? Checking this, my reading of the source is th=
at
>
> It's not true.
>
> I think it's also needed in some cases to figure out what exactly
> happened, although in most cases code gives this information.
>
>> si_trapno is only used on SPARC/MIPS/Alpha. (These are the
>> architectures that define __ARCH_SI_TRAPNO) Is that wrong? In
>> particular, x86 doesn't generally seem to set si_trapno, right?
>
> arch/x86/kernel/signal.c:162: =A0 =A0 =A0 =A0 =A0 =A0 put_user_ex(cur=
rent->thread.trap_no, &sc->trapno);

Okay -- so at this point I plead ignorance/blindness. These are the
things that confuse me (and I admit not being able to follow all the
kernel code convolutions here):

1. It's not clear to me how the information in sc->trapno then gets
into siginfo_t.si_trapno. The line you quote above appears to me to
result in a change in the ucontext structure given as the third
argument of the handler (but that's partly a guess).

2. In kernel/signal.c, we have:

#ifdef __ARCH_SI_TRAPNO
                err |=3D __put_user(from->si_trapno, &to->si_trapno);
#endif

But __ARCH_SI_TRAPNO appears not to be set on x86. In fact, only
SPARC, MIPS, and Alpha seem to set it.

3. In the siginfo_t structure that glibc provides to userspace, there
is the following:

#ifdef __ARCH_SI_TRAPNO
#define si_trapno       _sifields._sigfault._trapno
#endif

And on x86, this means that si_trapno is not in the structure.

What have I missed?

>> > Why is SIGKILL strange?
>>
>> I suspect that this should be a more general statement about signals
>> sent with kill(2), right? There's nothing special about SIGKILL in
>> this respect, AFAIK. By the way, the sigaction.2 page, has a stateme=
nt
>> that covers this.
>
> It was more a comparison to non KILL signals, but ok
> you're right RT signals would need to be listed too.

In principle, I'd accept a patch like you suggest for sigaction.2 --
probably by the time we finish this discussion, I'll be able to write
it myself ;-).

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
