From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] adjtimex.2: Add details about ADJ_FREQUENCY
Date: Tue, 30 Dec 2014 19:47:21 +0100
Message-ID: <54A2F339.2080208@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr> <20141230180549.GB7403@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LrasO2uje6AfN0aLJU2xaRTrNkxwig1Ae"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141230180549.GB7403-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LrasO2uje6AfN0aLJU2xaRTrNkxwig1Ae
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi again,

Le 30/12/2014 19:05, Richard Cochran a =E9crit :
>> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
>> index 18823c8..2652fc6 100644
>> --- a/man2/adjtimex.2
>> +++ b/man2/adjtimex.2
>> @@ -55,8 +55,8 @@ struct timex {
>>                           status flag is set, otherwise
>>                           microseconds */
>>      long freq;        /* Frequency offset, as scaled PPM
>> -                         (parts per million) */
>> -.\" FIXME What is the scaling unit of timex.freq?  2^16 ?
>=20
> Your text sounds funny and seems unclear to me.  How about something
> more like this:
>=20
> 	long freq	/* Frequency offset in PPM with a 16 bit
> 			   factional field */
>

I tried to  phrase it as in the FIXME, but of course, that may not be
the best thing to do. I'm not sure to understand what you mean however
in your corrected comment for freq.

>> +                         (parts per million) :
>> +                         the scaling unit of timex.freq is 2^16 usec =
=3D
>> 1000*2^16 nsec.
>=20

> Your mailer is wrapping lines here ...

Indeed, it wrapped at 80 characters. I fixed it. Sorry about that.

>=20
>>      long maxerror;    /* Maximum error (microseconds) */
>>      long esterror;    /* Estimated error (microseconds) */
>>      int  status;      /* Clock command/status */
>> @@ -106,6 +106,10 @@ Set time offset from
>>  .BR ADJ_FREQUENCY
>>  Set frequency offset from
>>  .IR buf.freq .
>> +The clock frequency must be comprised between -500000 and 500000 scal=
ed
>> ns/s.
>=20
> and here.
>=20
> The phrase "must be comprised" does not make any sense in this
> context. How about this instead?
>=20
>    The allowed frequency range is -500 PPM to +500 PPM.
>=20

Sorry for my poor english.
I have a doubt about the calculations here.
If I understand the code correctly (and I'd like to, as I'm using it)
the input value is scaled with SHIFT_USEC whereas MAXFREQ is not. So,
PPM is not exactly the same unit here and above (in struct timex). How
should we phrase that?

Thanks

Laurent


--LrasO2uje6AfN0aLJU2xaRTrNkxwig1Ae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSi8z4ACgkQRTidSplJch4p6wEAhpZ/0IDMSey2fwxWhoIvk0an
vFL0+QnxnYXXserVQi0BAKp3QROvkItLIK3l/CrEVkwQOCfMkyx3oPR3ER2CfPt3
=6Gfc
-----END PGP SIGNATURE-----

--LrasO2uje6AfN0aLJU2xaRTrNkxwig1Ae--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
