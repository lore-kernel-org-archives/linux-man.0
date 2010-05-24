From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: stat(2) does not indicate behavior with NULL filename arg, man
	pages 3.24
Date: Mon, 24 May 2010 07:23:00 +0200
Message-ID: <AANLkTinqBaEquWOSvaFBEosJ2Fritb2D3h6YVbosFfVk@mail.gmail.com>
References: <4BCF4B3A.8020909@dreamworks.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4BCF4B3A.8020909-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Mahovsky <Jeff.Mahovsky-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Jeff

On Wed, Apr 21, 2010 at 9:00 PM, Jeff Mahovsky
<Jeff.Mahovsky-hCDZnVt6e3JSwrhanM7KvQ@public.gmane.org> wrote:
> The stat(2) manpage does not indicate the behavior of the stat() func=
tion
> when the filename is a NULL pointer. =A0Does stat() return an error o=
r is the
> behavior undefined?
>
> Jeff Mahovsky
> Dreamworks Animation

Just to add to what Petr said. A NULL pointer is a general kind of
error that can affect many interfaces. I don't really see a need to
document this case for a specific interface.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
