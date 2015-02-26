From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5:  Fix SELinux /proc/pid/attr/current example.
Date: Thu, 26 Feb 2015 08:57:17 +0100
Message-ID: <54EED1DD.6060606@gmail.com>
References: <1424705805-2782-1-git-send-email-sds@tycho.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424705805-2782-1-git-send-email-sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Stephen,

On 02/23/2015 04:36 PM, Stephen Smalley wrote:
> Since the /proc/pid/attr API was added to the kernel, there have
> been a couple of changes to the SELinux handling of /proc/pid/attr/current.
> Fix the SELinux /proc/pid/attr/current example text to reflect these
> changes

Thanks for attending to this.

> and note which kernel versions first included the changes.

Perfect!

Applied.

Cheers,

Michael


> 
> Signed-off-by: Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
> ---
>  man5/proc.5 | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index d01a7a9..68772f3 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -101,13 +101,27 @@ This directory is present only if the kernel was configured with
>  The contents of this file represent the current
>  security attributes of the process.
>  
> -In SELinux, this file is used to get the security context of a process,
> -but not to set the security context (a write is always denied),
> -since SELinux limits process security transitions to
> +In SELinux, this file is used to get the security context of a process.
> +Prior to Linux 2.6.11, this file could not be used to set the security
> +context (a write was always denied), since SELinux limited process security
> +transitions to
>  .BR execve (2)
>  (see the description of
>  .IR /proc/[pid]/attr/exec ,
>  below).
> +Since Linux 2.6.11, SELinux lifted this restriction and began supporting
> +"set" operations via writes to this node if authorized by policy,
> +although use of this operation is only suitable for applications that are
> +trusted to maintain any desired separation between the old and new security
> +contexts.  Prior to Linux 2.6.28, SELinux did not allow threads within a
> +multi-threaded process to set their security context via this node
> +as it would yield an inconsistency among the security contexts of the
> +threads sharing the same memory space.  Since Linux 2.6.28, SELinux lifted
> +this restriction and began supporting "set" operations for threads within
> +a multi-threaded process if the new security context is bounded by the old
> +security context, where the bounded relation is defined in policy and
> +guarantees that the new security context has a subset of the permissions
> +of the old security context.
>  Other security modules may choose to support "set" operations via
>  writes to this node.
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
