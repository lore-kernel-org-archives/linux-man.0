From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 14:34:08 +0200
Message-ID: <55379540.3080305@gmail.com>
References: <5537620E.3000601@gmail.com>	<20150422102128.GA24625@infradead.org>	<553787D8.602@gmail.com> <CAHpGcMLgpvMEs1x59cwQ3UGGUFks5F5m2WYLsgSGUodsL4ue5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHpGcMLgpvMEs1x59cwQ3UGGUFks5F5m2WYLsgSGUodsL4ue5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBHcsO8bmJhY2hlcg==?= <agruen-mXXj517/zsQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marco Curreli <marcocurreli-IWqWACnzNjyonA0d6jMUrA@public.gmane.org>, Jan Haloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, Ron Hale-Evans <rwhe-cwvAZfDeW+Ednm+yROfE0A@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Petr Gajdos <PGajdos-AlSwsSmVLrQ@public.gmane.org>, Giulio Daprel?? <giulio-pvpjhgE6P/E@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, manpages-fr maintainer <manpagesfr-GANU6spQydw@public.gmane.org>, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Christophe-dWQ4ybOOSWIdnm+yROfE0A@public.gmane.org, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jim Zemlin <jzemlin-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Alain Portal <alain.portal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/22/2015 02:12 PM, Andreas Gr=C3=BCnbacher wrote:
> 2015-04-22 13:36 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages@=
gmail.com>:
>> On 04/22/2015 12:21 PM, Christoph Hellwig wrote:
>>> Can you also rename it to xattr while we're at it?
>>
>> While I actually like the name "xattr" more, I'm a little reluctant
>> to change this, because the page has been around for a long time
>> under the other name. But, I'm open for further argumentation
>> about it. Andreas, what do you think?
>=20
>=20
> attr.5 as an alias to xattr.7 maybe?

Yes, I was wondering about that, but waited to see what you=20
thought about the name change idea. I've made the change.
xattr(7) it is. (I'll add a note in the page text about the
former name.)

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
