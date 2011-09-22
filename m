From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] madvise.2: tfix
Date: Thu, 22 Sep 2011 04:59:14 +0200
Message-ID: <CAKgNAkhQFd-=Lw59sZRp4-pSeqKX8Q35J38AkZOQbxP8T71+GQ@mail.gmail.com>
References: <1316657626-30903-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316657626-30903-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David

On Thu, Sep 22, 2011 at 4:13 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks.

Applied for 3.34.

Cheers,

Michael

> ---
> =A0man2/madvise.2 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
> diff --git a/man2/madvise.2 b/man2/madvise.2
> index 59e6846..c87877c 100644
> --- a/man2/madvise.2
> +++ b/man2/madvise.2
> @@ -226,9 +226,9 @@ to replace them with huge pages.
> =A0The kernel will also allocate huge pages directly when the region =
is
> =A0naturally aligned to the huge page size (see
> =A0.BR posix_memalign (2)).
> -This feature is primarily aimmed at applications that use large mapp=
ings of
> +This feature is primarily aimed at applications that use large mappi=
ngs of
> =A0data and access large regions of that memory at a time (e.g. virtu=
alization
> -systems such as qemu).
> +systems such as QEMU).
> =A0It can very easily waste memory (e.g. a 2MB mapping that only ever=
 accesses
> =A01 byte will result in 2MB of wired memory instead of one 4KB page)=
=2E
> =A0See the kernel source file
> --
> 1.7.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
