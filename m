From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ptrace.2: add description for PTRACE_{GET,SET}SIGMASK
Date: Mon, 20 Jan 2014 11:03:40 +0100
Message-ID: <52DCF47C.6040200@gmail.com>
References: <1373962773-2041-1-git-send-email-avagin@openvz.org> <1373962773-2041-4-git-send-email-avagin@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373962773-2041-4-git-send-email-avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/16/2013 10:19 AM, Andrey Vagin wrote:
> These two commands allow to examine and change mask of blocked signals.

Thanks, Andrey.

Applied.

Cheers,

Michael


> Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/ptrace.2 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index e74535e..08697ff 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -356,6 +356,21 @@ If this flag is not set, signals are read from a per-thread queue.
>  .in
>  .PP
>  .TP
> +.BR PTRACE_GETSIGMASK " (since Linux 3.11)"
> +.\" commit 29000caecbe87b6b66f144f72111f0d02fbbf0c1
> +Retrieve mask of blocked signals to the address
> +.I data.
> +The
> +.I addr
> +argument contains the size of mask.
> +.TP
> +.BR PTRACE_SETSIGMASK " (since Linux 3.11)"
> +Change mask of blocked signals from the address
> +.I data.
> +The
> +.I addr
> +argument contains the size of mask.
> +.TP
>  .BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see BUGS for caveats)"
>  Set ptrace options from
>  .IR data .
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
