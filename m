From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Add note regarding the size of the output user
 space buffer for PR_GET_TID_ADDRESS operation on x32/n32
Date: Mon, 12 Dec 2016 07:22:52 +0100
Message-ID: <92c16e2d-d6d3-85c4-2f55-521e54e1ed4b@gmail.com>
References: <20161212035441.GA29133@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212035441.GA29133@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/12/2016 04:54 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/prctl.2 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks, Eugene. Applied. (And fantastic to get patches with this
level of detail!)

Cheers,

Michael

> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 5f84bb7..39b3e9a 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -988,7 +988,10 @@ flag, in the location pointed to by
>  .IR "(int\ **)\ arg2" .
>  This feature is available only if the kernel is built with the
>  .BR CONFIG_CHECKPOINT_RESTORE
> -option enabled.
> +option enabled. Note that since the prctl() syscall does not have compat
> +implementation for AMD64 x32 and MIPS n32 ABIs, and the kernel writes out
> +pointer of kernel's pointer size, this operation expects a user space buffer
> +of 8 (not 4) bytes on these ABIs.
>  .TP
>  .BR PR_SET_TIMERSLACK " (since Linux 2.6.28)"
>  .\" See https://lwn.net/Articles/369549/
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
