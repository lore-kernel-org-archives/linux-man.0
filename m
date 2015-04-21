From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stat.2: add note about stat being racy
Date: Tue, 21 Apr 2015 14:44:44 +0200
Message-ID: <5536463C.1060406@gmail.com>
References: <20150420204601.GA9904@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150420204601.GA9904-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/20/2015 10:46 PM, Jann Horn wrote:
> The same thing was fixed for execve() in commit
> 8b01fc86b9f425899f8a3a8fc1c47d73c2c20543, but for performance
> reasons, that simple patch won't work for stat().

Thanks, Jann! Applied.

Cheers,

Michael


> ---
>  man2/stat.2 | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/man2/stat.2 b/man2/stat.2
> index 0d244af..69ec6a4 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -175,6 +175,29 @@ that may be present between some fields on various architectures.
>  Consult the glibc and kernel source code
>  if you need to know the details.
>  
> +\# Background: inode attributes are modified with i_mutex held, but
> +\# read by stat() without taking the mutex.
> +.I Note:
> +For performance and simplicity reasons, different fields in the
> +.I stat
> +structure may contain state information from different moments
> +during the execution of the syscall. For example, if
> +.IR st_mode ,
> +.IR st_uid
> +and
> +.IR st_gid
> +are changed by another process by calling
> +.BR chown (2) ,
> +.BR stat ()
> +might return the old
> +.I st_mode
> +together with the new
> +.IR st_uid ,
> +or the old
> +.I st_uid
> +together with the new
> +.IR st_mode .
> +
>  The
>  .I st_dev
>  field describes the device on which this file resides.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
