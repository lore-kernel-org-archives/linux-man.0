From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bpf(2): fix func signature
Date: Fri, 07 Aug 2015 11:16:54 +0200
Message-ID: <55C47786.5020002@gmail.com>
References: <1438149380-21363-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438149380-21363-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/29/2015 07:56 AM, Mike Frysinger wrote:
> Also add a missing period in the errno section.

Thanks, Mike. Applied.

Cheers,

Michael


> ---
>  man2/bpf.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index 2b96ebc..d7e638c 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -30,7 +30,7 @@ bpf - perform a command on an extended BPF map or program
>  .nf
>  .B #include <linux/bpf.h>
>  .sp
> -.BI "int bpf(int cmd, union bpf_attr *attr, unsigned int size);
> +.BI "int bpf(int " cmd ", union bpf_attr *" attr ", unsigned int " size ");
>  .SH DESCRIPTION
>  The
>  .BR bpf ()
> @@ -969,7 +969,7 @@ Cannot allocate sufficient memory.
>  .TP
>  .B EBADF
>  .I fd
> -is not an open file descriptor
> +is not an open file descriptor.
>  .TP
>  .B EFAULT
>  One of the pointers
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
