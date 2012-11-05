From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] proc.5: ffix
Date: Mon, 5 Nov 2012 17:03:22 +0100
Message-ID: <CAKgNAkjp0emGNxaLOSD6+A_jyaOcUa5WSTAaRe3KWudVvG4msw@mail.gmail.com>
References: <1352084275-1568-1-git-send-email-taffit@debian.org> <1352088481-22926-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352088481-22926-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Mon, Nov 5, 2012 at 5:08 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man5/proc.5 |   15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 0164ba6..ca94657 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1417,7 +1417,8 @@ Total usable RAM (i.e. physical RAM minus a few=
 reserved
>  bits and the kernel binary code).
>  .TP
>  .IR MemFree " %lu"
> -The sum of LowFree+HighFree.
> +The sum of
> +.IR LowFree + HighFree.
>  .TP
>  .IR Buffers " %lu"
>  Relatively temporary storage for raw disk blocks that
> @@ -1486,7 +1487,9 @@ Lowmem is memory which can be used for everythi=
ng that
>  highmem can be used for, but it is also available for the
>  kernel's use for its own data structures.
>  Among many other things,
> -it is where everything from Slab is allocated.
> +it is where everything from
> +.I Slab
> +is allocated.
>  Bad things happen when you're out of lowmem.
>  .TP
>  .IR LowFree " %lu
> @@ -1524,10 +1527,14 @@ Files which have been mmaped, such as librari=
es.
>  In-kernel data structures cache.
>  .TP
>  .IR SReclaimable " %lu (since Linux 2.6.19)"
> -Part of Slab, that might be reclaimed, such as caches.
> +Part of
> +.IR Slab ,
> +that might be reclaimed, such as caches.
>  .TP
>  .IR SUnreclaim " %lu (since Linux 2.6.19)"
> -Part of Slab, that cannot be reclaimed on memory pressure.
> +Part of
> +.IR Slab ,
> +that cannot be reclaimed on memory pressure.
>  .TP
>  .IR KernelStack " %lu (since Linux 2.6.32)"
>  Amount of memory allocated to kernel stacks.
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
