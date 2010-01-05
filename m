From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: possibly a Bug in proc man page
Date: Wed, 6 Jan 2010 05:31:53 +1300
Message-ID: <cfd18e0f1001050831n37787505y2d05d37aca2cbaa4@mail.gmail.com>
References: <9b0a5b991001010142w12fe5259v5819b925d13f352c@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b0a5b991001010142w12fe5259v5819b925d13f352c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Siddu <siddu.sjce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Siddu,

On Fri, Jan 1, 2010 at 10:42 PM, Siddu <siddu.sjce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello folks
>
>
> The format in /proc/<pid>/maps seems to be updated in the man page
> for every mapped library it lists only two section while in reality t=
here
> are three sections like shown
> below

I don't understand what yo mean here. Can you please say more.

Cheers,

Michael


>
> 00110000-0024e000 r-xp 00000000 08:05 1619
> /lib/tls/i686/cmov/libc-2.10.1.so
> 0024e000-00250000 r--p 0013e000 08:05 1619
> /lib/tls/i686/cmov/libc-2.10.1.so
> 00250000-00251000 rw-p 00140000 08:05 1619
> /lib/tls/i686/cmov/libc-2.10.1.so
> 00251000-00254000 rw-p 00000000 00:00 0
> 002b6000-002d1000 r-xp 00000000 08:05 775=A0=A0=A0=A0=A0=A0=A0 /lib/l=
d-2.10.1.so
> 002d1000-002d2000 r--p 0001a000 08:05 775=A0=A0=A0=A0=A0=A0=A0 /lib/l=
d-2.10.1.so
> 002d2000-002d3000 rw-p 0001b000 08:05 775=A0=A0=A0=A0=A0=A0=A0 /lib/l=
d-2.10.1.so
> 0039d000-00451000 r-xp 00000000 08:05 829
> /lib/libglib-2.0.so.0.2200.2
> 00451000-00452000 r--p 000b4000 08:05 829
> /lib/libglib-2.0.so.0.2200.2
> 00452000-00453000 rw-p 000b5000 08:05 829
> /lib/libglib-2.0.so.0.2200.2
> 00732000-00734000 r-xp 00000000 08:05 1625
> /lib/tls/i686/cmov/libdl-2.10.1.so
> 00734000-00735000 r--p 00001000 08:05 1625
> /lib/tls/i686/cmov/libdl-2.10.1.so
> 00735000-00736000 rw-p 00002000 08:05 1625
> /lib/tls/i686/cmov/libdl-2.10.1.so
> 0091e000-0091f000 r-xp 00000000 00:00 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [v=
dso]
> 00afa000-00afd000 r-xp 00000000 08:05 4796
> /usr/lib/libgmodule-2.0.so.0.2200.2
> 00afd000-00afe000 r--p 00002000 08:05 4796
> /usr/lib/libgmodule-2.0.so.0.2200.2
> 00afe000-00aff000 rw-p 00003000 08:05 4796
> /usr/lib/libgmodule-2.0.so.0.2200.2
>
>
> --
> Regards,
> ~Sid~
> I have never met a man so ignorant that i couldn't learn something fr=
om him
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
