From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] userfaultfd.2: describe memory types that can be used
 from 4.11
Date: Wed, 26 Apr 2017 08:52:16 +0200
Message-ID: <adc6c2a6-1cd8-cdf9-86b2-5e9e517833c8@gmail.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493137748-32452-2-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493137748-32452-2-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/25/2017 06:29 PM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Thanks, Mike. Applied.

Cheers,

Michael



> ---
>  man2/userfaultfd.2 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> index 1603c20..c89484f 100644
> --- a/man2/userfaultfd.2
> +++ b/man2/userfaultfd.2
> @@ -130,8 +130,12 @@ Details of the various
>  operations can be found in
>  .BR ioctl_userfaultfd (2).
>  
> -Currently, userfaultfd can be used only with anonymous private memory
> -mappings.
> +Up to Linux 4.11,
> +userfaultfd can be used only with anonymous private memory mappings.
> +
> +Since Linux 4.11,
> +userfaultfd can be also used with hugetlbfs and shared memory mappings.
> +
>  .\"
>  .SS Reading from the userfaultfd structure
>  Each
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
