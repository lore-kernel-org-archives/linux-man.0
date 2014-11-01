From: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Sat, 1 Nov 2014 08:10:14 +0530
Message-ID: <20141101024013.GA2550@spoyarek.pnq.redhat.com>
References: <5453FE6F.3010501@redhat.com>
 <545402A1.30404@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <545402A1.30404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org >> Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 31, 2014 at 10:44:01PM +0100, Jan Chaloupka wrote:
> can you help me with this? I have problems finding out why the statfs.h
> tarball of glibc contains f_spare[6], but the resulting build contains
> f_spare[4]? There is no patch that changes the 6 to 4. Looking into spec
> file, I am lost.

There are different versions of statfs.h for each architecture or OS.
The generic bits/statfs.h in the sources has f_spare[6], but the file
that gets installed (and used during glibc build) on linux based x86
systems is sysdeps/unix/sysv/linux/bits/statfs.h.

Siddhesh

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUVEgNAAoJEHnEPfvxzyGH8GUH/0/t7v7I70gQiEQe5gH2gUZ8
o1mGu4NGiLnI9UUsafqGDRdHiQpg59nwZCcKxTgIchLn2txvhaS04stVT7sUhPsf
fmIil9gScapbI0iPK71/XAFhRWwyvZ5J6u3AshOc9guwAW1xUNV1875pcAyi8aPw
nY3T2T9jzdUctRiWc80GOn6CEp5gXzfcNzeSWEhIRuZnleR9I1vIcOES8K8jq5ly
hvYoizhyxrIUSiODh/KTMBQzJ9KWwqLUeMginTIrt9upEXBrbURYuuh+S+bU19bK
+O/W1AFFiKrDgxVHUtmQFnhW4pbUSfWOi8ScoaF8SUzEdJ0SN9lSf+/s7baSIjQ=
=6iGW
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
