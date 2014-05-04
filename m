From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] proc.5: cfix
Date: Sun, 04 May 2014 19:04:26 -0400
Message-ID: <5366C77A.60901@debian.org>
References: <1399166675-16019-1-git-send-email-taffit@debian.org> <5365D327.3010002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5365D327.3010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Michael,

Le 04/05/2014 01:41, Michael Kerrisk (man-pages) a =C3=A9crit :

> Including the ':' was intended. Why did you want to remove it?

The purpose is just a consistency fix: there is another occurrence of
"Referenced" in the same context in the /proc/[pid]/smaps paragraph,
with a few other fields, always inside double quotes, and without a col=
on.

Regards

David

> On 05/04/2014 03:24 AM, David Pr=C3=A9vot wrote:
>> ---
>>  man5/proc.5 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/man5/proc.5 b/man5/proc.5
>> index be6b755..123bc8f 100644
>> --- a/man5/proc.5
>> +++ b/man5/proc.5
>> @@ -155,14 +155,14 @@ bits for all file-mapped pages associated with=
 the process.
>>  .IP
>>  Clearing the PG_Referenced and ACCESSED/YOUNG bits provides a metho=
d
>>  to measure approximately how much memory a process is using.
>> -One first inspects the values in the "Referenced:" fields
>> +One first inspects the values in the "Referenced" fields
>>  for the VMAs shown in
>>  .IR /proc/[pid]/smaps
>>  to get an idea of the memory footprint of the
>>  process.
>>  One then clears the PG_Referenced and ACCESSED/YOUNG bits
>>  and, after some measured time interval,
>> -once again inspects the values in the "Referenced:" fields
>> +once again inspects the values in the "Referenced" fields
>>  to get an idea of the change in memory footprint of the
>>  process during the measured interval.
>>  If one is interested only in inspecting the selected mapping types,
>>
>=20
>=20

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJTZsd6AAoJEAWMHPlE9r08wAAH/jD1QDxulHL8XuTQ4xfnqF/H
o2w6mxe77XB16VHbM1aJjKGUpUJTr8F78Ynzbqom3h7rR6vyBCYSmqeXpUUndgO8
fTD+cfmrX13ZoGtAu8+O24CLwKhPboB0WRzWUlSZfLa2Rfb7bhMYwyzF9NnI4N0m
XkJZNzXuKRjYS9R7tHg4nDG2R+uuX21WSJtrLLpj2pcewQr4oRp/0pTIHXSR38kf
T/Fx30eLypb900ygEWH8wZcZiaF6gPLRufJGkXzFLat5rp21YzwHfDHN0JK4Kk2G
oG5DUHIwrtUGIUVrtSFZQ+n0yUR11S+/ViHsA6H3xzDzytrjgKCdruNwmAOJPiw=3D
=3DDqiT
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
