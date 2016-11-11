From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
Date: Fri, 11 Nov 2016 12:01:34 +0100
Message-ID: <48e730fc-4eeb-189e-92b4-eaa2720d3eda@supelec.fr>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
 <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com>
 <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
 <1478788558.3579.47.camel@redhat.com>
 <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
 <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com>
 <1478850099.2484.7.camel@redhat.com>
 <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M4OkCHt0nLpTrf568fiGPt4iW12fMqIIi"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Onkar Mahajan <on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M4OkCHt0nLpTrf568fiGPt4iW12fMqIIi
Content-Type: multipart/mixed; boundary="ailxPNxkIAFBWHIx1xNRtfmdGV1pnH5u6"
From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?=
 <c@tunnel53.net>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>,
 Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>,
 Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org,
 Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Onkar Mahajan <on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Message-ID: <48e730fc-4eeb-189e-92b4-eaa2720d3eda-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <55B65DAC.6010906-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
 <2fc34759-5d2b-4192-9611-b499e23efdf8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478767372.2642.15.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <fa60e32a-1364-d0be-245f-d8ead6d04713-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478788558.3579.47.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <66494ef9-80d1-e437-252a-4a15e1f497db-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
 <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478850099.2484.7.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--ailxPNxkIAFBWHIx1xNRtfmdGV1pnH5u6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Le 11/11/2016 =C3=A0 11:47, Michael Kerrisk (man-pages) a =C3=A9crit :
> Hi Nikos,
>=20
> On 11 November 2016 at 08:41, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> On Thu, 2016-11-10 at 19:16 +0100, Michael Kerrisk (man-pages) wrote:
>>> Nikos, Laurent,
>>> So, I must admit that after your respective mails, I'm still not
>>> clear. Do you think I should keep this patch, change it, or
>>> discard it?
>>
>> It is a bit confusing to me. The sentences:
>> "When  reading  from  /dev/urandom  (GRND_RANDOM  is  not set),
>> getrandom()"
>>
>> and
>>
>> "The behavior when a call to getrandom() that is
>> blocked  while  reading  from  /dev/urandom"
>>
>> seem to imply that getrandom() is a wrapper over /dev/urandom (i.e.,
>> internally it opens the device reads etc). That's not the case the
>> system call doesn't go through /dev/urandom, although the pools behind=

>> are the same.
>=20
> I agree that this language is a bit confusing. But that language was
> not introduced by my patch.
>=20
>> maybe saying the /dev/urandom pool instead, but I find that even that
>> could confuse someone.
>>
>> So while the text is better and more precise in other aspects than
>> before I think it is a bit confusing the mix of getrandom() with
>> /dev/urandom and /dev/random. Maybe copy the text back and separate th=
e
>> descriptions even if they are very similar at the moment?
>=20
> I'm reluctant to duplicate text in two places. I think that that
> duplication os prt of the reason why we have the current mess.

So, maybe all this discussion about which interface to choose, expected
usage, etc. should go to a random.7 man page? This would be the logical
location to detail the differences about the three interfaces. What do
you think?

Cheers,
Laurent


--ailxPNxkIAFBWHIx1xNRtfmdGV1pnH5u6--

--M4OkCHt0nLpTrf568fiGPt4iW12fMqIIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAlglpQ4ACgkQRTidSplJch7tJQD+M5njIzqgkGh0jfXmmVBzvPvM
HFlBxPU8SsCVwsKzopAA/1JOAW8j6TOQ1qHFS+yp/kUts5PukKqEWQ8B8jKfV7F6
=oKIt
-----END PGP SIGNATURE-----

--M4OkCHt0nLpTrf568fiGPt4iW12fMqIIi--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
