From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: printf 3
Date: Wed, 05 Oct 2011 01:04:10 +0100
Message-ID: <4E8B9EFA.8020100@jguk.org>
References: <4E8A4C32.9000607@jguk.org> <CAKgNAkgrL4tXZmrLaauLNxSv7rngKxsnkk8pWA1AoP1urk-_5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgrL4tXZmrLaauLNxSv7rngKxsnkk8pWA1AoP1urk-_5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote, On 04/10/11 06:46:
> Hi Jon,
>
> On Tue, Oct 4, 2011 at 1:58 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org>  wrote:
>> Hello
>>
>> Looking at this page:
>> http://man7.org/linux/man-pages/online/pages/man3/printf.3.html
>>
>> "If an output error is encountered, a negative value is returned."
>>
>> I am thinking if this could be clarified. If I call printf(NULL), errno is
>> set to EINVAL, and -1 is returned.
>>
>> Perhaps could be expanded to add:
>>
>> "If a parameter error is encountered, errno set to EINVAL, and -1 is
>> returned. If an output error is encountered, errno set EIO and -1 returned.
>
> The apparently vague wording is deliberate. Glibc may generally return
> -1, but POSIX simply says "a negative value", and that's all that is
> guaranteed to an application.

Ah ok. Good point.

Is it worth documenting the Glibc behaviour on the man page in addition 
to explaining POSIX spec.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
