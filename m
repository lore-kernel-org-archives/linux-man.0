From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in example code of process_vm_readv
Date: Sun, 17 Aug 2014 10:53:06 -0500
Message-ID: <53F0CFE2.9040309@gmail.com>
References: <53EF41F4.2030509@ylenius.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53EF41F4.2030509-xG8NWnMrmhjR7s880joybQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville Ylenius <ville-xG8NWnMrmhjR7s880joybQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/16/2014 06:35 AM, Ville Ylenius wrote:
> Hi,
> 
> there is a small typo in the example code of the man page of 
> "process_vm_readv" 
> (http://man7.org/linux/man-pages/man2/process_vm_readv.2.html):
> 
>         #include <sys/uio.h>
> 
>         int
>         main(void)
>         {
>             struct iovec local[2];
>             struct iovec remote[1];
>             char buf1[10];
>             char buf2[10];
>             ssize_t nread;
>             pid_t pid = 10;             /* PID of remote process */
> 
>             local[0].iov_base = buf1;
>             local[0].iov_len = 10;
>             local[1].iov_base = buf2;
>             local[1].iov_len = 10;
>             remote[0].iov_base = (void *) 0x10000;
>             remote[1].iov_len = 20;                     /**** <---- TYPO: 1 --> 0 ****/
> 
>             nread = process_vm_readv(pid, local, 2, remote, 1, 0);
>             if (nread != 20)
>                 return 1;
>             else
>                 return 0;
>         }
> 
> 
> There is no two objects in "remote"-array so program corrupts other 
> variables memory.
> 
> Please change
> 
> remote[1].iov_len = 20;
> 
> to
> 
> remote[0].iov_len = 20;

Thanks, Ville. Fixed now.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
