From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Mon, 14 Jun 2010 07:10:06 +0200
Message-ID: <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org>
	<AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com>
	<20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com>
	<20100613103343.GE31464@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100613103343.GE31464-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

Aside from anything else, I'd especially like your input about si_trapn=
o below.

On Sun, Jun 13, 2010 at 12:33 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrot=
e:
> On Fri, Jun 11, 2010 at 04:46:28PM +0200, Michael Kerrisk wrote:
>> +Signal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0siginfo_t fields
>> +SIGKILL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_pid, si_uid
>> +SIGCHLD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_pid, si_uid, si_stat=
us, si_utime, si_stime
>> +SIGILL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_=
trapno
>> +SIGFPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_=
trapno
>> +SIGSEGV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_code, si_addr, si_tr=
apno
>> +SIGBUS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si_code, si_addr, si_=
trapno, si_addr_lsb
>> +SIGTRAP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_code, si_addr, si_tr=
apno
>> +SIGPOLL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_band, si_fd
>> +realtime signals > 32 =A0 =A0 si_pid, si_uid, si_value
>> +posix timer =A0 =A0 =A0 =A0 =A0 =A0 =A0 si_tid, si_overrun, si_sigv=
al
>>
>> * It duplicates info that can be found in sigaction(2).
>
> The latest version is better, but I'm pretty sure it wasn't
> like that when I submitted the pages.

That's true. I said earlier that though I didn't accept your patch, it
prompted me to make improvements to sigaction.2.

>> * It's incomplete. If you compare against the corresponding
>> information in sigaction(2) [better pull the latest page from git fo=
r
>> this comparison], there is more information about which fields are s=
et
>> by the various signals. Also, various siginfo_t fields (si_signo) ar=
e
>> missing from your table.
>
> Ok it could be listed.

This was an example. I didn't check for all incomplete pieces.

>> * It's misleading. For example, it implies that some signals set
>> si_code while others don't. But, AFAIK, all signals set this field.
>
> The point was for which signals these fields contain useful
> information.
>
> Maybe that could be clarified in a introductionary sentence though.
>
>> Likewise, it suggests that there is useful info in si_trapno, but
>> usually there is not. The entry for SIGKILL also seems strange.
>
> There is useful information in trapno for the signals where
> I listed it.

So, there may be a problem here. sigaction.2 currently states

               int      si_trapno;   /* Trap number that caused
                                        hardware-generated signal
                                        (unused on most architectures) =
*/

Is the last line true? Checking this, my reading of the source is that
si_trapno is only used on SPARC/MIPS/Alpha. (These are the
architectures that define __ARCH_SI_TRAPNO) Is that wrong? In
particular, x86 doesn't generally seem to set si_trapno, right?

> Why is SIGKILL strange?

I suspect that this should be a more general statement about signals
sent with kill(2), right? There's nothing special about SIGKILL in
this respect, AFAIK. By the way, the sigaction.2 page, has a statement
that covers this.

>> It would help if you could explain what the problem was that you wer=
e
>> trying to solve with this patch, and explain why sigaction(2) doesn'=
t
>> solve the problem.
>
> My problem was that i had to look this up in the source code because
> I couldn't find it in the manpages.

It may not be the perfect solution, but I believe you can deduce the
info you need from sigaction.2. If you still think that that is
insufficient, then I'd entertain a patch of the style you suggest, for
the sigaction.2 page, but it would need to be more complete and
accurate than the earlier patch.

> And there was no clear place to put the fields for my hwpoison extens=
ions.
>
> Also even if there's a bit redundancy I don't understand why
> that is a problem? imho the goal should be for individual
> pages be useful without having to cross reference all the time.

I don't have a problem with useful redundancy, but in combination with
the problems I listed, plus the fact that this info is probably better
on the sigaction.2 page (which shows the siginfo_t definition), I
didn't think the patch worked.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
