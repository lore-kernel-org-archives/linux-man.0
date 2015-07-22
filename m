From: Mehdi Aqadjani Memar <m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org>
Subject: Re: man page mlock/munlock
Date: Wed, 22 Jul 2015 08:17:04 +0200
Message-ID: <87twswr9wn.fsf@student.vu.nl>
References: <87k2wm84eo.fsf@student.vu.nl> <CAKgNAkjMuMdu952zj_3kL7cmC-xeRzTzDo_2emxwjEoG+2YVFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjMuMdu952zj_3kL7cmC-xeRzTzDo_2emxwjEoG+2YVFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,
thank you for your reply!
Your text has explained the effect of locking and unlocking very well.
Regards,
Mehdi

Michael Kerrisk (man-pages) writes:

> Hello Mehdi
>
> On 6 May 2015 at 10:49, Mehdi Aqadjani Memar
> <m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org> wrote:
>> Dear Michael Kerrisk,
>> in my application I am using munlock() as described in the man page.=
 munlock()
>> fails and returns ENOMEM. The man page for this error has not helped=
 me to find
>> out what the problem was. I traced my code and discovered that this =
error
>> appears when "the process's maximum number of mappings would have be=
en
>> exceeded", as it is mentioned at the man page of mmap(). This happen=
s because
>> munlock() splits the vma's.
>> I believe that this information should be a part of the man page of =
munlock().
>> --
>> Met vriendelijke groet/Kind regards
>> Mehdi Aqadjani Memar
>
> Thanks for the report, and sorry for the delayed response. I've
> confirmed your point. How would the following text be:
>
>        ENOMEM Locking  or  unlocking  a region would result in the to=
tal
>               number of mappings with distinct attributes (e.g.,  loc=
ked
>               versus  unlocked)  exceeding  the  allowed  maximum.  (=
=46or
>               example, unlocking a range in the middle  of  a  curren=
tly
>               locked  mapping would result in three mappings: two loc=
ked
>               mappings at each end and an unlocked mapping in  the  m=
id=E2=80=90
>               dle.)
> ?
>
> Thanks,
>
> Michael

--=20
Met vriendelijke groet/Kind regards
Mehdi Aqadjani Memar
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
