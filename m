From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cgroups.7: ffix
Date: Tue, 27 Dec 2016 21:04:27 +0100
Message-ID: <581c640a-ee21-50d0-1625-e2b4286ea7a7@gmail.com>
References: <20161227193050.GA548@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161227193050.GA548-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Keno. Applied.

Cheers,

Michael



On 12/27/2016 08:30 PM, Keno Fischer wrote:
> ---
>  man7/cgroups.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index d640210..2285725 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -156,7 +156,8 @@ all threads in the process).
>  .\"
>  .SS Mounting v1 controllers
>  The use of cgroups requires a kernel built with the
> -.BR CONFIG_CGROUP\option.
> +.BR CONFIG_CGROUP
> +option.
>  In addition, each of the v1 controllers has an associated
>  configuration option that must be set in order to employ that controller.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
