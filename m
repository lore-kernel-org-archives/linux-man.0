From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: iso_8859-{11,13}.7 fix encoding issues ?
Date: Tue, 18 Feb 2014 10:11:07 +0100
Message-ID: <CAKgNAkh4Z3x7tdWdt6k+oRs0bJWzywpVLP-yqcW+Vt7kHCtRhw@mail.gmail.com>
References: <1392558491-19116-1-git-send-email-spaillard@debian.org>
 <53020B87.5050408@gmail.com> <20140217153345.GU15288@mraw.org>
 <CAKgNAkjNSGA-p0ytpWNkBK84wf8pS3U0oMeFh9aZJjKiK8sDEw@mail.gmail.com> <20140217213411.GX15288@mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140217213411.GX15288-xazfMhTT2R0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Simon,

On Mon, Feb 17, 2014 at 10:34 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>=
 wrote:
> On Mon, Feb 17, 2014 at 04:44:19PM +0100, Michael Kerrisk (man-pages)=
 wrote:
>> On Mon, Feb 17, 2014 at 4:33 PM, Simon Paillard <spaillard-8fiUuRrzOP1QFI55V6+gNQ@public.gmane.org=
g> wrote:
>> > On Mon, Feb 17, 2014 at 02:15:51PM +0100, Michael Kerrisk (man-pag=
es) wrote:
>> >> On 02/16/2014 02:48 PM, Simon Paillard wrote:
>> >> > Introduced in 33972b0b231b9b0ee708f27fe42461dbca6e2968
>> >>
>> >> Bother! I still didn't get it right.
>> >>
>> >> Thanks for the patch! Applied.
>> >
>> > BTW, I check the rendering of the iso 8859 -11 and -13 manpages be=
fore/after
>> > the change and I think there is something to be fixed too.
>>
>> Oh -- that was automated with some scripts by Peter Schiffer, and th=
e
>> results looked okay to me, but maybe I did not look closely enough.
>> What problems do you see?
>
> Using the following method:
> for file in $(git diff --stat --name-only man-pages-3.58..man-pages-3=
=2E59 man* ) ; \
>         do diff -u      \
>                 <( man -l <( git show man-pages-3.58:${file} ) )     =
   \
>                 <( man -l <( git show man-pages-3.59:${file} ) ) >> a=
ll-diff ; \
> done
>
> On my laptop, it shows differences for :
>
> man -l man7/iso_8859-11.7
> 3.58:   241   161   A1     =E0=B8=81     THAI CHARACTER KO KAI
> 3.59:   241   161   A1     =C2=A1     THAI CHARACTER KO KAI
>
> man -l man7/iso_8859-13.7
> 3.58:   241   161   A1     =E2=80=98     RIGHT DOUBLE QUOTATION MARK
> 3.59:   241   161   A1     =C2=A1     RIGHT DOUBLE QUOTATION MARK
>
> Given the intro of these manpages:
>        The  following  table displays the characters in ISO 8859-13, =
which are
>        printable and unlisted in the ascii(7) manual page.  The fourt=
h column will
>        only show the proper glyphs in an environment configured for I=
SO 8859-13.
>
> I wonder the point of coding it in unicode, but I'm no locale expert.

The main point is, I think, that the pages will now display correctly
even if your environment is not configured for the character set
encoding. For example, many of those pages didn't display correctly on
my systems. (And it looks like this was also at least sometimes the
case for you, since RIGHT DOUBLE QUOTATION MARK was not rendering
correctly for you in iso_8859-13.7.) Also, UTF-8 is pretty much the
web standard now, AFAICS, and this change makes HTML renderings of the
pages easier (and more likely to be correct).

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
