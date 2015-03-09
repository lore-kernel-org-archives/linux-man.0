From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#773443: host.conf.5: spoof deprecated ?
Date: Mon, 09 Mar 2015 08:22:01 +0100
Message-ID: <54FD4A19.2030203@gmail.com>
References: <20150308130510.GA3004@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150308130510.GA3004-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>, 773443-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane

On 03/08/2015 02:05 PM, St=C3=A9phane Aulery wrote:
> ** COPY OF GLIBC BUGZILLA #18091 FOR INFORMATION **
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D18091
>=20
> -----------------------------------------------------
>=20
> Hello,
>=20
> A Debian user reported that [1]:
>=20
>> spoof* keywords (nospoof, spoofalert, spoof) are here from 1996,
>> they are still valid keywords but do not have any effect apparently,
>> no libraries or tools use them
>>
>> it is misleading to see references to resolv+ and rlogin, the keywor=
ds
>> are just ignored these days; the only meaning they have is that they
>> are
>> allowed by host.conf syntax
>=20
> The glibc source code seems to confirm that the keywords nospoof,
> spoofalert and spoof are accepted but without effects. I could find
> nothing in the changelog. Could you please confirm that they are
> obsolete? I could correct the man page accordingly.

I had a quick grep in the glibc source code.

It appears that you (and the reporter) are correct. (Even back in=20
glibc 2.1, things look the same).

A patch would be appreciated!

Cheers,

Michael

PS For reports like this, when you've checked things, it would speed=20
things a little to note how you deduced your info (e.g., reference=20
to source file and function).



>=20
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D773443



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
