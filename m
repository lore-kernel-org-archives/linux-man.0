From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: typo in dlopen.3
Date: Fri, 1 Jan 2010 07:17:41 +1300
Message-ID: <cfd18e0f0912311017l598c7ee4r365122b5dc25fec8@mail.gmail.com>
References: <20091221120425.GA20100@fungi.pizza.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091221120425.GA20100-haY3Rch+sCzom667hXHKlWZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Stoeckmann <tobias-Ddw9a119yAU@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied for 3.24.

On Tue, Dec 22, 2009 at 1:04 AM, Tobias Stoeckmann <tobias-Ddw9a119yAU@public.gmane.org> wr=
ote:
> Hi,
>
> in man-pages 3.23 is a typo in dlopen(3).
>
>
> With kind regards,
>
> Tobias Stoeckmann
>
> --- man-pages-3.23/man3/dlopen.3~ =A0 =A0 =A0 2009-12-21 13:00:58.000=
000000 +0100
> +++ man-pages-3.23/man3/dlopen.3 =A0 =A0 =A0 =A02009-12-21 13:02:13.0=
00000000 +0100
> @@ -141,7 +141,7 @@
> =A0returns.
> =A0If this cannot be done, an error is returned.
> =A0.PP
> -Zero of more of the following values may also be ORed in
> +Zero or more of the following values may also be ORed in
> =A0.IR flag :
> =A0.TP
> =A0.B RTLD_GLOBAL
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
