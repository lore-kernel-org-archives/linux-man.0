From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ld.so.8: Expand DT_RUNPATH details.
Date: Wed, 5 Jul 2017 10:36:03 +0200
Message-ID: <190afcfe-974f-5cd2-8a5f-bc50c0f78547@gmail.com>
References: <b61939ec-ab27-59d0-bd6c-570b4055aea3@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b61939ec-ab27-59d0-bd6c-570b4055aea3-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/29/2017 06:21 PM, Carlos O'Donell wrote:
> ld.so.8: Expand DT_RUNPATH details.
> 
> Every 3 years we get asked why DT_RUNPATH doesn't work like DT_RPATH.
> The most recent question was here:
> https://www.sourceware.org/ml/libc-help/2017-06/msg00013.html
> 
> We need to expand the description of DT_RUNPATH to cover this situation
> and explain that the DT_RUNPATH entries apply only to the immediate
> DT_NEEDED, not that of another, say dlopen'd child object.
> 
> Applies to master.

Thanks, Carlos. Applied.

Cheers,

Michael


> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 89965a1..e9e320d 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -68,7 +68,11 @@ in which case it is ignored.
>  .IP o
>  Using the directories specified in the
>  DT_RUNPATH dynamic section attribute
> -of the binary if present.
> +of the binary if present. Such directories are only searched to
> +find those objects required by DT_NEEDED (direct dependencies) entries
> +and do not apply to those object's children who must themselves have
> +their own DT_RUNPATH entries. This is unlike DT_RPATH which is applied
> +to searches for all children in the dependency tree.
>  .IP o
>  From the cache file
>  .IR /etc/ld.so.cache ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
