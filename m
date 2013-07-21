From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] bootparam.7: tfix
Date: Mon, 22 Jul 2013 00:16:28 +0200
Message-ID: <CAKgNAkjhjHKhL3T56fFTneH4qrCO0muOfJKJB+qEX2kM3tCS1A@mail.gmail.com>
References: <1374113157-4915-1-git-send-email-taffit@debian.org>
 <51EAEDFB.400@gmail.com> <1374373018.6023.216494.camel@linux.heathens.co.nz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374373018.6023.216494.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Q2hyaXMg44Kv?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jul 21, 2013 at 4:16 AM, Chris "=E3=82=AF" <chris-FSXMH2gLahU4jFG1wn6miw@public.gmane.org=
z> wrote:
> This change sounds wrong to me.  I didn't think "software" was a coun=
t
> noun.  How about just removing the word "software" completely, as in
> "... use a boot loader that is able to..."?

Thanks for noting that, Chris. Fixed as you suggest.

Cheers,

Michael


> On Sat, 2013-07-20 at 22:07 +0200, Michael Kerrisk wrote:
>> Applied.
>>
>> Thanks, David.
>>
>> Cheers,
>>
>> Michael
>>
>>
>>
>> On 07/18/13 04:05, David Pr=C3=A9vot wrote:
>> > ---
>> >  man7/bootparam.7 | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/man7/bootparam.7 b/man7/bootparam.7
>> > index fa4c5c3..89d8f72 100644
>> > --- a/man7/bootparam.7
>> > +++ b/man7/bootparam.7
>> > @@ -42,7 +42,7 @@ When the kernel is booted directly by the BIOS (=
say from a floppy to
>> >  which you copied a kernel using 'cp zImage /dev/fd0'),
>> >  you have no opportunity to specify any parameters.
>> >  So, in order to take advantage of this possibility you have to
>> > -use boot loader software that is able to pass parameters, such as=
 GRUB.
>> > +use a boot loader software that is able to pass parameters, such =
as GRUB.
>> >
>> >  .\" The LILO program (LInux LOader) written by Werner Almesberger=
 is the
>> >  .\" most commonly used.
>> >
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man"=
 in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
