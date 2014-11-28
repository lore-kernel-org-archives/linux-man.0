From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [patch v2] adjtimex.2: add explanation about ADJ_TAI action
Date: Sat, 29 Nov 2014 00:02:33 +0100
Message-ID: <5478FF09.6090508@supelec.fr>
References: <54787B5C.1080802@supelec.fr> <20141128210043.GB14432@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141128210043.GB14432-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Le 28/11/2014 22:00, Richard Cochran a =E9crit :
> On Fri, Nov 28, 2014 at 02:40:44PM +0100, Laurent Georget wrote:
>> @@ -101,7 +99,19 @@ combination of zero or more of the following bit=
s:
>>  Ordinary users are restricted to a zero value for
>>  .IR modes .
>>  Only the superuser may set any parameters.
>> +.PP
>> +Support for TAI (Atomic International Time, for a complete explanat=
ion
>> about
>> +what it is and what is the difference between TAI and UTC, see
>> +.UR http://www.bipm.org/en/bipm/tai/tai.html
>> +.I BIPM
>> +.UE )
>> +has been added in version 2.6.29. For any clock, the TAI offset may
>=20
> Not for "any clock", just for CLOCK_REALTIME.

Considering that this is the only one representing the "human" time and
supporting an adjtime action, indeed, it's not relevant for anything
else than the realtime clock.

>=20
>> +be calculated by adding a value to the UTC offset which is updated =
when a
>> +leap second is added or deleted.
>>  .br
>> +All the offsets in the timex structure are expressed between the va=
lue
>> of the
>> +clock and the corresponding value (e.g. TAI offset is the differenc=
e
>> between
>> +the clock and the TAI, not between TAI and another value such as UT=
C).
>=20
> The TAI offset is just (TAI - UTC). That's all.
>=20

Yes, my mistake, I misunderstood the part about timekeeping
(__timekeeping_set_tai_offset() in kernel/time/timekeeping.c, line 815)
which does store the offset in several formats (monotonic -> TAI and UT=
C
-> TAI). But this is not directly related to the timex value. Aniway
this is not very relevant in the man page.

Thank you for your comments. Below is a new version of the patch. Less
unrelevant chit-chat, more useful information (hopefully).


diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 20a2f0b..871e607 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -26,9 +26,6 @@
 .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\" Modified 2014-11-28 by Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org=
>
 .\"
-.\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
-.\"		commit 153b5d054ac2d98ea0d86504884326b6777f683d
-.\"
 .\" FIXME Document ADJ_MICRO and ADJ_NANO (added in Linux 2.6.26)
 .\"		commit eea83d896e318bda54be2d2770d2c5d6668d11db
 .\"		Author: Roman Zippel <zippel-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
@@ -74,6 +71,17 @@ struct timex {
                             (read-only) */
     struct timeval time; /* current time (read-only) */
     long tick;           /* usecs between clock ticks */
+
+    long ppsfreq;        /* pps frequency (scaled ppm) (read-only) */
+    long jitter;         /* pps jitter (usec) (read-only) */
+    int shift;           /* interval duration (sec) (read-only) */
+    long stabil;         /* pps stability (scaled ppm) (read-only) */
+    long jitcnt;         /* jitter limit exceeded (read-only) */
+    long calcnt;         /* calibration intervals (read-only) */
+    long errcnt;         /* calibration errors (read-only) */
+    long stbcnt;         /* stability limit exceeded (read-only) */
+
+    int tai;             /* TAI offset (s) (read-only) */
 };
 .fi
 .in
@@ -93,6 +101,7 @@ combination of zero or more of the following bits:
 #define ADJ_ESTERROR          0x0008 /* estimated time error */
 #define ADJ_STATUS            0x0010 /* clock status */
 #define ADJ_TIMECONST         0x0020 /* pll time constant */
+#define ADJ_TAI               0x0080 /* TAI offset */
 #define ADJ_TICK              0x4000 /* tick value */
 #define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime() */
 .fi
@@ -102,6 +111,20 @@ Ordinary users are restricted to a zero value for
 .IR modes .
 Only the superuser may set any parameters.
 .br
+In the case of
+.BR ADJ_TAI ,
+as
+.I buf->tai
+is read-only, the new value is passed through
+.IR buf->constant .
+.PP
+Support for TAI (Atomic International Time, for a complete explanation
about
+what it is and what is the difference between TAI and UTC, see
+.UR http://www.bipm.org/en/bipm/tai/tai.html
+.I BIPM
+.UE )
+has been added in version 2.6.29.
+.br
 .ne 12v
 .SH RETURN VALUE
 On success,
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
