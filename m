From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] userfaultfd.2: document spurious UFFD_EVENT_FORK
Date: Thu, 9 Nov 2017 08:44:47 +0100
Message-ID: <1b812837-b368-5e6e-ff9d-7d570354437a@gmail.com>
References: <1510124048-7991-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510124048-7991-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/08/2017 07:54 AM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Thanks, Mike. Applied.

Cheers,

Michael


> ---
>  man2/userfaultfd.2 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> index 1c9e64b..08c41e1 100644
> --- a/man2/userfaultfd.2
> +++ b/man2/userfaultfd.2
> @@ -465,6 +465,16 @@ for checkpoint/restore mechanisms,
>  as well as post-copy migration to allow (nearly) uninterrupted execution
>  when transferring virtual machines and Linux containers
>  from one host to another.
> +.SH BUGS
> +If the
> +.B UFFD_FEATURE_EVENT_FORK
> +is enabled and a system call from the
> +.BR fork (2)
> +family is interrupted by a signal or failed,q a stale userfaultfd descriptor
> +might be created.
> +In this case a spurious
> +.B UFFD_EVENT_FORK
> +will be delivered to the userfaultfd monitor.
>  .SH EXAMPLE
>  The program below demonstrates the use of the userfaultfd mechanism.
>  The program creates two threads, one of which acts as the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
