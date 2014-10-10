From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: abs.3
Date: Fri, 10 Oct 2014 22:16:44 +0200
Message-ID: <CAKgNAkhggqG=cuuONPyhnBsUuLsvfX9JjKX081wak1PR+MhnZQ@mail.gmail.com>
References: <CAGc9EvdrJA+_jnkRsxLpXgRcHSZnsvETtgMjC0aTgsgsm8Ap0Q@mail.gmail.com>
 <5436CB0D.6040709@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5436CB0D.6040709-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Walter,

On Thu, Oct 9, 2014 at 7:51 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 09.10.2014 13:24, schrieb Jonny Grant:
>> http://man7.org/linux/man-pages/man3/abs.3.html
>>
>> Hello
>> This page shows:
>>
>> "GCC handles abs() and labs() as built-in functions. GCC 3.0 also
>>        handles llabs() and imaxabs() as built-ins."
>>
>> As GCC3 has been around for 10 years now.. should these be combined? e.g.
>>
>> " GCC handles abs(), labs(), llabs() and imaxabs() as built-in functions."
>>
>> There may be other man pages with similar GCC 3.0 references that
>> could be combined now.
>>
>
> I would add "By default gcc ..." since you have a switch not to use built-in's at all.

Agreed. Done.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
