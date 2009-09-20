From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: linux strlen man page accepts NULL?
Date: Sun, 20 Sep 2009 04:41:41 +0200
Message-ID: <cfd18e0f0909191941s421596b1ne08da9906f4e4d5d@mail.gmail.com>
References: <19ac3f7a0908070455s33ecb5efo6810eb7959df1f70@mail.gmail.com>
	 <cfd18e0f0908071251h27d2d7d6o4c7d8ae2a4c1913f@mail.gmail.com>
	 <19ac3f7a0908100506j7ec9933gec944f3b5bb92ef0@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19ac3f7a0908100506j7ec9933gec944f3b5bb92ef0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Mon, Aug 10, 2009 at 2:06 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> 2009/8/7 Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>:
>> Jon,
>>
>> On Fri, Aug 7, 2009 at 1:55 PM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> wrote:
>>> Looking at this man page:
>>>
>>> http://linux.die.net/man/3/strlen
>>>
>>> Should it not mention that a NULL address is a valid param? Or is i=
t
>>> not a valid param?
>>
>> What makes you think it is a valid parameter?
>
> NULL points to 0x0, which could be mapped to something.

D'oh! Sorry -- now I'm with you. Yes, it could.

> On my embedded
> platform it is the beginning of the boot ROM. However typically 0x0 i=
s
> an invalid address, in which case strlen should check for NULL, and
> return 0

I don't think it should check for this. If the addres is invalid, it
should be treated like any other invalid address -- usually a SIGSEGV
results.

> e.g.:
>
> size_t strlen(const char *str)
> {
> =A0 =A0 =A0 =A0const char *s;
>
> if(str =3D=3D NULL)
> {
> =A0 =A0return 0;
> }
>
> =A0 =A0 =A0 =A0for (s =3D str; *s; ++s)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;
> =A0 =A0 =A0 =A0return (s - str);
> }
>
>>> On most systems NULL is a special error pointer.
>>
>> I don't understand what you mean with this last sentence. Please exp=
lain.
>
> Well, the purpose of strlen is to count chars (excluding terminating
> '\0') but on most systems address 0x0 [which is what NULL is, (void*)=
0
> ].
>
> So if something is mapped by the hardware at 0x0 address then strlen
> could be used to count the number of characters at that location.
> However, on most systems his 0x0 address (NULL) indicates an invalid
> address.
>
> I am not on this mailing list, so please keep my email address in any=
 replies.

As far as I can see, there's nothing in the documentation that needs
to be fixed. I'm doubtful that glibc's strlen() should be fixed
either. I agree that mappings at 0x0 are a strange corner case that
can produce unusual results in cases like these.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
