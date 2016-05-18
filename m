From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Formatting fix of .IR
Date: Wed, 18 May 2016 22:36:29 +0200
Message-ID: <b3403885-935b-d7ef-5be7-7c003defe0f5@gmail.com>
References: <1462961382-8374-1-git-send-email-lip@dtdream.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462961382-8374-1-git-send-email-lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/11/2016 12:09 PM, Li Peng wrote:
> Signed-off-by: Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>

Thanks, Li Peng. Patch applied.

Cheers,

Michael


> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index dadac32..8480a85 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2825,7 +2825,7 @@ allocated for the entire 1GB.
>  This 1GB is memory which has been "committed" to by the VM
>  and can be used at any time by the allocating application.
>  With strict overcommit enabled on the system (mode 2 in
> -IR /proc/sys/vm/overcommit_memory ),
> +.IR /proc/sys/vm/overcommit_memory ),
>  allocations which would exceed the
>  .I CommitLimit
>  will not be permitted.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
