From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] stpcpy.3, stpncpy.3: Correct history
Date: Thu, 08 May 2014 15:02:31 +0200
Message-ID: <536B8067.6020202@gmail.com>
References: <20140224003705.GB28413@iris.usta.de> <5363A48C.7060709@gmail.com> <20140507203300.GM3365@iris.usta.de> <CAKgNAkifRNL+1KTa1LrRgJGn7dYUYvf8N5n2Q8V5+0RFXZatvQ@mail.gmail.com> <20140508112356.GA22640@iris.usta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140508112356.GA22640-1ywcXMbTzNIuZeo0DBJMuQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ingo,

On 05/08/2014 01:23 PM, Ingo Schwarze wrote:
> Hi Michael,
>=20
> Michael Kerrisk (man-pages) wrote on Thu, May 08, 2014 at 11:55:36AM =
+0200:
>> On Wed, May 7, 2014 at 10:33 PM, Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org> wr=
ote:
>>> Michael Kerrisk (man-pages) wrote on Fri, May 02, 2014 at 03:58:36P=
M +0200:
>=20
>>>> the patch seems more or less okay to me, but given that The AmigaD=
OS
>>>> compiler is the merely the oldest instance you could find, I'd pre=
fer
>>>> a slightly more open wording.
>>>> How would this be:
>>>>
>>>> [[
>>>> --- a/man3/stpcpy.3
>>>> +++ b/man3/stpcpy.3
>>>> @@ -76,9 +76,11 @@ function is thread-safe.
>>>>  .SH CONFORMING TO
>>>>  This function was added to POSIX.1-2008.
>>>>  Before that, it was not part of
>>>> -the C or POSIX.1 standards, nor customary on UNIX systems, but wa=
s not a
>>>> -GNU invention either.
>>>> -Perhaps it came from MS-DOS.
>>>> +the C or POSIX.1 standards, nor customary on UNIX systems.
>>>> +It first appeared at least as early as 1986,
>>>> +in the Lattice C AmigaDOS compiler,
>>>> +then in the GNU fileutils and GNU textutils in 1989,
>>>> +and in the GNU C library until 1992.
>=20
>> Just fixed: s/until/in/
>=20
> Actually, what i intended to express with that "until" was:
>=20
>   "in the GNU C library at least as early as 1992"
>=20
> Glibc development started in 1987.  Clearly glibc didn't have stpcpy
> before 1989, or early textutils/fileutils wouldn't have had their
> own copy with a 1989 FSF Copyright.  The glibc ChangeLog says
> Roland McGrath fixed a bug in stpcpy in 1992, and *after that*,
> the file has a 1992 FSF Copyright.
>=20
> That doesn't strictly exclude stpcpy may have appeared in glibc
> in 1989, 1990, or 1991.

Ahhh got it now. I changed 'in' to 'by'. (Das deutsches Wort 'bis'
kann auf englisch entweder 'by' oder 'until' sein. 'By' f=FCr=20
eine Sache, die _an_ einem bestimmten Zeitpunkt abgeschlossen ist,=20
'until' f=FCr eine Sache, die _dauert_ bis zu einem bestimmten=20
Zeitpunkt. Ganz normale Fehler von deutsch nach englisch; I should=20
have spotted it already ;-).)

Mfg aus Muenchen,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
