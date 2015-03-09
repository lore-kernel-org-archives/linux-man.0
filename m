From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: Bug#773443: host.conf.5: spoof deprecated ?
Date: Mon, 9 Mar 2015 08:59:13 +0100
Message-ID: <20150309075913.GA1341@free.fr>
References: <20150308130510.GA3004@free.fr>
 <54FD4A19.2030203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD4A19.2030203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 773443-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Le lundi 09 mars 2015 =C3=A0 08:22:01, Michael Kerrisk (man-pages) a =C3=
=A9crit :
> Hello St=C3=A9phane
>=20
> On 03/08/2015 02:05 PM, St=C3=A9phane Aulery wrote:
> > ** COPY OF GLIBC BUGZILLA #18091 FOR INFORMATION **
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D18091
> >=20
> > -----------------------------------------------------
> >=20
> > Hello,
> >=20
> > A Debian user reported that [1]:
> >=20
> >> spoof* keywords (nospoof, spoofalert, spoof) are here from 1996,
> >> they are still valid keywords but do not have any effect apparentl=
y,
> >> no libraries or tools use them
> >>
> >> it is misleading to see references to resolv+ and rlogin, the keyw=
ords
> >> are just ignored these days; the only meaning they have is that th=
ey
> >> are
> >> allowed by host.conf syntax
> >=20
> > The glibc source code seems to confirm that the keywords nospoof,
> > spoofalert and spoof are accepted but without effects. I could find
> > nothing in the changelog. Could you please confirm that they are
> > obsolete? I could correct the man page accordingly.
>=20
> I had a quick grep in the glibc source code.
>=20
> It appears that you (and the reporter) are correct. (Even back in=20
> glibc 2.1, things look the same).
>=20
> A patch would be appreciated!

Eventually, I may check others values too.
Do you to want to drop obsolete values or add a note ?

Cheers,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
