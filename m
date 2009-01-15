From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Thu, 15 Jan 2009 16:06:41 +1300
Message-ID: <cfd18e0f0901141906k539535f5nb4707d79b11f7932@mail.gmail.com>
References: <4873E122.1010504@ii.nl>
	 <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>
	 <4873EBB4.4030307@ii.nl> <4873ED78.2080303@ii.nl>
	 <cfd18e0f0901130113x605b09f6k724330d43e30dfce@mail.gmail.com>
	 <496DD6BF.2080707@ii.nl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <496DD6BF.2080707-lQF5CfOoLd8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nanno Langstraat <nal-lQF5CfOoLd8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Nanno,

On Thu, Jan 15, 2009 at 1:12 AM, Nanno Langstraat <nal-lQF5CfOoLd8@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> Nanno,
>>
>> These functions don't seem to have made it into glibc 2.9.  Do you
>> know any more about this?
>>
>
> No, I have not had any other communications about those macros in the
> intervening time.
>
>
> However, the following CVSweb page for file 'string/endian.h' with tag
> 'glibc-2_9' implies that it should be in glibc 2.9:
> http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/string/endian.h?cvsroot=glibc&only_with_tag=glibc-2_9
>
>
> Is there a difference between this CVSweb tag 'glibc-2_9' and the real
> glibc 2.9?
>
> Note that the macros are only activated #ifdef __USE_BSD.

I spoke too soon.  I'd gone back and looked at your initial mail, seen
mention of "betoh64" as one of the required link names, grepped for
that in the glibc headers, and hadn't found it.  But that name is
wrong, I think you meant "be64toh".  And indeed these interfaces are
present in glibc 2.9.

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
