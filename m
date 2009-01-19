From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Mon, 19 Jan 2009 13:20:05 +1300
Message-ID: <cfd18e0f0901181620i49427bfen35d632cdc356721e@mail.gmail.com>
References: <4873E122.1010504@ii.nl>
	 <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>
	 <4873EBB4.4030307@ii.nl> <4873ED78.2080303@ii.nl>
	 <cfd18e0f0901130113x605b09f6k724330d43e30dfce@mail.gmail.com>
	 <496DD6BF.2080707@ii.nl>
	 <cfd18e0f0901141906k539535f5nb4707d79b11f7932@mail.gmail.com>
	 <4973C123.9080004@ii.nl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4973C123.9080004-lQF5CfOoLd8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nanno,

On Mon, Jan 19, 2009 at 12:54 PM, Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> I spoke too soon.  I'd gone back and looked at your initial mail, seen
>> mention of "betoh64" as one of the required link names, grepped for
>> that in the glibc headers, and hadn't found it.  But that name is
>> wrong, I think you meant "be64toh".  And indeed these interfaces are
>> present in glibc 2.9.
>>
>
> Ah, I see.
>
> I'm very sorry for all the confusion that this one manpage has cost you.

No problem.

> My simple aim was: to get a standard set of htobe64() / betoh64() etc.
> macros on all platforms
> (OpenBSD, Linux, FreeBSD; and hopefully outward from there).
>
> End result: complete failure.
>
>    * OpenBSD wasn't willing to adopt <endian.h> instead of
>      <sys/endian.h> for userspace apps.

I assume OpenBSD has had these macros for a while.  Do you know how long?

>      (would accomodate glibc: glibc makes a sharper distinction between
>      kernel API vs. userspace C library than the *BSDs do)
>
>    * glibc's Ulrich Drepper evidently chose to use his own naming
>      scheme (be64toh), instead of adopting the original OpenBSD scheme
>      (betoh64).

That's very unfortunate.

>    * FreeBSD didn't have much interest altogether.

Not sure what you mean with this last sentence?  FreeBSD seems to have
these functions also, with names the same as OpenBSD.

> So, I clearly didn't hit the right notes to interest anybody in adopting
> a standard.

:-(

> I hope that this at least explains the situation & our grep confusion.

Yes, that clarifies things, and also means that I have to fix things
in the man page, since there I say that the same functions exist on
the BSDs.  However, the names of some of them are different, as you
point out (I hadn't noticed that).

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
