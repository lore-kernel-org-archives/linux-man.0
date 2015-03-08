From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: undocumented man pages
Date: Sun, 08 Mar 2015 09:08:09 +0100
Message-ID: <54FC0369.3010705@gmail.com>
References: <20150307145716.GA24297@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150307145716.GA24297-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane,

On 03/07/2015 03:57 PM, St=C3=A9phane Aulery wrote:
> Hello Michael,
>=20
> Bug reports about the missing pages are frequent but unnecessary. The=
 web page
> "missing_pages.html" of the site is very clear about this but unfortu=
nately
> "invisible" to end users.
>=20
> What do you think about to add a "undocumented" page for each section=
 (as
> undocumented.3) and create each missing pages with a reference to the
> appropriate "undocumented" page. Thus we can also encourage users to =
become
> contributors and avoid unnecessary reports.

My problem with this idea is that my simple test when wondering if
a man page exists for an API is to look in the appropriate man?/=20
directory for a file with the right name. With the scheme above, I then
need to look inside the file to see if it is a link to undocumented.x.
That would be a small inconvenience.

Yes, the reports about missing pages are a minor irritation, but I'm
a little doubtful that such an "undocumented" page would encourage much
contribution. (I could be wrong, that's just my guess.)

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
