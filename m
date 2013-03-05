From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perfmonctl.2: wfix and ffix
Date: Tue, 5 Mar 2013 17:39:32 +0100
Message-ID: <CAKgNAkgDN-LHj9aJpBkYEkiDfN+HopHdZapCBLrdBsC5HPp8qw@mail.gmail.com>
References: <1362278844-8257-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362278844-8257-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sun, Mar 3, 2013 at 3:47 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/perfmonctl.2 |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/man2/perfmonctl.2 b/man2/perfmonctl.2
> index c35c007..487c1bc 100644
> --- a/man2/perfmonctl.2
> +++ b/man2/perfmonctl.2
> @@ -119,7 +119,7 @@ Start monitoring.
>  .B PFM_STOP
>  .\" pfm_stop()
>  .nf
> -.BI  "perfmonctl(int " fd ", PFM_START, NULL, 0);
> +.BI  "perfmonctl(int " fd ", PFM_STOP, NULL, 0);
>  .fi
>  Stop monitoring.
>  .TP
> @@ -153,7 +153,7 @@ Restart monitoring after receiving an overflow no=
tification.
>  .B PFM_DEBUG
>  .\" pfm_debug()
>  .nf
> -.BI  "perfmonctl(int " fd ", PFM_DEBUG, val, 0);
> +.BI  "perfmonctl(int " fd ", PFM_DEBUG, " val ", 0);
>  .fi
>  If
>  .I val
> @@ -202,5 +202,6 @@ is Linux specific and is available only on the IA=
-64 architecture.
>  Glibc does not provide a wrapper for this system call; call it using
>  .BR syscall (2).
>  .SH SEE ALSO
> -.BR gprof(1),
> -.I The perfmon2 interface specification
> +.BR gprof (1)
> +
> +The perfmon2 interface specification
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
