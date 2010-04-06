From: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be
 a documentation bug)
Date: Tue, 6 Apr 2010 11:03:58 +0200
Message-ID: <20100406090358.GP11893@laphroaig.corp>
References: <20100403201146.28880.qmail@sourceware.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100403201146.28880.qmail-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
 <20100331172608.11459.madcoder-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

See below a bug reported against the glibc.  Since the glibc maintainer
dodged that one, I assume the bug indeed is in the documentation of
ftw(3). My manpages are the 3.24-1 Debian package.

IMHO the patch is:

 -fpath is the pathname of the entry relative to dirpath.
 +fpath is the pathname of the entry relative to the current working di=
rectory.

POSIX is very vague about what "fpath" should be btw.


On Wed, Mar 31, 2010 at 05:26:09PM -0000, madcoder at debian dot org wr=
ote:
> The man page states:
>=20
>        int ftw(const char *dirpath,
>                int (*fn) (const char *fpath, const struct stat *sb,
>                           int typeflag),
>                int nopenfd);
>=20
>        [...]
>=20
>        fpath is the  pathname  of  the  entry  relative to dirpath.
>=20
> Though it appears that it is the pathname of the entry relative to th=
e current=20
> working directory.
>=20
> FWIW this may be a documentation bug since the similar fts interface =
clearly=20
> states that the similar fts_accpath is relative to the current workin=
g=20
> directory.
>=20
> --=20
>            Summary: ftw doesn't work like documented (may be a docume=
ntation
>                     bug)
>            Product: glibc
>            Version: unspecified
>             Status: NEW
>           Severity: normal
>           Priority: P2
>          Component: libc
>         AssignedTo: drepper at redhat dot com
>         ReportedBy: madcoder at debian dot org
>                 CC: glibc-bugs at sources dot redhat dot com
>=20
>=20
> http://sourceware.org/bugzilla/show_bug.cgi?id=3D11459
>=20
> ------- You are receiving this mail because: -------
> You reported the bug, or are watching the reporter.

On Sat, Apr 03, 2010 at 08:11:46PM -0000, drepper at redhat dot com wro=
te:
>=20
> ------- Additional Comments From drepper at redhat dot com  2010-04-0=
3 20:11 -------
> The man pages do not come with glibc and are in no way authoritative.=
  You have
> to report this elsewhere.
>=20
> --=20
>            What    |Removed                     |Added
> ---------------------------------------------------------------------=
-------
>              Status|NEW                         |RESOLVED
>          Resolution|                            |INVALID
>=20
>=20
> http://sourceware.org/bugzilla/show_bug.cgi?id=3D11459
>=20
> ------- You are receiving this mail because: -------
> You reported the bug, or are watching the reporter.


--=20
=C2=B7O=C2=B7  Pierre Habouzit
=C2=B7=C2=B7O                                                madcoder@d=
ebian.org
OOO                                                http://www.madism.or=
g
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
