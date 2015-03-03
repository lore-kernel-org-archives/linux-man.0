From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: man5/filesystems.5: updated list and descriptions of supported
 filesystems
Date: Tue, 3 Mar 2015 14:17:49 +0100
Message-ID: <20150303131749.GA5522@free.fr>
References: <1425373111-3584-1-git-send-email-saulery@free.fr>
 <1425373111-3584-2-git-send-email-saulery@free.fr>
 <54F5A5A1.7060401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F5A5A1.7060401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

A little introduction is necessary I suppose.

I am a French developer (but not C/C++) and I use Debian at home. I reg=
ularly
give small contributions to the distribution and I look at the man page=
s by
now.

My plan was to fix as many bugs as possible about the manpages and
manpages-dev Debian packages [1]. I also think of missing IOCTL for lin=
ux
framebuffer because I contribute to a program that uses them.

I wonder about the right way to improve the overall quality of the man
pages, not just to provide factual information on such and such a
program, but also to guide the reader toward a better understanding of
the system. So my patches on intro.1 and filesystems.5.

[1] https://bugs.debian.org/cgi-bin/pkgreport.cgi?repeatmerged=3Dno&src=
=3Dmanpages

Le mardi 03 mars 2015 =C3=A0 01:14:25, Michael Kerrisk (man-pages) a =C3=
=A9crit :
>=20
> On 03/03/2015 09:58 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> > From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> I appreciate the work your doing on man pages, but it would=20
> be helpful if you could do the following:
>=20
> 1. When making sizable updates to existing pages, give
>    me a little warning, telling me of the planned changes;
>    then I could make suggestions such as I do in the next
>    point before you embark on the work.

Ok, I will.

> 2, Patches like this are way too "busy" for me to easily=20
>    deal with. You are doing multiple things in one patch:
>=20
>        + Placing the existing entries in alphabetical order
>        + Adding very many new filesystems in a single patch.
>=20
>    All of the above seems very fine to me, but... at the
>    very least, this should be a patch that does those two
>    steps separately, in the above order. Then I can more easily
>    distinguish what's being moved around versus what's being=20
>    added.
>=20
>    I think it would also be better to split the additions=20
>    into logically related pieces. In the most extreme case, one
>    patch per filesystem, but maybe it can be done more=20
>    efficiently than that.

I can send interdependent patches then.

> 3. Read man-pages(7) quite closely. One of the things it notes=20
>    is that new sentences should start on new source lines
>    (and when breaking long sentences, breaking after punctuation
>    [.,;:] is preferred).

I usually wraps text with par utility, it's nicer. I'll change.

> Could you do the following:
>=20
> a) Submit a patch that places the existing entries into alphabetical
>    order, making if necessary rewordings to the text to reflect
>    any order changes. (I'm not sure whether any such rewordings are=20
>    needed)

I cook it.

> b) Send me a *list* of the filesystems you propose to add,=20
>    possibly with suggestions on how those FSes could be added=20
>    in patches that add multiple related FSes.

And that, too.

I want to add all supported file systems (or formerly supported) by the
Linux kernel and the following information:
- id
- Full name
- Description (if needed)
- Version of apparition
- Status: alpha, stable, experimental, etc.
- OS and date of origin
- Operation (read / write)
- The type of use (disk, floppy, distributed, etc.)
- Variants
- Some important information if necessary

> c) Then we can see about the best way of adding those new FSes...

The reader should be able to determine if X or Y file system is
supported and possibly lead to a specific man page or the kernel
documentation for difficult cases.  I do not know whether to make a
table, categorize?

> Does the above make sense?

Yes, certainly.

Thank you for your long development.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
