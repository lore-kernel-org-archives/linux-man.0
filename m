From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: Bug#773443: host.conf.5: spoof deprecated ?
Date: Tue, 10 Mar 2015 00:26:28 +0100
Message-ID: <20150309232628.GA17006@free.fr>
References: <20150308130510.GA3004@free.fr>
 <54FD4A19.2030203@gmail.com>
 <20150309075913.GA1341@free.fr>
 <54FD61CD.2060900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD61CD.2060900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 773443-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Le lundi 09 mars 2015 =C3=A0 10:03:09, Michael Kerrisk (man-pages) a =C3=
=A9crit :
> On 03/09/2015 08:59 AM, St=C3=A9phane Aulery wrote:
> > Le lundi 09 mars 2015 =C3=A0 08:22:01, Michael Kerrisk (man-pages) =
a =C3=A9crit :
> >>
> >> On 03/08/2015 02:05 PM, St=C3=A9phane Aulery wrote:
> >>>
> >>> A Debian user reported that [1]:
> >>>
> >>>> spoof* keywords (nospoof, spoofalert, spoof) are here from 1996,
> >>>> they are still valid keywords but do not have any effect apparen=
tly,
> >>>> no libraries or tools use them
> >>>>
> >>>> it is misleading to see references to resolv+ and rlogin, the ke=
ywords
> >>>> are just ignored these days; the only meaning they have is that =
they
> >>>> are
> >>>> allowed by host.conf syntax
> >>>
> >>> The glibc source code seems to confirm that the keywords nospoof,
> >>> spoofalert and spoof are accepted but without effects. I could fi=
nd
> >>> nothing in the changelog. Could you please confirm that they are
> >>> obsolete? I could correct the man page accordingly.
> >>
> >> I had a quick grep in the glibc source code.
> >>
> >> It appears that you (and the reporter) are correct. (Even back in=20
> >> glibc 2.1, things look the same).
> >>
> >> A patch would be appreciated!

I dug a little further comparing versions 2.0.6 [1], 2.0.7 [2]
and trunk [3] of glibc and I come to a different conclusion.

The keywords nospoof, spoofalert, spoof and RESOLV_SPOOF_CHECK were
added to glibc 2.0.7 but never implemented and documented in the
changelog.

[1] http://ftp.gnu.org/gnu/glibc/glibc-2.0.6.tar.gz
[2] http://archive.debian.org/debian/dists/hamm/main/source/libs/glibc_=
2.0.7t.orig.tar.gz
[3] https://sourceware.org/git/?p=3Dglibc.git&a=3Dsearch&h=3DHEAD&st=3D=
grep&s=3Dspoof&sr=3D1

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
