From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: copy retval info for SECCOMP_GET_FILTER to
 right section
Date: Fri, 9 Feb 2018 06:59:31 +0100
Message-ID: <1df4137b-0ad8-d80b-45d0-c193ad1c164f@gmail.com>
References: <20180208224600.257982-1-jannh@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180208224600.257982-1-jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jann,

On 02/08/2018 11:46 PM, Jann Horn wrote:
> The "RETURN VALUE" section made a claim that was incorrect for
> PTRACE_SECCOMP_GET_FILTER. Explicitly describe the behavior of
> PTRACE_SECCOMP_GET_FILTER in the "RETURN VALUE" section (as usual), but
> leave the now duplicate description in the section describing
> PTRACE_SECCOMP_GET_FILTER, since the PTRACE_SECCOMP_GET_FILTER section
> would otherwise probably become harder to understand.

Thanks! Patch applied.

Cheers,

Michael

> Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/ptrace.2 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index e1c3eec46..d78b8db2d 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -2206,7 +2206,10 @@ the report is sent only once.
>  On success, the
>  .B PTRACE_PEEK*
>  requests return the requested data (but see NOTES),
> -while other requests return zero.
> +the
> +.B PTRACE_SECCOMP_GET_FILTER
> +request returns the number of instructions in the BPF program, and
> +other requests return zero.
>  .PP
>  On error, all requests return \-1, and
>  .I errno
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
