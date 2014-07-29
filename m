From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] charsets.7: Tidy up list
Date: Tue, 29 Jul 2014 10:29:07 +0200
Message-ID: <CAKgNAkj=3cnmYBjZitHHv3aZfkcE+=U2rBeYqvu3Wd3VLZnkhw@mail.gmail.com>
References: <1405307953-24884-1-git-send-email-taffit@debian.org>
 <53C4ACF4.4010907@gmail.com> <53D6BB45.3040902@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D6BB45.3040902-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?David_Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

Could you comment on the below?

On Mon, Jul 28, 2014 at 11:06 PM, David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>=
 wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hi,
>
> Le 15/07/2014 00:24, Michael Kerrisk (man-pages) a =C3=A9crit :
>> On 07/14/2014 05:19 AM, David Pr=C3=A9vot wrote:
>>> Remove German from main list as Dutch and French were.
>
>> Can you say a bit more about why this change is needed please.
>
> Well, needed is a strong word. In a8ed5f7430, Dutch and French have b=
een
> removed from the main list, I assume it=E2=80=99s because they are li=
sted in the
> secondary list (language almost fully supported). I believe that Germ=
an
> should also have been removed from them main list since it=E2=80=99s =
also on the
> secondary list.

Hopefully, Marko can comment here.

Cheers,

Michael

>>> ---
>>>  man7/charsets.7 | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/man7/charsets.7 b/man7/charsets.7
>>> index 300d819..45d18ce 100644
>>> --- a/man7/charsets.7
>>> +++ b/man7/charsets.7
>>> @@ -68,7 +68,7 @@ Here are brief descriptions of each set:
>>>  .TP
>>>  8859-1 (Latin-1)
>>>  Latin-1 covers many West European languages such as Albanian, Basq=
ue,
>>> -Danish, English, Faroese, Galician, German, Icelandic, Irish, Ital=
ian,
>>> +Danish, English, Faroese, Galician, Icelandic, Irish, Italian,
>>>  Norwegian, Portuguese, Spanish, and Swedish.
>>>  The lack of the ligatures Dutch =C4=B2/=C4=B3, French =C5=93, and =
old-style =E2=80=9EGerman=E2=80=9C
>>>  quotation marks was considered tolerable.
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
>
> iQEcBAEBCAAGBQJT1rtFAAoJEAWMHPlE9r08uR8IAIubFzzFtwLgMGXdSyDr/UxO
> wKxnPP2pfWCHWLLKxngQEmszUqygHL19f+cdTjCuNMJNKqFmQUUHPLP2OGZME7Xw
> qJovJVww98faWRIxpX7ml396y491pD1HE4M2veGE4aeJwyurSy16YbWA3WIWVWYU
> oQHlUqmybowWeR8MTN1XgIMJAiN5Y8BxFq4ohrEwS4/6rDiRCfPQcsmxcRXMqyTt
> CAigzYFs5H6DwEqCc5FxxaSTg+wbWFv2HRMxqGuXXjlGHcuaI9b02iKuc6WNooMn
> SYt15otHX9b50uFmc5rYJo0I6jIj/e7Tl6o5QMHP5pWaZxs/3G4/PHnJs1oTMuI=3D
> =3DD0ya
> -----END PGP SIGNATURE-----



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
