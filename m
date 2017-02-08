From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH 1/2] netlink.7: Update libnl homepage URL
Date: Wed, 08 Feb 2017 14:43:57 +0100
Message-ID: <589B209D.9090602@bfs.de>
References: <20170204104956.4620-1-jwilk@jwilk.net> <d32fc5df-204d-fe83-b2dc-27935de4bcc0@gmail.com> <5895CE95.1050303@bfs.de> <CAKgNAkjo6djahZnWhXicZEt9LTfqrwwvcB8nz=AnbokTsW2uMQ@mail.gmail.com> <20170206102127.vjgvzo4ufz7wmttk@jwilk.net> <CAKgNAkj6csTXmO2xwuuno8hVmjfVoPayYVAkV17mesPK2bF6VA@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj6csTXmO2xwuuno8hVmjfVoPayYVAkV17mesPK2bF6VA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

confirmed ..

last time seems to be an unfortunate coincidence

@jukub:
also confirmed ..
it works for me with http and https, so http is fine.

re,
 wh

Am 08.02.2017 09:48, schrieb Michael Kerrisk (man-pages):
> On 6 February 2017 at 11:21, Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org> wrote:
>> * Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 2017-02-06, 08:28:
>>>>>>
>>>>>> -.UR http://people.suug.ch\:/~tgr\:/libnl/
>>>>>> +.UR http://www.infradead.org\:/~tgr\:/libnl/
>>>>>> information about libnl
>>>>>> .UE
>>>>
>>>>
>>>> does not work for me. (can not connect)
>>
>>
>> Yeah, the server appears to be down. :/
>> I'll ask on the libnl mailing list what's going on.
>>
>>>> google finds https://www.infradead.org/~tgr/libnl/
>>>>             ^^^^^^
>>>> does not work for me either perhaps a temporally problem.
>>
>>
>> The URL I used is in the latest libnl source, so one can presume it's
>> official. I know that Google can be overzealous about HTTP->HTTPS upgrades,
>> so I decided to be conservative and use the HTTP one.
>>
>>> Jakub, did you test the URL at the time you wrote the patch?
>>
>>
>> I did a few days before that. According to my browser cache the site was
>> still up on 2017-01-31.
> 
> And the URL seems to be alive once more now.
> 
> Cheers,
> 
> Michael
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
