From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: read 2
Date: Mon, 31 Oct 2011 14:15:18 +0200
Message-ID: <CACKs7VBqWd2Brvfs1D5Kv095tQ97RFsM8cAYzbug2kQeQU7ZqQ@mail.gmail.com>
References: <CAGc9EveAKHV4--YZZWX6XMWuMDRh3C346eBBZwuKYQ1MBDBmcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EveAKHV4--YZZWX6XMWuMDRh3C346eBBZwuKYQ1MBDBmcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

read() is a system call. If you check 'man man', system calls are
documented in section 2, while library functions like fread are in
section 3.

Thanks,
Stefan.

On Sat, Oct 29, 2011 at 1:41 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> I saw fread is on section 3, but should read really be 3? It's not a
> kernel function directly I think. Perhaps the numbering is just
> historical?
>
> http://man7.org/linux/man-pages/online/pages/man2/read.2.html
>
> Best regards, Jon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
