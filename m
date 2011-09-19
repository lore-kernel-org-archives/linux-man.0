From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] madvise.2: add MADV_HUGEPAGE and MADV_NOHUGEPAGE
Date: Mon, 19 Sep 2011 07:26:49 +0200
Message-ID: <CAKgNAkh55ZFMEU5nH0vS=jgW91GjDWx1Tf=gyRDUqNm4yqS1oA@mail.gmail.com>
References: <CAFWqQMRFHJ2kWkJWB2dAg-Od9MzqL7LeC=CQvzy6t5aNqVY_zQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFWqQMRFHJ2kWkJWB2dAg-Od9MzqL7LeC=CQvzy6t5aNqVY_zQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrea Arcangeli <andrea-Vyt77T80VFVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Doug,

On Wed, Jul 27, 2011 at 10:14 PM, Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Document the MADV_HUGEPAGE and MADV_NOHUGEPAGE flags added to the
> madvise() syscall in Linux kernels 2.6.38 and newer.

Thanks. I've applied this for man-pages-3.34.

Andrea, is there anything you think necessary to add/change?

Cheers,

Michael


> Signed-off-by: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
> ---
> =A0man2/madvise.2 | =A0 34 ++++++++++++++++++++++++++++++++++
> =A01 files changed, 34 insertions(+), 0 deletions(-)
>
> diff --git a/man2/madvise.2 b/man2/madvise.2
> index 6a449c5..e099e94 100644
> --- a/man2/madvise.2
> +++ b/man2/madvise.2
> @@ -209,6 +209,40 @@ KSM unmerges whatever pages it had merged in the
> address range specified by
> =A0.IR addr
> =A0and
> =A0.IR length .
> +.TP
> +.BR MADV_HUGEPAGE " (since Linux 2.6.38)"
> +Enables Transparent Huge Pages (THP) for pages in the range specifie=
d by
> +.I addr
> +and
> +.IR length .
> +Currently Transparent Huge Pages only work with private anonymous pa=
ges (see
> +.BR mmap (2)).
> +The kernel will regularly scan the areas marked as huge page candida=
tes
> +to replace them with huge pages.
> +The kernel will also allocate huge pages directly when the region is
> +naturally aligned to the huge page size. (see
> +.BR posix_memalign (2)).
> +This feature is primarily aimmed at applications that use large mapp=
ings of
> +data and access large regions of that memory at a time (e.g. virtual=
ization
> +systems such as qemu).
> +It can very easily waste memory (e.g. a 2MB mapping that only ever a=
ccesses
> +1 byte will result in 2MB of wired memory instead of one 4KB page).
> +See the kernel source file
> +.I Documentation/vm/transhuge.txt
> +for more details.
> +The
> +.BR MADV_HUGEPAGE
> +and
> +.BR MADV_NOHUGEPAGE
> +operations are only available if the kernel was configured with
> +.BR CONFIG_TRANSPARENT_HUGEPAGE.
> +.TP
> +.BR MADV_NOHUGEPAGE " (since Linux 2.6.38)"
> +Ensures that memory in the address range specified by
> +.IR addr
> +and
> +.IR length
> +will not be collapsed into huge pages.
> =A0.SH "RETURN VALUE"
> =A0On success
> =A0.BR madvise ()
> --
> 1.7.6
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
