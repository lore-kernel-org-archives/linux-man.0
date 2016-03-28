From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: open(2) manpage and O_NONBLOCK
Date: Mon, 28 Mar 2016 16:58:33 +1300
Message-ID: <CAKgNAkiLsw5c_Q+EknRijgeJGNvQ_R6HxdgA=YhBgcXsbv+mpQ@mail.gmail.com>
References: <20160321202347.GG1612@cork>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160321202347.GG1612@cork>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello J=C3=B6rn,

On 22 March 2016 at 09:23, J=C3=B6rn Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org> wrot=
e:
> In open(2), we seem to promise more than the kernel can deliver:
>        O_NONBLOCK or O_NDELAY
>                When possible, the file is opened in nonblocking mode.
>                Neither the open() nor any subsequent operations on th=
e
>                file descriptor which is returned  will  cause  the
>                calling process to wait.
>
> Clearly you can question whether every last device driver correctly
> supports O_NONBLOCK in its open routine.  But even if that was the ca=
se,
> we still cannot guarantee nonblocking behaviour for open().
> get_empty_filp() has to be called for every open() and contains a
> blocking memory allocation:
>         f =3D kmem_cache_zalloc(filp_cachep, GFP_KERNEL);

=46or how long might this block, though?

> As such I would propose to change the documentation and keep the code=
=2E
> The open() itself may very well block, but subsequent operations shou=
ld
> not.

I think the most obvious userland case that's being covered here is
O_NONBLOCK with FIFOs. The "Wen possible" text is, I imagine, there to
deal with cases such as drivers that do not support O_NONBLOCK.

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
