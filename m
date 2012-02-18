From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_error query
Date: Sun, 19 Feb 2012 07:18:39 +1300
Message-ID: <CAKgNAkg2KYca3mA-Nd6_uRDDQpZmb+SFmLbZOFug9jVvHnB8NA@mail.gmail.com>
References: <4F1B32A4.1010809@jguk.org> <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w@mail.gmail.com>
 <4F3FA267.4000208@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F3FA267.4000208-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Sun, Feb 19, 2012 at 2:06 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi Michael
>
> Michael Kerrisk wrote, On 07/02/12 18:25:
>
>> Hi Jon,
>>
>> On Sun, Jan 22, 2012 at 10:48 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> =A0wrote:
>>>
>>> Hello
>>>
>>> http://www.kernel.org/doc/man-pages/online/pages/man3/aio_error.3.h=
tml
>>>
>>> Is this really positive?
>>
>>
>> Do you have some counter-evidence?
>
>
>
> aio_return returns an int. POSIX and ISO C specifies errno as an int.
> Neither say that it is a positive number.

Okay.

> http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap02_0=
3.html
> http://www.cl.cam.ac.uk/cgi-bin/manpage?3+errno
>
>>> errno is an int, and the values I think are not
>>> guaranteed to be positive (like with glibc). I work on a system whe=
re
>>> they
>>> are all negative.

What is the system?

>> Error numbers are all positive. I don't understand your last sentenc=
e
>> above.
>
>
> This may be the case in glibc/linux, but in my experience it is not a
> standard. "errno" is an int:
>
> http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap02_0=
3.html
>
> I work on systems where the EFAULT, EINVAL etc are negative values. S=
o it
> depends if the man page documents linux/glibc specific implementation=
, or
> the standards.
>
> Do correct me if I have missed something.

What you say is now clearer to me, and sounds reasonable. Still, I'm
curious about this other system you are using; I think on every system
I encountered, error numbers are positive.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
