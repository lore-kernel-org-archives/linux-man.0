From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] pthread_kill.3: Inclusion of pthread.h instead of signal.h
Date: Tue, 04 Feb 2014 10:11:22 +0100
Message-ID: <52F0AEBA.6030306@gmail.com>
References: <CABAco3C=C0E7Wzav04wAy6b0r4egGF2QXfY-ZaaVWyoMkPCWtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABAco3C=C0E7Wzav04wAy6b0r4egGF2QXfY-ZaaVWyoMkPCWtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ola Olsson <ola1olsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2014 12:10 AM, Ola Olsson wrote:
> *Describe how you obtained the information in your patch: *Compiled m=
y multithreaded program with gcc 4.6.3 with information described in th=
e man page for pthread_kill. Got following error:
> warning: implicit declaration of function =E2=80=98pthread_kill=E2=80=
=99 [-Wimplicit-function-declaration]
>=20
> *Solution:* Including pthread.h instead solved the problem
>=20
> Patch applies on top of a896b3533684072d09932a20a8fd0d1057feb336

Thanks, Ola.

Patch applied.

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
