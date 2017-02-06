From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] netlink.7: Update libnl homepage URL
Date: Mon, 6 Feb 2017 08:28:06 +0100
Message-ID: <CAKgNAkjo6djahZnWhXicZEt9LTfqrwwvcB8nz=AnbokTsW2uMQ@mail.gmail.com>
References: <20170204104956.4620-1-jwilk@jwilk.net> <d32fc5df-204d-fe83-b2dc-27935de4bcc0@gmail.com>
 <5895CE95.1050303@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5895CE95.1050303-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 4 February 2017 at 13:52, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 04.02.2017 12:10, schrieb Michael Kerrisk (man-pages):
>> On 02/04/2017 11:49 PM, Jakub Wilk wrote:
>>> The original URL is 404.
>>
>> Thanks, Jakub! Applied.
>>
>> Cheers,
>>
>> Michael
>>
>>
>>> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
>>> ---
>>>  man7/netlink.7 | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/man7/netlink.7 b/man7/netlink.7
>>> index dae58173d..6e9f3265d 100644
>>> --- a/man7/netlink.7
>>> +++ b/man7/netlink.7
>>> @@ -568,7 +568,7 @@ for (nh =3D (struct nlmsghdr *) buf; NLMSG_OK (nh, =
len);
>>>  information about libnetlink
>>>  .UE
>>>
>>> -.UR http://people.suug.ch\:/~tgr\:/libnl/
>>> +.UR http://www.infradead.org\:/~tgr\:/libnl/
>>>  information about libnl
>>>  .UE
>>>
>>>
>>
>>
>
> does not work for me. (can not connect)
> google finds https://www.infradead.org/~tgr/libnl/
> =E2=80=8E             ^^^^^^
> does not work for me either perhaps a temporally problem.

Thanks for noting that, Walter. I'm guessing that this might be
temporary, since Google turns up that URL on a search, and
git.infradead.org is alive. Jakub, did you test the URL at the time
you wrote the patch?

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
