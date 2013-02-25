From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: ffix and tfix
Date: Mon, 25 Feb 2013 06:25:27 +0100
Message-ID: <CAKgNAkgTcSw1SNx4E9q_JPpNTJwYnZ3N5=Rz35F1SNx+nPz41w@mail.gmail.com>
References: <1361551634-17115-1-git-send-email-taffit@debian.org> <5127A286.9010300@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5127A286.9010300-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Fri, Feb 22, 2013 at 5:53 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hi Michael,
>
> Le 22/02/2013 12:47, David Pr=E9vot a =E9crit :
>> ---
>>  man2/perf_event_open.2 |  126 ++++++++++++++++++++++++++++---------=
-----------
>>  1 file changed, 73 insertions(+), 53 deletions(-)
>
> I forgot to mention, that you may wish to unify all the =93user-space=
=94
> occurrences to =93user space=94 (ditto for =93kernel-space=94 into =93=
kernel
> space=94) or the other way around, but not only on this page.

The general rule for compounds like this in English is that they
should be hyphenated when used attributively, and not hyphenated
otherwise. Thus:

     user-space operations

and

    operations performed in user space.

Man pages generally follows that rule, but you were right that the
perf_event_open.2 page was inconsistent. I've fixed it now.

Thanks,

Michael



> David
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
>
> iQIcBAEBCAAGBQJRJ6KGAAoJELgqIXr9/gny7T0QAK7jTSyg61oS4y3eWRqW2DTO
> k9flm4dLIb2fxenARzoto+1IuZ5piyldbgx+cNHsZZoWXN3t8e3FNMjgk2NdvCJu
> Gi5q/GN+ISoSzhZu8y3smRI81DF35YuYmHANbOhsYKY7aNXQt8cwofo+8xpmiXW6
> fVem4U4XrNje5CNSvl1AcJ8XtLFy9UoZ3IEbT3k2D74tZT8i7d566xq0wIQCr0g2
> 4DIqsVBWJWJOr8Mddwtx+BMEFI9ULFcMTQRxGemie25+W9HixsARuhy4Ds57Vr18
> uWMXDXVZp08yQwUuEHY0SrnO2xieo2EproqoosTHxMmUIe1lfL+jWB3wcdDDKJlY
> ekCbm6uUkg0BfSn4c3XaVwTc9Pc6RHaE1ifqTAp8wYrEnzycBgepeGiwAlso8FUx
> 9ul0l3qxEqK8X2zwvIXwIol2/WbNBjUjxuCEtwJikrg3R5BkEwdVQ6L4hmIfc2Yu
> Md7WE014JhkqCMTrltDQtJhEdQTah7R/Om1T4bFWyGA3gM1h0975xMhqFpBMGsBL
> rPb3U2nwSva63dsr+hL6raB0yhh35QJRCBRrM97qDBFp6+hi9JdwT5tAi4EjCTsp
> /S0qfwvfihApupaIup0beOCSAiYAdkV6Zaq55MgG6WkLqeGXRA8ISRV94/62AhEA
> bYcoqMEeBUinnt55t5dM
> =3DqlZ6
> -----END PGP SIGNATURE-----



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
