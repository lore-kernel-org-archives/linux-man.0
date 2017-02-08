From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tkill.2: document EAGAIN error for real-time signals
Date: Wed, 8 Feb 2017 09:31:18 +0100
Message-ID: <f237f169-3792-c267-bdb0-ea17a59d67a8@gmail.com>
References: <20170206155748.66643-1-jannh@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206155748.66643-1-jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/06/2017 04:57 PM, Jann Horn wrote:
> See __send_signal() in kernel/signal.c:

Thanks, Jann. Patch applied.

Cheers,

Michael

> if (sig >= SIGRTMIN && info->si_code != SI_USER) {
>   /*
>    * Queue overflow, abort.  We may abort if the
>    * signal was rt and sent by user using something
>    * other than kill().
>    */
>   result = TRACE_SIGNAL_OVERFLOW_FAIL;
>   ret = -EAGAIN;
>   goto ret;
> }
> 
> (kill() uses SI_USER, but tkill() and tgkill() use SI_TKILL.)
> 
> Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/tkill.2 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man2/tkill.2 b/man2/tkill.2
> index a61ef3182..dce5dd94c 100644
> --- a/man2/tkill.2
> +++ b/man2/tkill.2
> @@ -103,6 +103,18 @@ For the required permissions, see
>  .TP
>  .B ESRCH
>  No process with the specified thread ID (and thread group ID) exists.
> +.TP
> +.B EAGAIN
> +The
> +.B RLIMIT_SIGPENDING
> +resource limit was reached and
> +.I sig
> +is a real-time signal.
> +.TP
> +.B EAGAIN
> +Insufficient kernel memory was available and
> +.I sig
> +is a real-time signal.
>  .SH VERSIONS
>  .BR tkill ()
>  is supported since Linux 2.4.19 / 2.5.4.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
