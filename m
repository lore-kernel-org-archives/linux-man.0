From: Anthony Foiani <anthony.foiani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux man pages: pthread_create(3): oddball comment
Date: Mon, 3 Jun 2013 08:56:58 -0600
Message-ID: <CAOhNY--=+LJMsMU+xhR=FOnXp1yAwM9NR9JXXzLvNaMqOWHHoQ@mail.gmail.com>
References: <CAOhNY-8fhrBTvvZdegz2oXxJ8J-6gc6vQVe3nXWtNnizQ4yRuQ@mail.gmail.com>
	<51A2C9A1.8010609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51A2C9A1.8010609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael --

On Sun, May 26, 2013 at 8:49 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 05/24/13 06:58, Anthony Foiani wrote:
>> Greetings.
>>
>> The man page for pthread_create:
>>
>> http://man7.org/linux/man-pages/man3/pthread_create.3.html
>>
>> Has some example code at the bottom; one of the invocations includes
>> this bit of commentary:
>>
>>            8192            # The stack size limit is 8 MB (0x80000 bytes)
>>
>> I had to stare at that a bit; I believe it should actually be 0x800000
>> (note 5 zeros, not 4).
>
> Yes, of course you are right! I'll fix. Thanks for reporting the problem.

You're welcome.  Thank *you* for your work on this project!

And looking at it again, depending on your taste, "8 MiB" might
actually be more correct.  (I rather like the binary prefixes, but I
realize that there is still some division of opinion.)

> Actually, D get's this right -- it allows free use of underscores
> in numeric literals.

Indeed.  Perl does as well.

I just wish there were something that all the languages agreed upon
(or, at least, most; e.g., "0x" is a nearly universal, other than some
assemblers (IIRC) that used "$".)

Anyway.  Water well under the bridge by now.

Best regards,
Anthony Foiani
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
