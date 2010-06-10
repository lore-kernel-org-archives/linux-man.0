From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: select_tut(2): error in example code
Date: Thu, 10 Jun 2010 06:10:55 +0200
Message-ID: <AANLkTilMEFef1CF5uYpNBddPRDfwfiNyQK0UqaiD8Gq_@mail.gmail.com>
References: <201006081541.o58FfQTt015276@pogo.cesa.opbu.xerox.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201006081541.o58FfQTt015276-1qr3+Ib8l7hP+3OIzQSClA49vMN11MuG@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Klossner <andrew-pwabbKueSRu4mpay0g/RMEEOCMrvLtNR@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Andrew,

On Tue, Jun 8, 2010 at 5:41 PM, Andrew Klossner
<andrew-pwabbKueSRu4mpay0g/RMEEOCMrvLtNR@public.gmane.org> wrote:
> The select_tut(2) EXAMPLE has a one-character bug:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* NB: read oob data before normal reads =
*/
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fd1 > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (FD_ISSET(fd1, &er)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char c;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D recv(fd1, &c, 1, MS=
G_OOB);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r < 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SHUT_FD1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 send(fd2, &c, 1, =
MSG_OOB);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fd2 > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (FD_ISSET(fd2, &er)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char c;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D recv(fd2, &c, 1, MS=
G_OOB);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r < 1)
> +-> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SHUT_FD1;
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0send(fd1, &c, 1,=
 MSG_OOB);
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> |
> +-- should be SHUT_FD2;

Thanks. Fixed for man-pages-3.25.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
