From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: linux strlen man page accepts NULL?
Date: Fri, 7 Aug 2009 21:51:22 +0200
Message-ID: <cfd18e0f0908071251h27d2d7d6o4c7d8ae2a4c1913f@mail.gmail.com>
References: <19ac3f7a0908070455s33ecb5efo6810eb7959df1f70@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19ac3f7a0908070455s33ecb5efo6810eb7959df1f70-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jon,

On Fri, Aug 7, 2009 at 1:55 PM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> wrote:
> Looking at this man page:
>
> http://linux.die.net/man/3/strlen
>
> Should it not mention that a NULL address is a valid param? Or is it
> not a valid param?

What makes you think it is a valid parameter?

> On most systems NULL is a special error pointer.

I don't understand what you mean with this last sentence. Please explain.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
