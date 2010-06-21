From: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH v2] elf.5: Add description for ELF extension
Date: Mon, 21 Jun 2010 09:06:55 +0900 (JST)
Message-ID: <20100621.090655.193687120.d.hatayama@jp.fujitsu.com>
References: <20100511015854.GF16800@machine.or.cz>
	<20100513.145504.71089765.d.hatayama@jp.fujitsu.com>
	<AANLkTinto_PzCcEWLs2l6VQ3axuetLtGSoXwZqaNy2NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinto_PzCcEWLs2l6VQ3axuetLtGSoXwZqaNy2NQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

You're welcome and thanks.

HATAYAMA Daisuke

=46rom: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] elf.5: Add description for ELF extension
Date: Sat, 19 Jun 2010 15:53:00 +0200

> Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Date: Sat, 19 Jun 2010 15:53:00 +0200
> Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>=20
> Hello Daisuke, Petr
>=20
> On Thu, May 13, 2010 at 7:55 AM, Daisuke HATAYAMA
> <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org> wrote:
>> Hi. Petr.
>>
>> Thank you for your comments.
>>
>> I reflected your comments to the previous patch.
>> Could you check it?
>>
>> # =A0 What a strange interface, the other two hold the max value whi=
le
>> # e_shnum holds zero in case of overflow.
>>
>> I considered one answer to the question based on the difference of
>> compatibility policy for each object format.
>>
>> For core object format, it is better for ordinary tools to understan=
d
>> as many program headers as possible, even if it is incomplete. On th=
e
>> other hand, for relocatable object format, it is meaningless if it i=
s
>> incomplete. This is why e_phnum is set to PN_XNUM(0xffff) and e_shnu=
m
>> is set to 0, respectively: in the latter case, any ordinary linker
>> cannot recognize the relocatable object correctly.
>>
>> But I don't know why e_shstrndx is set to 0xffff. We could choose it
>> from the reserved range of section header table indices, i.e. 0 and
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
