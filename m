From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ioctl_userfaultfd.2: update uffdio_api.features
 description
Date: Wed, 28 Jun 2017 16:11:12 +0200
Message-ID: <20170628141112.GI7050@redhat.com>
References: <1498653003-25227-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498653003-25227-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Dr. David Alan Gilbert" <dgilbert-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jun 28, 2017 at 03:30:03PM +0300, Mike Rapoport wrote:
> There is no requirement that uffdio_api.features must be zero for newer
> kernels. This field actually defines what features user space would like to
> enable.
> 
> Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man2/ioctl_userfaultfd.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> index 1797052..66d25ad 100644
> --- a/man2/ioctl_userfaultfd.2
> +++ b/man2/ioctl_userfaultfd.2
> @@ -86,7 +86,7 @@ structure, defined as:
>  
>  struct uffdio_api {
>      __u64 api;        /* Requested API version (input) */
> -    __u64 features;   /* Currently must be zero (input) */
> +    __u64 features;   /* Requested features (input) */
>      __u64 ioctls;     /* Available ioctl() operations (output) */
>  };

Agreed.

Just one small nitpick: "features" primarily an input, but at times is
also an output. The kernel will receive in input the feature to be
enabled on the activated uffd, but it'll output with all features
potentially available so that "features" as output, can be used for
probing the kernel support too.

For probing the current kernel support available in userfaultfd in a
backwards compatible fashion, userland has two options: it can either
set all features it needs enabled immediately and then abort if the
UFFDIO_API ioctl returns -EINVAL, or it can set "features" to zero and
do a run a dummy call of UFFDIO_API and check which features are set
in output in the "features" field after UFFDIO_API succeeds (then it
can throw away the "probing" uffd and open a new one or fail
gracefully with fingrained info of which userfaultfd features it needs
are missing in the running kernel).

The first option is probably the normal one to use and simpler to
code, but userland can provide a more meaningful error to userland
having the second option too.

On a side note, as mentioned some time ago, if UFFDIO_API returns
-EINVAL the uffdio_api userland structure gets clobbered with zeros by
the kernel purely for robustness. So the "features" field is to be
considered a meaningful output, only if UFFDIO_API ioctl succeeds and
returns 0.

Thanks,
Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
