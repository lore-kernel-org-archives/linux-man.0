From: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Mon, 19 Jan 2009 00:54:11 +0100
Message-ID: <4973C123.9080004@ii.nl>
References: <4873E122.1010504@ii.nl>	 <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>	 <4873EBB4.4030307@ii.nl> <4873ED78.2080303@ii.nl>	 <cfd18e0f0901130113x605b09f6k724330d43e30dfce@mail.gmail.com>	 <496DD6BF.2080707@ii.nl> <cfd18e0f0901141906k539535f5nb4707d79b11f7932@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901141906k539535f5nb4707d79b11f7932-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> I spoke too soon.  I'd gone back and looked at your initial mail, seen
> mention of "betoh64" as one of the required link names, grepped for
> that in the glibc headers, and hadn't found it.  But that name is
> wrong, I think you meant "be64toh".  And indeed these interfaces are
> present in glibc 2.9.
>   

Ah, I see.

I'm very sorry for all the confusion that this one manpage has cost you.

My simple aim was: to get a standard set of htobe64() / betoh64() etc.
macros on all platforms
(OpenBSD, Linux, FreeBSD; and hopefully outward from there).

End result: complete failure.

    * OpenBSD wasn't willing to adopt <endian.h> instead of
      <sys/endian.h> for userspace apps.

      (would accomodate glibc: glibc makes a sharper distinction between
      kernel API vs. userspace C library than the *BSDs do)

    * glibc's Ulrich Drepper evidently chose to use his own naming
      scheme (be64toh), instead of adopting the original OpenBSD scheme
      (betoh64).

    * FreeBSD didn't have much interest altogether.


So, I clearly didn't hit the right notes to interest anybody in adopting
a standard.

I hope that this at least explains the situation & our grep confusion.

    With regards,
    Nanno

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
