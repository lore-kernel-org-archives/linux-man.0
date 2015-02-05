From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2: fix a bug of CLONE_PARENT_SETTID
Date: Thu, 05 Feb 2015 13:48:48 +0100
Message-ID: <54D366B0.7040007@gmail.com>
References: <1383903679-11598-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383903679-11598-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/08/2013 10:41 AM, Peng Haitao wrote:
> CLONE_PARENT_SETTID only stores child thread ID in parent memory.

Applied. Thanks, Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man2/clone.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/clone.2 b/man2/clone.2
> index 4815fb1..6325397 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -532,7 +532,7 @@ calling process itself, will be signaled.
>  .BR CLONE_PARENT_SETTID " (since Linux 2.5.49)"
>  Store child thread ID at location
>  .I ptid
> -in parent and child memory.
> +in parent memory.
>  (In Linux 2.5.32-2.5.48 there was a flag
>  .B CLONE_SETTID
>  that did this.)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
