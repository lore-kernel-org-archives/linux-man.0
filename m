From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Converting man-pages to UTF-8
Date: Fri, 14 Feb 2014 16:28:11 +0100
Message-ID: <52FE360B.9050302@gmail.com>
References: <CAKgNAkh5tHmJc2DrcoAJsDWWFao6bPckd2sN1dw-CZDSFNi5kQ@mail.gmail.com> <20140214114216.GE6397@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140214114216.GE6397-K2jUmMR1UYV4cg9Nei1l7Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>, Werner Lemberg <wl-mXXj517/zsQ@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/14/2014 12:42 PM, Colin Watson wrote:
> On Fri, Feb 14, 2014 at 11:43:30AM +0100, Michael Kerrisk (man-pages)=
 wrote:
>> At https://bugzilla.kernel.org/show_bug.cgi?id=3D60807 is a proposal=
 to
>> convert the pages of the the "man-pages" project to UTF 8. I thought
>> it worthwhile bringing that topic to the list, and CCing a few peopl=
e
>> who may have some ideas about this step, since I'm not too sure of t=
he
>> implications.
>>
>> Peter Schiffer has kindly written some some scripts to do the
>> conversion, which would touch about 40 files. However, as far I can
>> tell, many of the pages that have non-ASCII characters have inside
>> groff comments (author's names, etc.). The only pages that have
>> non-ASCII characters in the rendered source are various man7 pages o=
n
>> character sets. These were the pages to which I added a groff encodi=
ng
>> marker in response to Colin Watson's input on this Debian bug:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D519209
>>
>> Moving to UTF-8 for the pages seems like a good idea, at least at so=
me
>> point. However, I'm wondering whether there are any backward
>> compatibility issues that I should need to worry about. As far as I
>> know, groff added UTF-8 support back in Jan 2009, so, just over 5
>> years ago. Perhaps that's long enough ago now, that any backward
>> compatibility issues with old versions of groff would be minimal.
>> (I.e., the number of people installing new man-pages on systems with
>> old groff is likely to be very small, and anyway, only a dozen or so
>> pages in Section 7 are affected. Furthermore, I'm assuming that Linu=
x
>> distros have been shipping groff v1.20+ for quite a long time now.)
>=20
> I think for characters in comments you're probably fine, and any
> problems you might have had should be gone as of groff 1.20.  Debian
> switched to that in July 2009, and I think we were late to the party
> because we had some difficult historical baggage to clean up at the s=
ame
> time.  I'm not aware of anyone shipping older versions of groff any
> more.
>=20
> When you convert characters that show up in rendered source, I suspec=
t
> systems using the other man package (1.6g or similar versions) may
> render them poorly, because it invokes nroff in some fairly na=EFve a=
nd
> hardcoded ways.  However, they already break in various related ways,
> and most distributions have switched to man-db now, or dealt with thi=
ngs
> some other way.  My rough survey of the major distributions for this =
is:
>=20
>   Arch has been good since about 2009
>=20
>   Debian and descendants are good as of late 2007 / early 2008 (addit=
ion
>   of manconv to man-db)
>=20
>   Fedora is definitely good as of 2010 (switch to man-db), and I thin=
k
>   was good before that as IIRC they did a flag day to switch everythi=
ng
>   to UTF-8 with man
>=20
>   Gentoo switched to man-db at the end of 2013, so should be good now
>=20
>   Mageia has a current groff, but uses man 1.6g with a stack of patch=
es
>   (some encoding-related)
>=20
>   openSUSE has been fine for about the same length of time as Debian
>=20
>   Slackware has a current groff, but uses man 1.6g without much in th=
e
>   way of special patches (just one to make things work for UTF-8
>   *output*)
>=20
> My guess is that Mageia and Slackware may find that things only work
> properly for users in UTF-8 locales, but most other major distributio=
ns
> should be fine.  You won't be the first author to switch to UTF-8 man=
ual
> pages; all you'll be doing is making existing shortcomings perhaps
> marginally more obvious.  In any case, the pages currently encoded in
> ISO-8859-1 won't be very seriously affected, and users of problematic
> systems will only have been able to read the other pages with good lu=
ck
> and a following wind anyway; switching to UTF-8 will probably actuall=
y
> improve things for them if they're using a UTF-8 locale.  (That is, t=
he
> problems that the affected systems have generally relate to attemptin=
g
> to read pages whose encoding doesn't match that of their locale.)  Th=
ey
> might possibly need to add the -k option to their nroff invocation in
> man.conf.
>=20
> If I were you I would just go ahead.
>=20
> Regarding your questions in the bug, please do keep the "coding:" tag=
 in
> there; man-db will figure this out by brute force, but if left to its
> own devices I think groff's preconv will default to the locale's
> encoding, so it will only work for some people.

Hello Colin,

Thanks for the extensive reply! One final point. For the pages that
have non-ASCII characters only in source comments, not in rendered
input source, does it matter whether or not the "coding:" tag is added?
I ask because, simply for documentary purposes, I'm wondering whether
we should add that tag only in the pages that have UTF-8 in the rendere=
d
input.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
