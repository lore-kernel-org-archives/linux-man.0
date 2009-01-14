From: Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Tue, 13 Jan 2009 16:24:39 -0800
Message-ID: <496D30C7.4080001@redhat.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>	 <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>	 <20090113224941.36F19FC3DD@magilla.sf.frob.com>	 <cfd18e0f0901131514i2f7be7f1t2c6275c26dbb6874@mail.gmail.com>	 <20090113152457.0d7685ad.akpm@linux-foundation.org>	 <20090113234716.765A8FC3DD@magilla.sf.frob.com> <cfd18e0f0901131613l65bff51fo22e86a01ba2c0720@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901131613l65bff51fo22e86a01ba2c0720-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Kerrisk wrote:
> I don't feel strongly about this, but lean towards the idea that we
> should fix things, as per Roland's patch, and I suspect we can get
> away with it, for the reasons I mentioned already.

Yes, change it, it will only cause harm leaving it.  I very much doubt
any programmer deliberately uses this case and if it's not deliberate
they likely want to know about it.

- --
=E2=9E=A7 Ulrich Drepper =E2=9E=A7 Red Hat, Inc. =E2=9E=A7 444 Castro S=
t =E2=9E=A7 Mountain View, CA =E2=9D=96
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkltMMcACgkQ2ijCOnn/RHQ8fQCgnghAaJQ4fkEMZCnQwsaza80X
WrIAn2z7tEsiMy8pYJs3gkdzO6CNiKTz
=3DWaAV
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
