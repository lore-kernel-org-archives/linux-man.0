From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Wed, 21 Mar 2012 00:05:27 -0400
Message-ID: <201203210005.29137.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A@mail.gmail.com> <20120321135510.29380c06@Gantu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2596362.qtFhq8mSMj";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120321135510.29380c06@Gantu>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2596362.qtFhq8mSMj
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 20 March 2012 23:25:10 Christopher Yeoh wrote:
> Note that the following bit is not strictly true:
>   "So if the counts are too big, or the vectors invalid, or the
>   addresses refer to regions that are inaccessible, none of the
>   previous vectors will be processed and an error will be returned
>   immediately."
>=20
> Whilst the code does check that memory regions in the process calling
> the system calls are accessible before any work is done, it does not
> check the memory regions in the remote process until just before doing
> the read/write. So in that case you can end up with a partial
> read/write if one of the iovec elements for the remote process points
> to an invalid memory region. No further read/writes will be attempted
> after this point though.

yes, i missed the "check_access" logic in rw_copy_check_uvector()
=2Dmike

--nextPart2596362.qtFhq8mSMj
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPaVOJAAoJEEFjO5/oN/WBggsP/jYAfP2+xtgDyZxp7y1nq30s
EXjoZWljBW8pnDMGpMttI+6c4xY6zjlYicK8Cevizn0NYnPfkZmKEQjH2MmilOC1
qYFxgF5D6D2MkKPVzSCZgr8ML7BMJm12O+uO8rIQmt+CjdEnZ4BVJDQe54Kju5C/
Xsx8YaOARisRjxRihl4OGUe8e1Ua0S8/4g9GIw9G5yPog/7tE+GMXYWhIrTzYnru
TtNOoyCkkkqob/wkBjOLoX0gYXZIqps/52AUM6o6uPCNlVV+ZPhkKX7V8FO5WHR0
C/2ABdnbo7w+A3rU8Xz9I+YyDD1s3yHTnIyN8vn5PT1v1ASbChP1hBAvkJLUCBEg
Yfh3wHpt/yS7ph2FBMWc4NDEOnzBYe1SLdFu08pAU+Jgepmj3bkYojPNAQy2a1da
LGyi1oPR598P+KTjZBOqWlyrgZ8uHQhqs2mnQRxs9SOFxavOQf/7YlArBrmM4nng
f0yWM434h5Q432ktPUOzo8R+h7FERCltzlAAMfBXFnE3N3AvnpjJIn4APKdPqgpj
mLWDtno13O1v0lk2w7kRwe33zpjDojM/uEtaAZAXADWV58gnrqJAMsr158dYprJu
TUlY0zJmtFSAGVkfAb7ln2fmzXu9yx49WxMaBVpFdJQ7u99quuC4pvjYPK39e5YP
rrRmWpGtrgGrdk4o37Ab
=s6cV
-----END PGP SIGNATURE-----

--nextPart2596362.qtFhq8mSMj--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
