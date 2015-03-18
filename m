From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: aio_return(3): misleading RETURN VALUE
Date: Wed, 18 Mar 2015 20:21:28 +0100
Message-ID: <5509D038.7020907@ahsoftware.de>
References: <5509315A.1040103@ahsoftware.de> <20150318121446.GA5160@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150318121446.GA5160-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am 18.03.2015 um 13:14 schrieb St=C3=A9phane Aulery:
> Hello Alexander,
>
> Le mercredi 18 mars 2015 =C3=A0 09:03:38, Alexander Holler a =C3=A9cr=
it :
>>
>> I suggest to use the same wording as in write(2) in the paragraph RE=
TURN
>> VALUE:
>>
>> "On error, -1 is returned, and errno is set appropriately."
>
> Like that ?
>
>      If the asynchronous I/O operation has completed, this function
>      returns the value that would have been returned in case of a
>      synchronous read(2), write(2), fsync(2) or fdatasync(2), call. O=
n
>      error, -1 is returned, and errno is set appropriately.
>
>      If the asynchronous I/O operation has not yet completed, the ret=
urn
>      value and effect of aio_return() are undefined.

Exactly. Thanks a lot if you change that.

> I think that's what you meant. What will happen if the asynchronous I=
/O
> operation has not yet completed please ?

It is still undefined, but I haven't looked that up in the source of gl=
ibc.

The reason is that aio_return() should only be called if the operation=20
before has completed, which must be checked with calling aio_error()=20
before calling aio_return().

That's how I've understood all that and how it currently seems to work=20
in the SW in question I've fixed a problem.

Regards,

Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
