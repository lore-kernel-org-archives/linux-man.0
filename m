From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Is there a way to get "EINVAL" style string
Date: Wed, 9 May 2012 10:30:54 +1200
Message-ID: <CAKgNAkjiv=mb4A6tSFxJx8iTD91-idu2WcqnXP-AZABgM8Jj3w@mail.gmail.com>
References: <4F93E7FC.1020904@jguk.org> <CAKgNAkjP-SZXceGDaBeuNE9onk_w9-8rX1uk-XE2dRu5x8uz_g@mail.gmail.com>
 <4FA99139.90102@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA99139.90102-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

>>> I was looking at the man pages looking for a way to get a string of=
 the
>>> errno value meaning. This is kind of a user question.
>>>
>>> This API returns "returns a pointer to a string that describes the =
error
>>> code":
>>>
>>> http://man7.org/linux/man-pages/man3/strerror.3.html
>>>
>>> However, this is a description, e.g. "Invalid argument". =A0Is ther=
e a
>>> function that would return "EINVAL" or "ENOENT" as the string?
>>
>>
>> None that I know of. (In passing, I dealt with exactly this problem
>> for my book with a script that generated the string names; see
>> http://man7.org/tlpi/code/online/dist/lib/ename.c.inc.html and
>> http://man7.org/tlpi/code/online/dist/lib/error_functions.c.html)
>
>
> Interesting. I saw on the ename.c page that the numbers were in the t=
able
> hard coded -- is it guaranteed that 90 will always correspond to EPRO=
TOTYPE
> on a unixy system?

No. So, my build code deals with this by using a script to build a
platform-specific ename.c.inc file (have a look at the tarball.)

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
