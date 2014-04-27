From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: shmget.2: SHMALL & kernel version inconsistency ?
Date: Mon, 28 Apr 2014 00:09:16 +0200
Message-ID: <20140427220916.GP18563@mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

=46rom shmget.2:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
SHMALL System wide maximum of shared memory pages.   Since  Linux  2.2,
       the default value for this limit is

           SHMMAX / PAGE_SIZE * (SHMMNI / 16)

       Assuming  a 4kB page size, this formula yields (since Linux 2.4)
       the value 2^20 (2,097,152).

       On Linux, this limit can be read and modified via /proc/sys/ker=E2=
=80=90
       nel/shmall.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Linux 2.2 or 2.4 ?

I understand from lxr contant this is actually 2.4.
http://lxr.linux.no/#linux-old+v2.2.0/include/linux/shm.h#L53
http://lxr.linux.no/#linux-old+v2.4.0/include/linux/shm.h#L15

--=20
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
