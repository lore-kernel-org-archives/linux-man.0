From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] open.2: fix grammar in O_DIRECT description
Date: Sat, 18 Feb 2012 14:36:04 +1300
Message-ID: <CAKgNAkg8co4hpw_Nw9wpDnXn+p70NZLzC73WhS407mKQTcNdnQ@mail.gmail.com>
References: <CAKDZRciFBUuznH5hhySfNwVxBD_oJCmtBPxBEht2pHbUKmTFqg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKDZRciFBUuznH5hhySfNwVxBD_oJCmtBPxBEht2pHbUKmTFqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jessica McKellar <jesstess-3s7WtUTddSA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jessica,

On Mon, Feb 13, 2012 at 9:27 AM, Jessica McKellar <jesstess-3s7WtUTddSA@public.gmane.org> wr=
ote:
> Hi,
>
> The following patch (also attached) makes some small grammar fixes to
> the O_DIRECT description in man2/open.2. The patch is against master
> in git:


Thanks. Applied for man-pages-3.36.

Cheers,

Michael


> =3D=3D=3D
>
> diff --git a/man2/open.2 b/man2/open.2
> index 69324dd..a97158a 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -281,11 +281,11 @@ special situations, such as when applications d=
o
> their own caching.
> =A0File I/O is done directly to/from user space buffers.
> =A0The
> =A0.B O_DIRECT
> -flag on its own makes at an effort to transfer data synchronously,
> +flag on its own makes an effort to transfer data synchronously,
> =A0but does not give the guarantees of the
> =A0.B O_SYNC
> -that data and necessary metadata are transferred.
> -To guarantee synchronous I/O the
> +flag that data and necessary metadata are transferred.
> +To guarantee synchronous I/O,
> =A0.B O_SYNC
> =A0must be used in addition to
> =A0.BR O_DIRECT .
>
> =3D=3D=3D
>
> Regards,
> -Jessica
>
> --
> Jessica McKellar
> http://jesstess.com



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
