From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Add Prefer_MAP_32BIT_EXEC to map executable pages with
 MAP_32BIT
Date: Wed, 16 Dec 2015 09:04:05 -0500
Message-ID: <56716F55.3020009@redhat.com>
References: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA@mail.gmail.com>
 <56716EDC.7020205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56716EDC.7020205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jeff Law <law-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/16/2015 09:02 AM, Michael Kerrisk (man-pages) wrote:
> (Thanks, Carlos.)
>=20
>> Here is a patch for Linux man page.
>=20
> Thanks, H.J. I applied the patch and tweaked your text somewhat.
> Does the following look okay?
>=20
>        LD_PREFER_MAP_32BIT_EXEC
>               (x86-64 only)(glibc since 2.23)  According  to  the  In=
tel
>               Silvermont  software optimization guide, for 64-bit app=
li=E2=80=90
>               cations, branch prediction performance can  be  negativ=
ely
>               impacted when the target of a branch is more than 4GB a=
way
>               from the branch.  If this environment variable is set  =
(to
>               any  value),  ld.so will first try to map executable pa=
ges
>               using the mmap(2) MAP_32BIT flag, and fall back to mapp=
ing
>               without  that  flag  if that attempt fails.  NB: MAP_32=
BIT
>               will map to the low 2GB (not 2GB) of  the  address  spa=
ce.
>               Because  MAP_32BIT reduces the address range available =
for
>               address  space  layout   randomization   (ASLR),   LD_P=
RE=E2=80=90
>               FER_MAP_32BIT_EXEC  is always disabled in secure-execut=
ion
>               mode.

Looks great. Thanks for the quick turnaround Michael!

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
