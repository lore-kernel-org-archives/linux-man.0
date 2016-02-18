From: =?UTF-8?Q?St=c3=a9phane_Aulery?= <saulery-lkSrsyIBln0dnm+yROfE0A@public.gmane.org>
Subject: Re: Bug#794947: manpages-dev: printf(3) example: possible integer
 overflow
Date: Thu, 18 Feb 2016 20:18:33 +0100
Message-ID: <56C61909.20606@legtux.org>
References: <e62670273dd84e658fe32cda6e16e94b@legtux.org>
 <56C4E269.5020108@bfs.de>
Reply-To: saulery-lkSrsyIBln0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C4E269.5020108-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org, 794947-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Walter,

Le 17/02/2016 22:13, walter harms a =C3=A9crit :
>>
>> Jakub Wilk reported a possible integer overflow in make_message exam=
ple :
>>
>>> The example in the printf(3) manpages looks like this (with boring =
parts
>>> omitted):
>>>
>>> int n;
>>> /* ... */
>>>    n =3D vsnprintf(p, size, fmt, ap);
>>>     /* ... */
>>>     if (n < 0) {
>>>         /* ... */
>>>         return NULL;
>>>     }
>>>     /* ... */
>>>     size =3D n + 1;
>>>
>>>
>>> But vsnprintf could return INT_MAX, which would then cause "n + 1" =
to
>>> overflow.
>>>
>>> (AFAICS, the glibc vsnprintf implementation never returns INT_MAX, =
but
>>> it could in principle.)
>>>
>>> I'd suggest changing "n < 0" to "n < 0 || n =3D=3D INT_MAX".
>>
>
> the bug is real, the type of size should be size_t (in my original po=
st it was int)
> That would make the error check useless, so we would need to store
> the vsnprintf return value in an int.
>
> The problem is that the idea was to have a simple example and clutter=
ing
> it with error checks will make it hard to read. How many people would
> notice that size_t is unsigned and n is signed ? (i added an comment)=
=2E
>
> IMHO we should simply add a sentence that "examples are examples and
> will not check for every possible error condition."


I agree with the general idea: the examples must remain so. They must=20
also be correct. Tough choice!

I will not put a note on this page about it, nor on the other, too much=
=20
for so little.

man-pages.7 specifically requests:

      Example programs shoulds be fairly short (preferably less than 10=
0=20
lines;
      Ideally less than 50 lines).

      Example programs shoulds do error checking after-system calls and
      library function calls.

So I will do a patch with your new corrected version that is very reada=
ble.

Thanks a lot for your help.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
