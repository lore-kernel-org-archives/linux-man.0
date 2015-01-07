From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] adjtimex.2: Change 'PPM' (parts per million) to 'ppm'
Date: Wed, 07 Jan 2015 06:59:04 +0100
Message-ID: <54ACCB28.50100@gmail.com>
References: <54A2DEAD.2050708@supelec.fr> <54A72360.3070807@supelec.fr> <54A724BE.8050409@supelec.fr> <54ABFD54.9000705@gmail.com> <54AC0250.5080005@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AC0250.5080005-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/2015 04:42 PM, Laurent Georget wrote:
> Hi
>=20
> Le 06/01/2015 16:20, Michael Kerrisk (man-pages) a =C3=A9crit :
>=20
>> Laurent, please watch out: your patches are injecting trailing
>> white space on lines. My release scripts clean those up, but
>> it means that patches apply with "noise".
>=20
> Really? I see no extra whitespace in my diff. Where do they come?
> Anyway, I'll take extra care next time. Thank you.

Hi Laurent,

Looking more closely, it seems like your workflow may still be mangling=
 the patches. Here's a portion of what landed when I save your message =
to a text file:

[[
-    long stabil;      /* PPS stability (scaled PPM, read-only) */
+    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), read-on=
ly=3D
) */
     long jitcnt;      /* PPS jitter limit exceeded (read-only) */
     long calcnt;      /* PPS calibration intervals (read-only) */
     long errcnt;      /* PPS calibration errors (read-only) */
@@ -343,6 +342,18 @@ and the caller does not have sufficient privilege.
 Under Linux, the
 .B CAP_SYS_TIME
 capability is required.
+.SH NOTES
+In struct
+.IR timex ,
+.IR freq ,
+.IR ppsfreq ,
+and=3D20
+.I stabil
+are PPM (parts per million) with a 16-bits fractional part, which mean=
s =3D
that a
+value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=3D=
3D6=3D
5535 is=3D20
+1 PPM. This is the case for both input values (in the case of
+.IR freq )
+and output values.
 .SH CONFORMING TO
 .BR adjtimex ()
 is Linux-specific and should not be used in programs
--=3D20
]]

Note, for example, the line with 'long stabil', and the lines=20
from 'are PPM (parts per million)' onward. Surprisingly, this all=20
seemed to apply okay, just with some noise.

Thanks,

Michael

>>> ---
>>>  man2/adjtimex.2 | 15 +++++++--------
>>>  1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
>>> index ff4b23e..dbb2333 100644
>>> --- a/man2/adjtimex.2
>>> +++ b/man2/adjtimex.2
>>> @@ -54,7 +54,7 @@ struct timex {
>>>      long offset;      /* Time offset; nanoseconds, if STA_NANO
>>>                           status flag is set, otherwise
>>>                           microseconds */
>>> -    long freq;        /* Frequency offset, in units of 2^-16 PPM
>>> +    long freq;        /* Frequency offset, in units of 2^-16 ppm
>>>                           (parts per million) (see NOTES below) */
>>>      long maxerror;    /* Maximum error (microseconds) */
>>>      long esterror;    /* Estimated error (microseconds) */
>>> @@ -62,8 +62,7 @@ struct timex {
>>>      long constant;    /* PLL (phase-locked loop) time constant */
>>>      long precision;   /* Clock precision (microseconds,
>>>                           read-only) */
>>> -    long tolerance;   /* Clock frequency tolerance (PPM,
>>> -                         read-only) */
>>> +    long tolerance;   /* Clock frequency tolerance (ppm, read-only=
) */
>>>      struct timeval time;
>>>                        /* Current time (read-only, except for
>>>                           ADJ_SETOFFSET); upon return, time.tv_usec
>>> @@ -71,13 +70,13 @@ struct timex {
>>>                           flag is set, otherwise microseconds */
>>>      long tick;        /* Microseconds between clock ticks */
>>>      long ppsfreq;     /* PPS (pulse per second) frequency
>>> -                         (2^-16 PPM (see NOTES), read-only) */
>>> +                         (2^-16 ppm (see NOTES), read-only) */
>>>      long jitter;      /* PPS jitter (read-only); nanoseconds, if
>>>                           STA_NANO status flag is set, otherwise
>>>                           microseconds */
>>>      int  shift;       /* PPS interval duration
>>>                           (seconds, read-only) */
>>> -    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), rea=
d-only) */
>>> +    long stabil;      /* PPS stability (2^-16 ppm (see NOTES), rea=
d-only) */
>>>      long jitcnt;      /* PPS jitter limit exceeded (read-only) */
>>>      long calcnt;      /* PPS calibration intervals (read-only) */
>>>      long errcnt;      /* PPS calibration errors (read-only) */
>>> @@ -349,9 +348,9 @@ In struct
>>>  .IR ppsfreq ,
>>>  and=20
>>>  .I stabil
>>> -are PPM (parts per million) with a 16-bits fractional part, which =
means that a
>>> -value of 1 in one of those fields actually means 2^-16 PPM, and 2^=
16=3D65535 is=20
>>> -1 PPM. This is the case for both input values (in the case of
>>> +are ppm (parts per million) with a 16-bits fractional part, which =
means that a
>>> +value of 1 in one of those fields actually means 2^-16 ppm, and 2^=
16=3D65535 is=20
>>> +1 ppm. This is the case for both input values (in the case of
>>>  .IR freq )
>>>  and output values.
>>>  .SH CONFORMING TO
>>>
>>
>>
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
