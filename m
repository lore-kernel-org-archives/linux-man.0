From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] unshare.2: Document CLONE_NEWNET
Date: Sun, 24 Oct 2010 16:35:24 +0200
Message-ID: <AANLkTimJrGJywCSNQKuP0p_hx9icbnXGcqRr600e5SY-@mail.gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1287105955-32499-1-git-send-email-lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Lucian,

On Fri, Oct 15, 2010 at 3:25 AM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/unshare.2 | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/man2/unshare.2 b/man2/unshare.2
> index 051ebf5..2e43806 100644
> --- a/man2/unshare.2
> +++ b/man2/unshare.2
> @@ -93,6 +93,10 @@ its namespace which is not shared with any other p=
rocess.
> =A0Specifying this flag automatically implies
> =A0.B CLONE_FS
> =A0as well.
> +.TP
> +.B CLONE_NEWNET " (since Linux 2.6.24)"
> +Unshare the old network namespace. Specifying this flag
> +will move the process into a new network namespace.
> =A0.\" As at 2.6.16, the following forced implications also apply,
> =A0.\" although the relevant flags are not yet implemented.
> =A0.\" If CLONE_THREAD is set force CLONE_VM.
> --
> 1.7.1

Thanks for this proposal. I went with something a bit more consistent
with flags already documented, and also included the kernel version
number and capability requirements. Does it look okay to you?

Cheers,

Michael

--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -89,6 +89,19 @@ requires the
 .BR CAP_SYS_ADMIN
 capability.
 .TP
+.BR CLONE_NEWNET " (since Linux 2.6.24)
+This flag has the same effect as the
+.BR clone (2)
+.B CLONE_NEWNET
+flag.
+Unshare the network namespace,
+so that the calling process has a private copy of the
+network namespace which is not shared with any other process.
+.BR CLONE_NEWNET
+requires the
+.BR CAP_SYS_ADMIN
+capability.
+.TP
 .B CLONE_NEWNS
 .\" These flag name are inconsistent:
 .\" CLONE_NEWNS does the same thing in clone(), but CLONE_VM,



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
