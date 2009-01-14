From: Nanno Langstraat <nal-lQF5CfOoLd8@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Wed, 14 Jan 2009 13:12:47 +0100
Message-ID: <496DD6BF.2080707@ii.nl>
References: <4873E122.1010504@ii.nl>	 <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>	 <4873EBB4.4030307@ii.nl> <4873ED78.2080303@ii.nl> <cfd18e0f0901130113x605b09f6k724330d43e30dfce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901130113x605b09f6k724330d43e30dfce-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> Nanno,
>   
> These functions don't seem to have made it into glibc 2.9.  Do you
> know any more about this?
>   

No, I have not had any other communications about those macros in the
intervening time.


However, the following CVSweb page for file 'string/endian.h' with tag
'glibc-2_9' implies that it should be in glibc 2.9:
http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/string/endian.h?cvsroot=glibc&only_with_tag=glibc-2_9


Is there a difference between this CVSweb tag 'glibc-2_9' and the real
glibc 2.9?

Note that the macros are only activated #ifdef __USE_BSD.

    Regards,
    Nanno

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
