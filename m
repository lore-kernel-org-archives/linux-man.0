From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: Is there a way to get "EINVAL" style string
Date: Tue, 08 May 2012 22:33:45 +0100
Message-ID: <4FA99139.90102@jguk.org>
References: <4F93E7FC.1020904@jguk.org> <CAKgNAkjP-SZXceGDaBeuNE9onk_w9-8rX1uk-XE2dRu5x8uz_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjP-SZXceGDaBeuNE9onk_w9-8rX1uk-XE2dRu5x8uz_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On 22/04/12 22:25, Michael Kerrisk (man-pages) wrote:
> Hi Jon,
>
> On Sun, Apr 22, 2012 at 11:14 PM, Jon Grant<jg-hus3n9K41k0@public.gmane.org>  wrote:
>> Hello
>>
>> I was looking at the man pages looking for a way to get a string of the
>> errno value meaning. This is kind of a user question.
>>
>> This API returns "returns a pointer to a string that describes the error
>> code":
>>
>> http://man7.org/linux/man-pages/man3/strerror.3.html
>>
>> However, this is a description, e.g. "Invalid argument".  Is there a
>> function that would return "EINVAL" or "ENOENT" as the string?
>
> None that I know of. (In passing, I dealt with exactly this problem
> for my book with a script that generated the string names; see
> http://man7.org/tlpi/code/online/dist/lib/ename.c.inc.html and
> http://man7.org/tlpi/code/online/dist/lib/error_functions.c.html)

Interesting. I saw on the ename.c page that the numbers were in the 
table hard coded -- is it guaranteed that 90 will always correspond to 
EPROTOTYPE on a unixy system?

>> Could I suggest that the text on the man page be updated to clarify what
>> would be returned:
>>
>> "returns a pointer to a string that describes the error code. e.g. "Invalid
>> argument" if EINVAL was the errnum."
>
> Done for 3.40.

Great, thank you!
Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
