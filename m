From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH 2/2] adjtimex.2: Change 'PPM' (parts per million) to 'ppm'
Date: Tue, 06 Jan 2015 16:42:08 +0100
Message-ID: <54AC0250.5080005@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr> <54A72360.3070807@supelec.fr> <54A724BE.8050409@supelec.fr> <54ABFD54.9000705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LaLN2odBVIfuvGJrKdoT6CHcfU3hw03VW"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54ABFD54.9000705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LaLN2odBVIfuvGJrKdoT6CHcfU3hw03VW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Le 06/01/2015 16:20, Michael Kerrisk (man-pages) a =C3=A9crit :

> Laurent, please watch out: your patches are injecting trailing
> white space on lines. My release scripts clean those up, but
> it means that patches apply with "noise".

Really? I see no extra whitespace in my diff. Where do they come?
Anyway, I'll take extra care next time. Thank you.

Laurent

>>
>> ---
>>  man2/adjtimex.2 | 15 +++++++--------
>>  1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
>> index ff4b23e..dbb2333 100644
>> --- a/man2/adjtimex.2
>> +++ b/man2/adjtimex.2
>> @@ -54,7 +54,7 @@ struct timex {
>>      long offset;      /* Time offset; nanoseconds, if STA_NANO
>>                           status flag is set, otherwise
>>                           microseconds */
>> -    long freq;        /* Frequency offset, in units of 2^-16 PPM
>> +    long freq;        /* Frequency offset, in units of 2^-16 ppm
>>                           (parts per million) (see NOTES below) */
>>      long maxerror;    /* Maximum error (microseconds) */
>>      long esterror;    /* Estimated error (microseconds) */
>> @@ -62,8 +62,7 @@ struct timex {
>>      long constant;    /* PLL (phase-locked loop) time constant */
>>      long precision;   /* Clock precision (microseconds,
>>                           read-only) */
>> -    long tolerance;   /* Clock frequency tolerance (PPM,
>> -                         read-only) */
>> +    long tolerance;   /* Clock frequency tolerance (ppm, read-only) *=
/
>>      struct timeval time;
>>                        /* Current time (read-only, except for
>>                           ADJ_SETOFFSET); upon return, time.tv_usec
>> @@ -71,13 +70,13 @@ struct timex {
>>                           flag is set, otherwise microseconds */
>>      long tick;        /* Microseconds between clock ticks */
>>      long ppsfreq;     /* PPS (pulse per second) frequency
>> -                         (2^-16 PPM (see NOTES), read-only) */
>> +                         (2^-16 ppm (see NOTES), read-only) */
>>      long jitter;      /* PPS jitter (read-only); nanoseconds, if
>>                           STA_NANO status flag is set, otherwise
>>                           microseconds */
>>      int  shift;       /* PPS interval duration
>>                           (seconds, read-only) */
>> -    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), read-o=
nly) */
>> +    long stabil;      /* PPS stability (2^-16 ppm (see NOTES), read-o=
nly) */
>>      long jitcnt;      /* PPS jitter limit exceeded (read-only) */
>>      long calcnt;      /* PPS calibration intervals (read-only) */
>>      long errcnt;      /* PPS calibration errors (read-only) */
>> @@ -349,9 +348,9 @@ In struct
>>  .IR ppsfreq ,
>>  and=20
>>  .I stabil
>> -are PPM (parts per million) with a 16-bits fractional part, which mea=
ns that a
>> -value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=3D=
65535 is=20
>> -1 PPM. This is the case for both input values (in the case of
>> +are ppm (parts per million) with a 16-bits fractional part, which mea=
ns that a
>> +value of 1 in one of those fields actually means 2^-16 ppm, and 2^16=3D=
65535 is=20
>> +1 ppm. This is the case for both input values (in the case of
>>  .IR freq )
>>  and output values.
>>  .SH CONFORMING TO
>>
>=20
>=20


--LaLN2odBVIfuvGJrKdoT6CHcfU3hw03VW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSsAlsACgkQRTidSplJch7ezQD7BWpmH2D9agAp7HRQsVYmQBu9
JvCTzhhg7V/JjtF98OgBAI/FrEgxcvqLILrU2I8V3LRQTHP/jTBUhib7EulXv0gD
=KMve
-----END PGP SIGNATURE-----

--LaLN2odBVIfuvGJrKdoT6CHcfU3hw03VW--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
