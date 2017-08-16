From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ioctl_userfaultfd.2: update uffdio_api.features
 description
Date: Wed, 16 Aug 2017 09:20:07 +0200
Message-ID: <f72443b7-2cc8-7a74-26d0-3f0d20f9b89d@gmail.com>
References: <1502722279-13861-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1502722279-13861-2-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502722279-13861-2-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/14/2017 04:51 PM, Mike Rapoport wrote:
> There is no requirement that uffdio_api.features must be zero for newer
> kernels. This field actually defines what features user space would like to
> enable.

Thanks, Mike. Applied.

Cheers,

Michael


> Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man2/ioctl_userfaultfd.2 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> index f97b3ef..14260fc 100644
> --- a/man2/ioctl_userfaultfd.2
> +++ b/man2/ioctl_userfaultfd.2
> @@ -86,7 +86,7 @@ structure, defined as:
>  
>  struct uffdio_api {
>      __u64 api;        /* Requested API version (input) */
> -    __u64 features;   /* Currently must be zero (input) */
> +    __u64 features;   /* Requested features (input/output) */
>      __u64 ioctls;     /* Available ioctl() operations (output) */
>  };
>  
> @@ -665,4 +665,3 @@ operation that actually enables the desired features.
>  
>  .IR Documentation/vm/userfaultfd.txt
>  in the Linux kernel source tree
> -
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
