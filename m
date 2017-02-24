From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] nftw(): clarify dangling symlinks case
Date: Fri, 24 Feb 2017 08:10:14 -0500
Message-ID: <4b58684c-b026-a541-8774-a0858c10ccb9@redhat.com>
References: <xnshn7hw5i.fsf@greed.delorie.com>
 <23f174b0-5a52-213b-6fd8-4026c2b8fcc3@redhat.com>
 <CAKgNAki6wMCLRNZzFM975NviY-fd6gDNBTLvWZKSA2hdtb3AYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki6wMCLRNZzFM975NviY-fd6gDNBTLvWZKSA2hdtb3AYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: DJ Delorie <dj-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <codonell-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/24/2017 03:58 AM, Michael Kerrisk (man-pages) wrote:
> So, what do other implementations do? Every other implementation that
> I looked at, does return the lstat() information for the dangling
> symlink. I looked at Solaris, OpenBSD, FreeBSD, and musl.  All of this
> strongly suggests that glibc got it wrong.

Michael,

Just because everyone else does it doesn't mean it's right, but it does
argue strongly for a portability case or just cargo-culting from Solaris.

However, what use case does that have? Why would you want the results 
of the lstat() if you specified !FTW_PHYS?

It seems to me that the lstat() is a waste of resources if the caller is
not interested in the results.

I think the bug is in the POSIX spec and they should have said that the
results of the stat buffer are undefined.

This should go to the Austin Group for clarification.

DJ,

Could you please ask the Austin Group[1] to clarify what is the result of
the stat buffer for dangling symlinks? Please post the bug once filed so
the rest of us can comment and provide our own guidance.

-- 
Cheers,
Carlos.

[1] http://austingroupbugs.net/main_page.php
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
