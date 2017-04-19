From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] prctl(2): PR_SET_MM: refine CONFIG_CHECKPOINT_RESTORE
 requirement
Date: Wed, 19 Apr 2017 15:34:15 +0200
Message-ID: <8aa78ed4-09d1-d64b-b038-f23fc648abe4@gmail.com>
References: <20170215201443.448-1-vapier@gentoo.org>
 <20170215201443.448-3-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215201443.448-3-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/15/2017 09:14 PM, Mike Frysinger wrote:
> The Linux 3.10 release dropped the c/r requirement and opened it up
> to all users.

Thanks, Mike. Applied.

Cheers,

Michael


> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/prctl.2 | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index dba32ebee1b5..42827aa2def4 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -504,9 +504,7 @@ Usually these fields are set by the kernel and dynamic loader (see
>  for more information) and a regular application should not use this feature.
>  However, there are cases, such as self-modifying programs,
>  where a program might find it useful to change its own memory map.
> -This feature is available only if the kernel is built with the
> -.BR CONFIG_CHECKPOINT_RESTORE
> -option enabled.
> +
>  The calling process must have the
>  .BR CAP_SYS_RESOURCE
>  capability.
> @@ -520,6 +518,14 @@ The
>  and
>  .I arg5
>  arguments must be zero if unused.
> +
> +.\" commit 52b3694157e3aa6df871e283115652ec6f2d31e0
> +Since Linux 3.10,
> +this feature is available all the time.
> +Before Linux 3.10,
> +this feature is available only if the kernel is built with the
> +.BR CONFIG_CHECKPOINT_RESTORE
> +option enabled.
>  .RS
>  .TP
>  .BR PR_SET_MM_START_CODE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
