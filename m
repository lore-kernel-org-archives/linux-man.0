From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PIPE(2) Example Does Not Compile
Date: Sun, 08 Dec 2013 21:51:38 -0800
Message-ID: <52A55A6A.1040204@gmail.com>
References: <CADeGDps-YEGmW2KcCh1ejaKHC+LuGKzrBVnM7Ty3XCqS5uNm0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADeGDps-YEGmW2KcCh1ejaKHC+LuGKzrBVnM7Ty3XCqS5uNm0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: trevor-wfkQdcsGPFLk1uMJSBkQmQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/13 20:24, Trevor Bramwell wrote:
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

Thanks.

Patch applied.

Cheers,

Michael


> ---
> manpage-version: 3.54-1
> gcc-version: gcc (Debian 4.8.2-1) 4.8.2
>=20
> Let me know if you need any more info, or if this is not truly a bug.
>=20
> Thank you,
> -- Trevor Bramwell


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
