From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [patch v2] adjtimex.2: add explanation about ADJ_TAI action
Date: Sat, 29 Nov 2014 10:46:23 +0100
Message-ID: <547995EF.10804@supelec.fr>
References: <54787B5C.1080802@supelec.fr> <20141128210043.GB14432@localhost.localdomain> <5478FF09.6090508@supelec.fr> <54799198.1070907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54799198.1070907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Le 29/11/2014 10:27, Michael Kerrisk (man-pages) a =E9crit :
> Hello Laurent,
>=20
> Thanks for working on this. I have one question; see below.
>=20
>>
>> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
>> index 20a2f0b..871e607 100644
>> --- a/man2/adjtimex.2
>> +++ b/man2/adjtimex.2
>> @@ -26,9 +26,6 @@
>>  .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>  .\" Modified 2014-11-28 by Laurent Georget <laurent.georget@supelec=
=2Efr>
>>  .\"
>> -.\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
>> -.\"		commit 153b5d054ac2d98ea0d86504884326b6777f683d
>> -.\"
>>  .\" FIXME Document ADJ_MICRO and ADJ_NANO (added in Linux 2.6.26)
>>  .\"		commit eea83d896e318bda54be2d2770d2c5d6668d11db
>>  .\"		Author: Roman Zippel <zippel-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> @@ -74,6 +71,17 @@ struct timex {
>>                              (read-only) */
>>      struct timeval time; /* current time (read-only) */
>>      long tick;           /* usecs between clock ticks */
>=20
> What is the following piece about? Did you mean to include it in this=
 patch?

Those are new fields added in struct timex since the last edition of th=
e
man page. Maybe I should split the commit in two subcommits: the first
one to add the new fields, and the second one to specifically add the
ADJ_TAI flag?

>=20
>> +
>> +    long ppsfreq;        /* pps frequency (scaled ppm) (read-only) =
*/
>> +    long jitter;         /* pps jitter (usec) (read-only) */
>> +    int shift;           /* interval duration (sec) (read-only) */
>> +    long stabil;         /* pps stability (scaled ppm) (read-only) =
*/
>> +    long jitcnt;         /* jitter limit exceeded (read-only) */
>> +    long calcnt;         /* calibration intervals (read-only) */
>> +    long errcnt;         /* calibration errors (read-only) */
>> +    long stbcnt;         /* stability limit exceeded (read-only) */
>> +
>> +    int tai;             /* TAI offset (s) (read-only) */
>>  };
>=20
> Thanks,
>=20
> Michael
>=20

Thanks,

Laurent

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
