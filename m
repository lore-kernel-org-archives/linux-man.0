From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nftw(): clarify dangling symlinks case
Date: Fri, 24 Feb 2017 18:41:10 +0100
Message-ID: <CAKgNAkjaMMg0bA896gzeM2XQRgZ9ma3Ttap-eBgE=n8g319Eeg@mail.gmail.com>
References: <xnshn7hw5i.fsf@greed.delorie.com> <23f174b0-5a52-213b-6fd8-4026c2b8fcc3@redhat.com>
 <CAKgNAki6wMCLRNZzFM975NviY-fd6gDNBTLvWZKSA2hdtb3AYA@mail.gmail.com> <4b58684c-b026-a541-8774-a0858c10ccb9@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4b58684c-b026-a541-8774-a0858c10ccb9-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: DJ Delorie <dj-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <codonell-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 24 February 2017 at 14:10, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 02/24/2017 03:58 AM, Michael Kerrisk (man-pages) wrote:
>> So, what do other implementations do? Every other implementation that
>> I looked at, does return the lstat() information for the dangling
>> symlink. I looked at Solaris, OpenBSD, FreeBSD, and musl.  All of this
>> strongly suggests that glibc got it wrong.
>
> Michael,
>
> Just because everyone else does it doesn't mean it's right, but it does
> argue strongly for a portability case or just cargo-culting from Solaris.
>
> However, what use case does that have? Why would you want the results
> of the lstat() if you specified !FTW_PHYS?

Perhaps because it's the historical behavior that always existed and
therefore was standardized in POSIX? (The more I think about this, the
more it seems clear to met that POSIX clearly specifies the behavior
that every other implementations is providing.)

> It seems to me that the lstat() is a waste of resources if the caller is
> not interested in the results.

Why? You got to know that this is a dangling symlink and you got to
know information about the symlink. Seems pretty reasonable to me.
(You could equally say that stat()  is a waste of resources in many
other cases too, since the function called back by nftw() may not need
any of the info supplied in the stat buffer.)

> I think the bug is in the POSIX spec and they should have said that the
> results of the stat buffer are undefined.

I disagree. By and large POSIX standardizes existing implementation
behavior. The evidence suggests that that is what has happened in this
case also. (I do not know this for sure, of course. But 4/4
implementations is a fairly strong argument, I'd say.)

> This should go to the Austin Group for clarification.

I think POSIX is actualy rather clear already...

> Could you please ask the Austin Group[1] to clarify what is the result of
> the stat buffer for dangling symlinks? Please post the bug once filed so
> the rest of us can comment and provide our own guidance.

But why? The glibc implementation should ideally do what every other
implementation seems to do. Conversely: what's the argument for not
fixing it?

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
