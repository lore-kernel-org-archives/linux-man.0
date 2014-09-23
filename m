From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] namespaces.7: tfix: CLONE_IPC -> CLONE_NEWIPC
Date: Tue, 23 Sep 2014 06:23:49 +0200
Message-ID: <5420F5D5.1030500@gmail.com>
References: <1411332635-11983-1-git-send-email-themineo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411332635-11983-1-git-send-email-themineo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wieland Hoffmann <themineo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/21/2014 10:50 PM, Wieland Hoffmann wrote:
> CLONE_NEWIPC is the correct constant, as can be seen in the detailed
> list of namespaces & their corresponding constants, as well as the
> clone(2) man page and include/uapi/linux/sched.h in the Linux source tree.

Thanks, Wieland. Applied.

Cheers,

Michael

> ---
>  man7/namespaces.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/namespaces.7 b/man7/namespaces.7
> index 931d038..d14d258 100644
> --- a/man7/namespaces.7
> +++ b/man7/namespaces.7
> @@ -41,7 +41,7 @@ Linux provides the following namespaces:
>  lB lB lB
>  l lB l.
>  Namespace	Constant	Isolates
> -IPC	CLONE_IPC	System V IPC, POSIX message queues
> +IPC	CLONE_NEWIPC	System V IPC, POSIX message queues
>  Network	CLONE_NEWNET	Network devices, stacks, ports, etc.
>  Mount	CLONE_NEWNS	Mount points
>  PID	CLONE_NEWPID	Process IDs
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
