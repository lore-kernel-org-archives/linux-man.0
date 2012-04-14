From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Changed type of ai_addrlen in struct addrinfo
Date: Sun, 15 Apr 2012 09:43:24 +1200
Message-ID: <CAKgNAkiqsqP2XwXRjvj3Mj-X0dgSkPYxHJS8CtzhTa8P6xT-Qw@mail.gmail.com>
References: <4F7B4373.1060504@gmx.ca>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F7B4373.1060504-Cyn6bMzNSQ8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jak <jak-Cyn6bMzNSQ8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Kak,

On Wed, Apr 4, 2012 at 6:37 AM, Jak <jak-Cyn6bMzNSQ8@public.gmane.org> wrote:
> Hi,
>
> <http://man7.org/linux/man-pages/man3/getaddrinfo.3.html> says that s=
truct
> addrinfo contains:
>
> =A0 =A0 =A0 =A0size_t =A0 =A0ai_addrlen;
>
> However, in the GNU C Library, the type was changed on 2000-04-01 fro=
m
> size_t to socklen_t, as ChangeLog.11 in the glibc source shows:
>
> =A0 =A0 =A0 =A0* resolv/netdb.h
> =A0 =A0 =A0 =A0[...]
> =A0 =A0 =A0 =A0(struct addrinfo): Use socklen_t for ai_addrlen elemen=
t.
>
> Please could the manpage be updated?

Thanks for the report. Fixed for man-pages-3.39.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
