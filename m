From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Typos in man2/swapon.2 man2/truncate.2
Date: Fri, 3 Dec 2010 06:56:53 +0100
Message-ID: <AANLkTimQiEVr9H7OaRGcuK5WJ8VW=jk5oQk6CtZFG-s+@mail.gmail.com>
References: <AANLkTind_ARPRgAjh0JZUNy48w2BCCL0VosqP-p=DZDz@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTind_ARPRgAjh0JZUNy48w2BCCL0VosqP-p=DZDz-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Sun, Nov 28, 2010 at 10:30 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hello,
>
> Here is a patch.

Thanks. Applied for 3.22.

Cheers,

Michael


> diff --git a/man2/swapon.2 b/man2/swapon.2
> index a849b6c..a4b34f5 100644
> --- a/man2/swapon.2
> +++ b/man2/swapon.2
> @@ -74,7 +74,7 @@ If the
> =A0flag is specified in the
> =A0.BR swapon ()
> =A0.I swapflags
> -argumument, freed swap pages will be discarded before they are reuse=
d,
> +argument, freed swap pages will be discarded before they are reused,
> =A0if the swap device supports the discard or trim operation.
> =A0(This may improve performance on some Solid State Devices,
> =A0but often it does not.)
> diff --git a/man2/truncate.2 b/man2/truncate.2
> index 1324017..fb388b2 100644
> --- a/man2/truncate.2
> +++ b/man2/truncate.2
> @@ -239,7 +239,7 @@ and
> =A0.BR ftruncate64 ()
> =A0system calls that handle large files.
> =A0However, these details can be ignored by applications using glibc,=
 whose
> -wrapper functions transparently employ the more recent system calla
> +wrapper functions transparently employ the more recent system calls
> =A0where they are available.
> =A0.SH BUGS
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
