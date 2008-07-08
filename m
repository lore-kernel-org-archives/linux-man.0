From: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Wed, 09 Jul 2008 00:35:32 +0200
Message-ID: <4873EBB4.4030307@ii.nl>
References: <4873E122.1010504@ii.nl> <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807081522u710a15e1wa1a513843e46ee2f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> On Tue, Jul 8, 2008 at 11:50 PM, Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org> wrote:
>   
>> A few months ago Ulrich Drepper added a family of byteorder conversion
>> macros to glibc.
>>     
>
> What version of glibc do these appear in?  I can't find them in the
> headers or source for glibc 2.8.
>   

In the manpage, I describe it as:
>> .SH VERSIONS
>> These function were added to GNU glibc version 2.8.90.
>>     
which I guesstimated from the CVS tags.

Here's the CVS log:
 
http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/string/endian.h?cvsroot=glibc

See revisions 1.9 and 1.10.

    Regards,
    Nanno

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
