From: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 10:11:00 +0100
Message-ID: <3b7ba39b-0434-47ca-7857-257f3c99266b@lgeorget.eu>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nkoOuof4elgGg1DV1oCxE7vhaPF6UPOnw"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478768067.2642.23.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nkoOuof4elgGg1DV1oCxE7vhaPF6UPOnw
Content-Type: multipart/mixed; boundary="ewB8JVNsUgupb41VIi43bR51hCs9jAQrW"
From: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>,
 "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org,
 George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>,
 =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
Message-ID: <3b7ba39b-0434-47ca-7857-257f3c99266b-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
References: <1461574090.32558.45.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <1470052099.2926.6.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> <1476952646.2522.10.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <b07fb334-149d-cf65-74f3-1d1951e5981b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478768067.2642.23.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <1478768067.2642.23.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

--ewB8JVNsUgupb41VIi43bR51hCs9jAQrW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I very much like the proposed patch. It nicely describes the new
interfaces and it's much more clear. I agree with the use of the
word "legacy" you don't seem to like, Michael, I think this is
accurate (although we might receive a new fair amount of bug reports
about this, when the patch is applied).

By the way, my mail was intended as an answer to the bug report but
I wonder if Corey Csuhta (the original bug poster) saw it because I
replied by email. What should we do about this bug now?

Cheers,
Laurent

Le 10/11/2016 =C3=A0 09:54, Nikos Mavrogiannopoulos a =C3=A9crit :
> On Wed, 2016-11-09 at 16:23 +0100, Michael Kerrisk (man-pages) wrote:
>> [I'm looping a few people into this mail who previously commented
>> on this page. Nikos, I will also thread you into an earlier mail=20
>> by Laurent Georget.]
>>
>> Hello Nikos,
>>
>> Sorry that I have been so slow to follow up on this.
>> Thanks for your persistence. I have some comments=20
>> that probably require some tweaks to your patch.
>> I also have some questions about a couple of other=20
>> earlier discussions.
>=20
> The comments should be addressed now (see inline for more info or the
> attached patch). I have not included my proposed fix for Laurent's
> issue (my proposal was to drop that text, though it can be done
> independent of this patch).
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D71211
>=20
>=20
>=20
>=20
>>
>> On 10/20/2016 10:37 AM, Nikos Mavrogiannopoulos wrote:
>>>
>>> On Mon, 2016-08-01 at 13:48 +0200, Nikos Mavrogiannopoulos wrote:
>>>>
>>>>>
>>>>> This is an updated patch reflecting the recent discussion in
>>>>> linux-
>>>>> crypto:
>>>>> http://www.mail-archive.com/linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg204
>>>>> 00.html
>>> Hi,
>>>  I'm resending the patch with few typo fixes, and adding Ted in CC
>>> for
>>> review. Ted would you like to review this patch for the random(4)
>>> manpage?
>>
>> Some comments below.
>>
>> But one question first. You didn't further reply to George=20
>> Spelvin's comments on 26 April. Did you consider those comments
>> irrelevant or already addressed or something else?
>=20
> I believe we disagree on some points with George (see other mail).
>=20
>> By the way, inline patches are rather easier for me to deal with.
>=20
> (sorry for the attachment, I have no figured a way to make my mailer
> send consistently the right data when inline)
>=20
>=20
>>> +.\" 2016-10-20, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> +.\"     Mention that /dev/random is a legacy interface and removed
>>> suggested
>>> +.\"     uses of /dev/random.
>>
>> No need to update this in-page changelog. We use git these days.
>=20
> done
>=20
>>> +.LP
>>> +The \fI/dev/random\fP device is a legacy interface which dates
>>> back to
>>> +a time where the cryptographic primitives used in the
>>> implementation
>>
>> s%in the implementation%in the implementation of /dev/urandom% ?
>>
>=20
> done.
>=20
>>>  has no effect when opening
>>>  .IR /dev/urandom .
>>> @@ -82,6 +84,8 @@ for the device
>>>  signals will not be handled until after the requested random bytes
>>>  have been generated.
>>> =20
>>> +
>>> +
>>
>> Please remove these two blank lines.
>=20
> done.
>=20
>=20
>>>  Since Linux 3.16,
>>>  .\" commit 79a8468747c5f95ed3d5ce8376a3e82e0c5857fc
>>>  a
>>> @@ -104,14 +108,11 @@ This means that it will impact the contents
>>>  read from both files, but it will not make reads from
>>>  \fI/dev/random\fP faster.
>>>  .SS Usage
>>> -If you are unsure about whether you should use
>>> +The=20
>>>  .IR /dev/random
>>> -or
>>> +interface is considered a legacy interface, and
>>
>> I'm a little uncomfortable with the term "legacy". To me it implies=20
>> that there is *no* legitimate use of /dev/random these days. I'm
>> no expert on randomness, but I wonder if that is true. Is it?
>> If it's not, then I would prefer simply a strong statement that
>> "/dev/urandom is preferred and sufficient in all use cases".
>=20
> That's a tough one to handle. Yes /dev/urandom is preferred and
> sufficient in all use cases, with the exception of early boot time.
> More in the text. I've also added a section "KNOWN ISSUES" to state
> clearly that issue, and mention getrandom() early in the page.
>=20
> =20
>>>  If a seed file is saved across reboots as recommended below (all
>>> major
>>>  Linux distributions have done this since 2000 at least), the
>>> output is
>>> -- 2.7.4
>> Laurent Georget also commented on this page in a mail last year.
>> I'm going to thread you (and the other people on this mail) into
>> that mail discussion in case there's something there that you
>> might incorporate into a revised patch.
>=20
> I think it was a different paragraph. Replied in the other email.
>=20
> regards,
> Nikos
>=20


--ewB8JVNsUgupb41VIi43bR51hCs9jAQrW--

--nkoOuof4elgGg1DV1oCxE7vhaPF6UPOnw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAlgkOaQACgkQRTidSplJch5JnQD8DKsuf1r6cAQrgjUBCczV0pFr
MUb73Rurz/hDgdltUJoA/isKUZNlIEGODSGJL/ucdIH4f7mA3E4h2jvuaqUKEHJK
=WxAO
-----END PGP SIGNATURE-----

--nkoOuof4elgGg1DV1oCxE7vhaPF6UPOnw--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
