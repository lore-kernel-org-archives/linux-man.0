From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Some additional details regarding
 PR_GET_UNALIGNED operation
Date: Mon, 12 Dec 2016 10:49:32 +0100
Message-ID: <CAKgNAkhn+dG9o=mHjoC7cF_Ev0i4rcTK79UAz7s4mCw9VYZaBA@mail.gmail.com>
References: <20161212035418.GA28773@obsidian>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212035418.GA28773@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12 December 2016 at 04:54, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

Looks like I replied twice to one of your mails, instead of replying
once to each mail. The patch below has been applied.

Cheers,

Michael

> ---
>  man2/prctl.2 | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 44ec657..5f84bb7 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -1103,20 +1103,27 @@ in the location pointed to by
>  .TP
>  .B PR_SET_UNALIGN
>  (Only on: ia64, since Linux 2.3.48; parisc, since Linux 2.6.15;
> -PowerPC, since Linux 2.6.18; Alpha, since Linux 2.6.22)
> +PowerPC, since Linux 2.6.18; Alpha, since Linux 2.6.22;
> +.\" sh: 94ea5e449ae834af058ef005d16a8ad44fcf13d6
> +.\" tile: 2f9ac29eec71a696cb0dcc5fb82c0f8d4dac28c9
> +sh, since Linux 2.6.34; tile, since Linux 3.12)
>  Set unaligned access control bits to \fIarg2\fP.
>  Pass
>  \fBPR_UNALIGN_NOPRINT\fP to silently fix up unaligned user accesses,
>  or \fBPR_UNALIGN_SIGBUS\fP to generate
>  .B SIGBUS
> -on unaligned user access.
> +on unaligned user access. Alpha also supports an additional flag with the value
> +of 4 and no corresponding named constant, which instructs kernel to not fix up
> +unaligned accesses (it is analogous to providing the
> +.BR UAC_NOFIX " flag in " SSI_NVPAIRS " operation of " setsysinfo
> +syscall on Tru64).
>  .TP
>  .B PR_GET_UNALIGN
>  (see
>  .B PR_SET_UNALIGN
>  for information on versions and architectures)
>  Return unaligned access control bits, in the location pointed to by
> -.IR "(int\ *) arg2" .
> +.IR "(unsigned int\ *) arg2" .
>  .SH RETURN VALUE
>  On success,
>  .BR PR_GET_DUMPABLE ,
> --
> 2.10.2
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
