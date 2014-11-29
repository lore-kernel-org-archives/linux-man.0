From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch v2] adjtimex.2: add explanation about ADJ_TAI action
Date: Sat, 29 Nov 2014 10:27:52 +0100
Message-ID: <54799198.1070907@gmail.com>
References: <54787B5C.1080802@supelec.fr> <20141128210043.GB14432@localhost.localdomain> <5478FF09.6090508@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5478FF09.6090508@supelec.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Georget <laurent.georget@supelec.fr>, Richard Cochran <richardcochran@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Laurent,

Thanks for working on this. I have one question; see below.

On 11/29/2014 12:02 AM, Laurent Georget wrote:
> Le 28/11/2014 22:00, Richard Cochran a =E9crit :
>> On Fri, Nov 28, 2014 at 02:40:44PM +0100, Laurent Georget wrote:
>>> @@ -101,7 +99,19 @@ combination of zero or more of the following bi=
ts:
>>>  Ordinary users are restricted to a zero value for
>>>  .IR modes .
>>>  Only the superuser may set any parameters.
>>> +.PP
>>> +Support for TAI (Atomic International Time, for a complete explana=
tion
>>> about
>>> +what it is and what is the difference between TAI and UTC, see
>>> +.UR http://www.bipm.org/en/bipm/tai/tai.html
>>> +.I BIPM
>>> +.UE )
>>> +has been added in version 2.6.29. For any clock, the TAI offset ma=
y
>>
>> Not for "any clock", just for CLOCK_REALTIME.
>=20
> Considering that this is the only one representing the "human" time a=
nd
> supporting an adjtime action, indeed, it's not relevant for anything
> else than the realtime clock.
>=20
>>
>>> +be calculated by adding a value to the UTC offset which is updated=
 when a
>>> +leap second is added or deleted.
>>>  .br
>>> +All the offsets in the timex structure are expressed between the v=
alue
>>> of the
>>> +clock and the corresponding value (e.g. TAI offset is the differen=
ce
>>> between
>>> +the clock and the TAI, not between TAI and another value such as U=
TC).
>>
>> The TAI offset is just (TAI - UTC). That's all.
>>
>=20
> Yes, my mistake, I misunderstood the part about timekeeping
> (__timekeeping_set_tai_offset() in kernel/time/timekeeping.c, line 81=
5)
> which does store the offset in several formats (monotonic -> TAI and =
UTC
> -> TAI). But this is not directly related to the timex value. Aniway
> this is not very relevant in the man page.
>=20
> Thank you for your comments. Below is a new version of the patch. Les=
s
> unrelevant chit-chat, more useful information (hopefully).
>=20
>=20
> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index 20a2f0b..871e607 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -26,9 +26,6 @@
>  .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages@gmail.com>
>  .\" Modified 2014-11-28 by Laurent Georget <laurent.georget@supelec.=
fr>
>  .\"
> -.\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
> -.\"		commit 153b5d054ac2d98ea0d86504884326b6777f683d
> -.\"
>  .\" FIXME Document ADJ_MICRO and ADJ_NANO (added in Linux 2.6.26)
>  .\"		commit eea83d896e318bda54be2d2770d2c5d6668d11db
>  .\"		Author: Roman Zippel <zippel@linux-m68k.org>
> @@ -74,6 +71,17 @@ struct timex {
>                              (read-only) */
>      struct timeval time; /* current time (read-only) */
>      long tick;           /* usecs between clock ticks */

What is the following piece about? Did you mean to include it in this p=
atch?

> +
> +    long ppsfreq;        /* pps frequency (scaled ppm) (read-only) *=
/
> +    long jitter;         /* pps jitter (usec) (read-only) */
> +    int shift;           /* interval duration (sec) (read-only) */
> +    long stabil;         /* pps stability (scaled ppm) (read-only) *=
/
> +    long jitcnt;         /* jitter limit exceeded (read-only) */
> +    long calcnt;         /* calibration intervals (read-only) */
> +    long errcnt;         /* calibration errors (read-only) */
> +    long stbcnt;         /* stability limit exceeded (read-only) */
> +
> +    int tai;             /* TAI offset (s) (read-only) */
>  };

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
