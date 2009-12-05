From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: Remove reference to non-existent strpcpy(3)
Date: Sat, 5 Dec 2009 08:36:21 +0100
Message-ID: <cfd18e0f0912042336i5deb6e19kdbfc6de94435035f@mail.gmail.com>
References: <1258826146-4474-1-git-send-email-mark@pogo.org.uk>
	 <20091121205012.GF3708@machine.or.cz>
	 <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.NEB.2.01.0911212052050.25031-4Gsws06j5aKxDRllUHgonQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Nov 21, 2009 at 10:16 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> On Sat, 21 Nov 2009, Petr Baudis wrote:
>
>> On Sat, Nov 21, 2009 at 05:55:46PM +0000, Mark Hills wrote:
>> > There is no man page or function by this name.
>> >
>> > Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
>> > ---
>> > =A0man3/strcpy.3 | =A0 =A01 -
>> > =A01 files changed, 0 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/man3/strcpy.3 b/man3/strcpy.3
>> > index 9d47e37..c79efb1 100644
>> > --- a/man3/strcpy.3
>> > +++ b/man3/strcpy.3
>> > @@ -137,6 +137,5 @@ in ways that may make the impossible possible.
>> > =A0.BR memcpy (3),
>> > =A0.BR memmove (3),
>> > =A0.BR strdup (3),
>> > -.BR strpcpy (3),
>> > =A0.BR wcscpy (3),
>> > =A0.BR wcsncpy (3)
>>
>> In fact, this should be fixed by making it a reference to stpcpy().
>
> ... which is the function I was looking for when I stumbled across th=
e
> missing strpcpy() reference. Thanks for finding it for me :-)
>
> I grep'd for any other misleading references to strpcpy() and can't s=
ee
> any, so I'll follow up with a revised (tiny) patch, and an extra refe=
rence
> in string(3).

Okay -- so in the light of your other report, this report is obsolete. =
Right?

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
