From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clone.2: remove forward reference to 2.6.28
Date: Sun, 24 Oct 2010 16:42:51 +0200
Message-ID: <AANLkTik4kzXOTyeiYauMSri0xJVPamK4_RwxuJs9+Ufc@mail.gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com> <1287105955-32499-2-git-send-email-lucian.grijincu@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1287105955-32499-2-git-send-email-lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Lucian,

On Fri, Oct 15, 2010 at 3:25 AM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/clone.2 | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/man2/clone.2 b/man2/clone.2
> index a126a05..17572d2 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -288,8 +288,6 @@ This flag can't be specified in conjunction with
> =A0.BR CLONE_SYSVSEM .
> =A0.TP
> =A0.BR CLONE_NEWNET " (since Linux 2.6.24)"
> -(The implementation of this flag is not yet complete,
> -but probably will be mostly complete by about Linux 2.6.28.)

I am reluctant to apply this patch, since it would be more useful to
document exactly when the implementation was completed. Would you be
able to determine this information and resubmit the patch?

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
