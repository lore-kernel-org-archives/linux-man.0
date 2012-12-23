From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: tfix
Date: Sun, 23 Dec 2012 20:05:50 +0100
Message-ID: <CAKgNAkhGieARHZvyMBFUwc03j5V=QWv=Nd6PGX1p8ouXt9W1iw@mail.gmail.com>
References: <1356269632-19913-1-git-send-email-taffit@debian.org>
 <CAKgNAkg_QGc_T_Kjw34ExgHnDnZ0Df4nkFR6zisvT0=ZTQBYsg@mail.gmail.com> <50D75456.7060406@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D75456.7060406-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Sun, Dec 23, 2012 at 7:58 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hi Michael,
>
> Le 23/12/2012 13:55, Michael Kerrisk (man-pages) a =E9crit :
>
>> I applied the first change, but the second is unneeded.
>
> Please note that the =93structure.=94 moved up as part of c6a7484a (w=
ith the
> FIXMEs), and the current paragraph doesn't currently end with a perio=
d
> as it used to.

Ahhh! Thanks for catching that. I overlooked the absence of a period.

I had looked at "struct ipv6_mreq structure" and decided that it came
from the Department of Redundancy Department. So, i"structure" should
not have been there in the first place. I changed
=2EI struct ipv6_mreq
to
=2EIR "struct ipv6_mreq" .

Thanks,

Michael

>>> diff --git a/man7/ipv6.7 b/man7/ipv6.7
>>> index 506218a..bf0e991 100644
>>> --- a/man7/ipv6.7
>>> +++ b/man7/ipv6.7
>>> @@ -4,7 +4,6 @@
>>>  .\" and in case of nontrivial modification author and date
>>>  .\" of the modification is added to the header.
>>>  .\" $Id: ipv6.7,v 1.3 2000/12/20 18:10:31 ak Exp $
>>> -structure.
>>>  .\"
>>>  .\" The following socket options are undocumented
>>>  .\"    All of the folloing are from:
>>> @@ -213,6 +212,7 @@ programs that don't know how to deal with the I=
Pv6 API.
>>>  Control membership in multicast groups.
>>>  Argument is a pointer to a
>>>  .I struct ipv6_mreq
>>> +structure.
>>>  .TP
>>>  .B IPV6_MTU
>>>  .BR getsockopt ():
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
>
> iQIcBAEBCAAGBQJQ11RTAAoJELgqIXr9/gnyfEoP/2fwAJMZZYCU+f0YJIxdqAJg
> iNf6A6YWu8Bm72lp4smxZgs/MzNdUeFQG0q2t+eNTqCOoVucbLvfbs/hLNYI/nNV
> Q3bs/KkcHO2yJzCWLkfo5N2gGbwYCO2iR+XPWv5M3TltHw1+EwJjX9KTVxgmd6NZ
> AgbSrMuG1lgt/pMLT1PypfXJ8VZ5QsK9Kiyl7G5AJbzKePKGPvE/Z0bXu0wSv1dR
> L/gfJ4G5YTHX8GWD01/EgqU7khdg+d+oyjehkYeVkV8LvDv8bEcjftzOi5BdaMUv
> vMI9c6yf5vQzjwJqAqv1LOoXvMl2aPAMHxTEUSSf4EeV0Za4ip/72KWQWaRi5SBN
> yq1wdGKP46UwWPipbvyj3S4KNrbkTuoyDQrVg+JD8KFogEM8hIkWuFY61NekDJqp
> b1WVEJ9Ti+dISBU2ljfIbhG4Oy7r+ihw5ISdbhpDGzGWyTlVGUKVWQOo3PhmshdN
> p/ql3zzZB7bKsv9JEW5wdKjxklJsVupVOVnG1o67+nElvcYDwe6KNczRCUx4TuQj
> YyGXH1pMGi1NuQLrHrjDflG41vWSVA8FZgR+/v3YMxY3rjJL9uz1hPKEXt+aZSfF
> sgKwCpjyInlmfrb6saSJkjJv9VaxSA23s2QlY+yBD5K/eNEBbJpZoodu5tW0N3dv
> Mxua//gnphEiZLUZThWg
> =3DzWWa
> -----END PGP SIGNATURE-----



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
