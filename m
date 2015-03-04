From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man5/filesystems.5: updated list and descriptions of supported filesystems
Date: Wed, 4 Mar 2015 08:51:22 +0100
Message-ID: <CAKgNAkheSPLta3XY3RJZNjPQ403=1qB0usAHXQn0=1uzG7qOSA@mail.gmail.com>
References: <1425373111-3584-1-git-send-email-saulery@free.fr>
 <1425373111-3584-2-git-send-email-saulery@free.fr> <54F5A5A1.7060401@gmail.com>
 <20150303131749.GA5522@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150303131749.GA5522-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane

On 3 March 2015 at 14:17, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrote:
> Hello Michael,
>
> A little introduction is necessary I suppose.
>
> I am a French developer (but not C/C++) and I use Debian at home. I r=
egularly
> give small contributions to the distribution and I look at the man pa=
ges by
> now.

Thanks for the intro.

> My plan was to fix as many bugs as possible about the manpages and
> manpages-dev Debian packages [1]. I also think of missing IOCTL for l=
inux
> framebuffer because I contribute to a program that uses them.

Okay.

> I wonder about the right way to improve the overall quality of the ma=
n
> pages, not just to provide factual information on such and such a
> program, but also to guide the reader toward a better understanding o=
f
> the system. So my patches on intro.1 and filesystems.5.

Okay.

I have yet to review intro.1, I'm sorry.

Cheers,

Michael

> [1] https://bugs.debian.org/cgi-bin/pkgreport.cgi?repeatmerged=3Dno&s=
rc=3Dmanpages
>
> Le mardi 03 mars 2015 =C3=A0 01:14:25, Michael Kerrisk (man-pages) a =
=C3=A9crit :
>>
>> On 03/03/2015 09:58 AM, saulery-GANU6spQydw@public.gmane.org wrote:
>> > From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>>
>> I appreciate the work your doing on man pages, but it would
>> be helpful if you could do the following:
>>
>> 1. When making sizable updates to existing pages, give
>>    me a little warning, telling me of the planned changes;
>>    then I could make suggestions such as I do in the next
>>    point before you embark on the work.
>
> Ok, I will.
>
>> 2, Patches like this are way too "busy" for me to easily
>>    deal with. You are doing multiple things in one patch:
>>
>>        + Placing the existing entries in alphabetical order
>>        + Adding very many new filesystems in a single patch.
>>
>>    All of the above seems very fine to me, but... at the
>>    very least, this should be a patch that does those two
>>    steps separately, in the above order. Then I can more easily
>>    distinguish what's being moved around versus what's being
>>    added.
>>
>>    I think it would also be better to split the additions
>>    into logically related pieces. In the most extreme case, one
>>    patch per filesystem, but maybe it can be done more
>>    efficiently than that.
>
> I can send interdependent patches then.
>
>> 3. Read man-pages(7) quite closely. One of the things it notes
>>    is that new sentences should start on new source lines
>>    (and when breaking long sentences, breaking after punctuation
>>    [.,;:] is preferred).
>
> I usually wraps text with par utility, it's nicer. I'll change.
>
>> Could you do the following:
>>
>> a) Submit a patch that places the existing entries into alphabetical
>>    order, making if necessary rewordings to the text to reflect
>>    any order changes. (I'm not sure whether any such rewordings are
>>    needed)
>
> I cook it.
>
>> b) Send me a *list* of the filesystems you propose to add,
>>    possibly with suggestions on how those FSes could be added
>>    in patches that add multiple related FSes.
>
> And that, too.
>
> I want to add all supported file systems (or formerly supported) by t=
he
> Linux kernel and the following information:
> - id
> - Full name
> - Description (if needed)
> - Version of apparition
> - Status: alpha, stable, experimental, etc.
> - OS and date of origin
> - Operation (read / write)
> - The type of use (disk, floppy, distributed, etc.)
> - Variants
> - Some important information if necessary
>
>> c) Then we can see about the best way of adding those new FSes...
>
> The reader should be able to determine if X or Y file system is
> supported and possibly lead to a specific man page or the kernel
> documentation for difficult cases.  I do not know whether to make a
> table, categorize?
>
>> Does the above make sense?
>
> Yes, certainly.
>
> Thank you for your long development.
>
> Regards,
>
> --
> St=C3=A9phane Aulery



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
