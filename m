From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: IPv6 address format buglet
Date: Fri, 9 Sep 2011 17:35:32 +0200
Message-ID: <CAKgNAkjt8ejfhfv7RfU2yVULDGK=9GCb5hsZqf__BfkvBy0-hA@mail.gmail.com>
References: <CAD5NRCE8Or2XmAwvxajShZMy2_-DL2TsXjmM7imqY0i0F1RvHg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD5NRCE8Or2XmAwvxajShZMy2_-DL2TsXjmM7imqY0i0F1RvHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Cross <hodgestar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simon,

On Fri, Jul 22, 2011 at 11:20 AM, Simon Cross <hodgestar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> A sentence in the "Address Format" section of
> http://www.kernel.org/doc/man-pages/online/pages/man7/ipv6.7.html
> reads:
>
> """
> The address notation for IPv6 is a group of 16 2-digit hexadecimal nu=
mbers,
> separated with a ':'. =A0"::" stands for a string of 0 bits.
> """
>
> I believe this should read "8 4-digit hexadecimal numbers" instead.

Thanks. Fixed for man-pages-3.33.

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
