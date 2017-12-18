From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cgroups.7: Add information about RDMA controller
Date: Mon, 18 Dec 2017 17:15:25 +0100
Message-ID: <be204479-d4e7-8af9-8adf-bf0852a4fe24@gmail.com>
References: <1513322710-29154-1-git-send-email-nborisov@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513322710-29154-1-git-send-email-nborisov-IBi9RG/b67k@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikolay,

On 12/15/2017 08:25 AM, Nikolay Borisov wrote:
> This one was added in 4.11 but the man pages never got updated. Put a
> sentence about it and a pointer to its documentation in the kernel
> tree.

Thanks! Patch applied.

Cheers,

Michael


> Signed-off-by: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
> ---
>  man7/cgroups.7 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index 19a5061d725e..a98ab18b913d 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -354,6 +354,13 @@ in a cgroup (and its descendants).
>  .IP
>  Further information can be found in the kernel source file
>  .IR Documentation/cgroup-v1/pids.txt .
> +.TP
> +.IR rdma " (since Linux 4.11; " \fBCONFIG_CGROUP_RDMA\fP )
> +RDMA controller allows user to limit RDMA/IB specific resources that a given
> +set of processes can use.
> +.IP
> +Further information can be found in the kernel source file
> +.IR Documentation/cgroup-v1/rdma.txt .
>  .\"
>  .SS Creating cgroups and moving processes
>  A cgroup filesystem initially contains a single root cgroup, '/',
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
