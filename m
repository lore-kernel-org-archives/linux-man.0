From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] cgroups.7: tfix
Date: Sat, 31 Dec 2016 20:35:10 +0100
Message-ID: <83fe8f0a-6595-8775-be70-cb41fc8a116c@gmail.com>
References: <a7d1da44d6003fc848baf286b5290fb8060fafea.1483121806.git.osandov@osandov.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7d1da44d6003fc848baf286b5290fb8060fafea.1483121806.git.osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2016 07:26 PM, Omar Sandoval wrote:
> Signed-off-by: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>

Thanks, Omar. Applied.

Cheers,

Michael


> ---
>  man7/cgroups.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index 2285725aa..bd0d2823d 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -248,7 +248,7 @@ For further information, see
>  In Linux 3.2,
>  this controller was extended to provide CPU "bandwidth" control.
>  If the kernel is configured with
> -.BR COONFIG_CFS_BANDWIDTH ,
> +.BR CONFIG_CFS_BANDWIDTH ,
>  then within each scheduling period
>  (defined via a file in the cgroup directory), it is possible to define
>  an upper limit on the CPU time allocated to the processes in a cgroup.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
