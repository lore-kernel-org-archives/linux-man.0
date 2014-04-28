From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: shmget.2: SHMALL & kernel version inconsistency ?
Date: Mon, 28 Apr 2014 09:39:50 +0200
Message-ID: <535E05C6.10409@gmail.com>
References: <20140427220916.GP18563@mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140427220916.GP18563-xazfMhTT2R0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/28/2014 12:09 AM, Simon Paillard wrote:
> Hi,
>=20
>>From shmget.2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> SHMALL System wide maximum of shared memory pages.   Since  Linux  2.=
2,
>        the default value for this limit is
>=20
>            SHMMAX / PAGE_SIZE * (SHMMNI / 16)
>=20
>        Assuming  a 4kB page size, this formula yields (since Linux 2.=
4)
>        the value 2^20 (2,097,152).
>=20
>        On Linux, this limit can be read and modified via /proc/sys/ke=
r=E2=80=90
>        nel/shmall.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Linux 2.2 or 2.4 ?
>=20
> I understand from lxr contant this is actually 2.4.
> http://lxr.linux.no/#linux-old+v2.2.0/include/linux/shm.h#L53
> http://lxr.linux.no/#linux-old+v2.4.0/include/linux/shm.h#L15

Thanks, Simon. Yes, it should have been 2.4. The fix is in Git.

Cheers,

Michael

=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
