From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fseeko / ftello missing info
Date: Tue, 30 Sep 2014 08:57:00 +0200
Message-ID: <542A543C.4090600@gmail.com>
References: <fa475f3c-1f2a-47d2-9d68-e223614bd27b@is36.idb.cs.tu-bs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fa475f3c-1f2a-47d2-9d68-e223614bd27b-Yeh6xsaYXK/t3yNdKPxyEA4jNU5vUVPG@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Mack <mack-WMLsJPcVvUbeKaaq6wa0og@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/26/2014 04:36 PM, Thomas Mack wrote:
> Hi!
>=20
> On the ftello / fseeko man pages, it is written that #define
> _FILE_OFFSET_BITS 64 will turn off_t into a 64 bit type.
>=20
> As we had some harder time finding a solution for a problem related
> to this, it should be mentioned on the man page that this definition
> has to appear before including (any?) standard libraries.
>=20
> My system: Ubuntu 14.04.1; the man page states a date of 2001-11-05

Hello Thomas,

I made the text

       On some architectures, both off_t and long are 32-bit types,  bu=
t
       defining  _FILE_OFFSET_BITS  with  the value 64 (before includin=
g
       any header files) will turn off_t into a 64-bit type.

Thanks for your note.
=20
> Thank you for all your good work!

Bittesch=C3=B6n!

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
