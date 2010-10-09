From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: sync_file_range2() man page
Date: Sat, 9 Oct 2010 14:40:55 +0200
Message-ID: <201010091440.58657.stephan.mueller@atsec.com>
References: <AANLkTi=WLtBgVaasueS_E59NpCJ++GP5sF4fFUdP+4T_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=WLtBgVaasueS_E59NpCJ++GP5sF4fFUdP+4T_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Samstag, 9. Oktober 2010, um 05:39:08 schrieb Michael Kerrisk:

Hi Michael,

> [was: man pages for undocumented system calls]
>=20
> Stephan,
>=20
> Thanks for this page. It is worth documenting the existence of this
> system call, but we need to do it differently:
>=20
> 1. It's best documented as an addition to the sync_file_rabge.2 page.
>=20
> 2. There needs to be an explanation of why the system call exists.
>=20
> I wrote the patch below for man-pages-3.29.

Thanks a lot. Your suggestion seems to be more appropriate than a separ=
ate man=20
page.

But could you please add a symlink from sync_file_range2.2.gz=20
sync_file_range.2.gz.

Ciao
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
