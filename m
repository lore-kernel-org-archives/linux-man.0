From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_cancel
Date: Wed, 5 Oct 2011 06:37:41 +0200
Message-ID: <CAKgNAkhdZwP7hVH2GdmMV9CH4LTXURbO=TrAg0QgiG7_XXdQFg@mail.gmail.com>
References: <CAGc9Evf=94fyfYM67q0BRJCN=vu14aYV91pE+Hw=uhgkVS5p5g@mail.gmail.com>
 <CAKgNAkgcKRrdepNS9jQw=MzNY+sRpP+-idDEfpT0ALBJOJ3w1w@mail.gmail.com> <4E8BA018.5070707@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E8BA018.5070707-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Oct 5, 2011 at 2:08 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Michael Kerrisk wrote, On 04/10/11 06:42:
>>
>> Hi Jon,
>>
>> On Tue, Oct 4, 2011 at 12:03 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> =A0wrote:
>>>
>>> Hello
>>>
>>> I have a query about the ask about the aio_cancel description pleas=
e.
>>>
>>> http://man7.org/linux/man-pages/online/pages/man3/aio_cancel.3.html
>>>
>>> "Normal asynchronous notification occurs for canceled requests. =A0=
The
>>> request
>>> =A0 =A0 =A0 return status is set to -1, and the request error statu=
s is set
>>> to ECANCELED."
>>>
>>> I would like to ask about this description. Could the detail of
>>> "request return status" and "request error status" be described
>>> please.
>>>
>>> My assumption
>>>
>>> "request return status" -- perhaps the value returned by aio_return=
()?
>>> "request error status" -- not sure. maybe aio_error() ?
>>>
>>> Thank you for taking a look into this.
>>
>> Your assumption is correct. I added some words to the man page for
>> version 3.35 to clarify this.
>
> Looks good.
>
> Could I ask a related question. When an aio block is cancelled, is th=
ere
> anyway to get back the byte count that was processed? e.g. aio_read, =
the
> number of bytes read before the operation was cancelled.

Offhand, I don't know. What happens if you try aio_return() +
aio_error()? When you find out, send me a patch!

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
