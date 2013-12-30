From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PIPE(2) Example Does Not Compile
Date: Mon, 30 Dec 2013 19:57:51 +1300
Message-ID: <52C1196F.5060109@gmail.com>
References: <CADeGDptxvibs5GBdHszA9cQxxoyAkJw7uN9qSjNGT0PKe_+xgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADeGDptxvibs5GBdHszA9cQxxoyAkJw7uN9qSjNGT0PKe_+xgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: trevor-wfkQdcsGPFLk1uMJSBkQmQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/08/13 17:32, Trevor Bramwell wrote:
> Dear man-page maintainers,
>=20
> I believe I found a bug in the PIPE(2) example code.
>=20
> When trying to compile the example code, the following error was thro=
wn:
>=20
>     pipes.c: In function =91main=92:
>     pipes.c:10:5: error: unknown type name =91pid_t=92
>          pid_t cpid;
>          ^
> After adding the line:
>=20
>     #include <sys/types.h>
>=20
> The example compiled fine.
>=20
> I compiled with:
>=20
>     gcc -Wall -std=3Dc99
>=20
> Attached is a patch that append the line to include sys/types.h.
> ---
> manpage-version: 3.54-1
> gcc-version: gcc (Debian 4.8.2-1) 4.8.2
>=20
> Let me know if you need any more info, or if this is not truly a bug.

Trevor,

Did I reply to this mail message already? I did apply your patch.

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
