From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: Non utf8 characters in page standards.7
Date: Sun, 12 Apr 2015 10:44:49 +0100
Message-ID: <552A3E91.2000204@jguk.org>
References: <CAGc9EveXMqUoTRDtjWE0h6rqXNcchdxghJZ9DMd0xR399aZMBQ@mail.gmail.com> <CAKgNAkhQKtQ-hDyi2NzWZ-icWwVP3ECc-NBXPy89Lu-UY=2a-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhQKtQ-hDyi2NzWZ-icWwVP3ECc-NBXPy89Lu-UY=2a-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



On 12/04/15 08:22, Michael Kerrisk (man-pages) wrote:
> On 9 October 2014 at 13:24, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
>> http://man7.org/linux/man-pages/man7/standards.7.html
>>
>> Hello
>> I noticed this page has come corrupt bytes in HTML source:
>>
>> under the auspices of the Austin group
>> ??<a href=3D"http://www.opengroup.org/austin/">http://www.opengroup.=
org/austin/</a>??.
>>
>>
>> See ?? in my quote above.
>>
>> In hex, the bytes are E2 9F A8  and  E2 9F A9
>>
>> Any ideas?
>>
>> There are other occurances with other links too. may affect other pa=
ges too
>
> These are the characters generated to the .UR/.UE macro pair (see gro=
ff_man(7)).
>
> Cheers,
>
> Michael
>


Hello Michael

Thank you for your reply.

Perhaps the .UR/.UE characters could be taken out?

=E2=9F=A8http://www.opengroup.org/austin/=E2=9F=A9

The COLOPHON URL link doesn't have them. Ideally IMHO English man pages=
=20
would have only ASCII characters

Of course, could use the regular < > characters

Regards, Jonny


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
