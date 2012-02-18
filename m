From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: aio_error query
Date: Sat, 18 Feb 2012 13:06:47 +0000
Message-ID: <4F3FA267.4000208@jguk.org>
References: <4F1B32A4.1010809@jguk.org> <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

Michael Kerrisk wrote, On 07/02/12 18:25:
> Hi Jon,
>
> On Sun, Jan 22, 2012 at 10:48 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org>  wrote:
>> Hello
>>
>> http://www.kernel.org/doc/man-pages/online/pages/man3/aio_error.3.html
>>
>> Is this really positive?
>
> Do you have some counter-evidence?


aio_return returns an int. POSIX and ISO C specifies errno as an int. 
Neither say that it is a positive number.

http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap02_03.html
http://www.cl.cam.ac.uk/cgi-bin/manpage?3+errno



>> errno is an int, and the values I think are not
>> guaranteed to be positive (like with glibc). I work on a system where they
>> are all negative.
>
> Error numbers are all positive. I don't understand your last sentence above.

This may be the case in glibc/linux, but in my experience it is not a 
standard. "errno" is an int:

http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap02_03.html

I work on systems where the EFAULT, EINVAL etc are negative values. So 
it depends if the man page documents linux/glibc specific 
implementation, or the standards.

Do correct me if I have missed something.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
