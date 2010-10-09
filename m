From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: arm_fadvise() man page
Date: Sat, 9 Oct 2010 14:40:10 +0200
Message-ID: <201010091440.12442.stephan.mueller@atsec.com>
References: <AANLkTinQ7xBBa1VqR9oiLoh=7JCiR7BAeFceE3Cgc+TT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinQ7xBBa1VqR9oiLoh=7JCiR7BAeFceE3Cgc+TT-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Samstag, 9. Oktober 2010, um 06:50:29 schrieb Michael Kerrisk:

Hi Michael,

> [Was: man pages for undocumented system calls]
>=20
> Stephan,
>=20
> The situation here is similar to sync_file_range, but specific to ARM=
=2E
> The documentation would better be in the posix_fadvise() page, should
> explicitly note that this system call is for ARM only, and should not=
e
> why the system call exists. For man-pages-3.29, I applied the patch
> below.

Same here, I think your approach is better than a stand-alone man page.

Nevertheless, are you going to please add a symlink from posix_fadvise.=
2.gz to=20
arm_fadvise.2.gz?

Thanks
Stephan

--=20
       Stephan M=FCller Stephan.Mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org +49 172 216 55 78
atsec information security GmbH, Steinstra=DFe 70, 81667 M=FCnchen, Ger=
many
         Gesch=E4ftsf=FChrer: Salvatore la Pietra, Staffan Persson
                   HRB: 129439 (Amtsgericht M=FCnchen)
 atsec it security news blog - atsec-information-security.blogspot.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
