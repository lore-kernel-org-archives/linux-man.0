From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pid_namespaces.7: tfix
Date: Sat, 29 Nov 2014 10:42:51 +0100
Message-ID: <5479951B.2050708@gmail.com>
References: <1416177365-10451-1-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416177365-10451-1-git-send-email-richard-/L3Ra7n9ekc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Richard. Applied.

Cheers,

Michael


On 11/16/2014 11:36 PM, Richard Weinberger wrote:
> s/PR_GET_CHILD_SUBREAPER/PR_SET_CHILD_SUBREAPER
> 
> Signed-off-by: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
> ---
>  man7/pid_namespaces.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
> index 2090101..8582da3 100644
> --- a/man7/pid_namespaces.7
> +++ b/man7/pid_namespaces.7
> @@ -70,7 +70,7 @@ to this process rather than
>  (unless one of the ancestors of the child
>  in the same PID namespace employed the
>  .BR prctl (2)
> -.B PR_GET_CHILD_SUBREAPER
> +.B PR_SET_CHILD_SUBREAPER
>  command to mark itself as the reaper of orphaned descendant processes).
>  
>  If the "init" process of a PID namespace terminates,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
