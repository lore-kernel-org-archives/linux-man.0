From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_error query
Date: Mon, 20 Feb 2012 14:32:04 +1300
Message-ID: <CAKgNAkhzgGiJHfJbzZGoKjJzY8ioy=GSPjdZ2uzNR1m-0bicjA@mail.gmail.com>
References: <4F1B32A4.1010809@jguk.org> <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w@mail.gmail.com>
 <4F3FA267.4000208@jguk.org> <CAKgNAkg2KYca3mA-Nd6_uRDDQpZmb+SFmLbZOFug9jVvHnB8NA@mail.gmail.com>
 <4F400BFB.5050409@jguk.org> <CAKgNAkg9ELf7WHxsB=PuGTj2KifW2pZqT6i5VBAfRX_ajqvcEw@mail.gmail.com>
 <4F40D9DB.2070203@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F40D9DB.2070203-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Mon, Feb 20, 2012 at 12:15 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
>
>
> Michael Kerrisk wrote, On 19/02/12 02:40:
>
>> Hi Jon
>>
>> On Sun, Feb 19, 2012 at 9:37 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> =A0wrote:
>>>
>>> Hi Michael
>>>
>>> Michael Kerrisk wrote, On 18/02/12 18:18:
>>> [...]
>>>
>>>>>
>>>>>
>>>>> http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap=
02_03.html
>>>>> http://www.cl.cam.ac.uk/cgi-bin/manpage?3+errno
>>>>>
>>>>>>> errno is an int, and the values I think are not
>>>>>>> guaranteed to be positive (like with glibc). I work on a system=
 where
>>>>>>> they
>>>>>>> are all negative.
>>>>
>>>>
>>>>
>>>> What is the system?
>>>
>>>
>>>
>>> http://www.mpcdata.com/mediasdk/
>>
>>
>> Is this actually a UNIX system?
>
> No.

(This would have been useful info early in the thread ;-).)

So, I checked with someone close to POSIX who pointed out to me that
there is this text in the POSIX.1-2001 specification of the <errno.h>
header file:

[[
The <errno.h> header shall provide a declaration for errno and give
positive values for the following symbolic constants. Their values
shall be unique except as noted below.
]]

So, I think the man page is fine (but you could file a bug with
Renesas about their implementation).

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
