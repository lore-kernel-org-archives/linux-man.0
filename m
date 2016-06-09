From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kcmp.2: note about SECURITY_YAMA
Date: Thu, 9 Jun 2016 10:20:32 +0200
Message-ID: <14e4100c-9bc0-2a6f-842a-84a93b1ba871@gmail.com>
References: <1385674933-9388-1-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385674933-9388-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/28/2013 10:42 PM, Shawn Landden wrote:

Thanks, Shawn.

Applied.

Cheers,

Michael


> ---
>  man2/kcmp.2 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/kcmp.2 b/man2/kcmp.2
> index 5cde64e..fcfe711 100644
> --- a/man2/kcmp.2
> +++ b/man2/kcmp.2
> @@ -187,7 +187,12 @@ is invalid.
>  Insufficient permission to inspect process resources.
>  The
>  .B CAP_SYS_PTRACE
> -capability is required to inspect processes that you do not own.
> +capability is required to inspect processes that you do not own. Other
> +limitations on ptrace apply, such as
> +.BR CONFIG_SECURITY_YAMA ,
> +which when /proc/sys/kernel/yama/ptrace_scope is 2 (the default) limits
> +.BR kcmp()
> +to child processes.
>  .TP
>  .B ESRCH
>  Process
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
