From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux man pages: pthread_create(3): oddball comment
Date: Mon, 27 May 2013 04:49:05 +0200
Message-ID: <51A2C9A1.8010609@gmail.com>
References: <CAOhNY-8fhrBTvvZdegz2oXxJ8J-6gc6vQVe3nXWtNnizQ4yRuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOhNY-8fhrBTvvZdegz2oXxJ8J-6gc6vQVe3nXWtNnizQ4yRuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anthony Foiani <anthony.foiani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/24/13 06:58, Anthony Foiani wrote:
> Greetings.
> 
> The man page for pthread_create:
> 
> http://man7.org/linux/man-pages/man3/pthread_create.3.html
> 
> Has some example code at the bottom; one of the invocations includes
> this bit of commentary:
> 
>            8192            # The stack size limit is 8 MB (0x80000 bytes)
> 
> I had to stare at that a bit; I believe it should actually be 0x800000
> (note 5 zeros, not 4).

Yes, of course you are right! I'll fix. Thanks for reporting the problem.

> (I do wish that we -- the computing community -- had managed to come
> up with a sane digits separator for hex, but oh well.  0x80_0000
> maybe?  0x80'0000?  just 0x80,0000?)

Actually, D get's this right -- it allows free use of underscores 
in numeric literals.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
