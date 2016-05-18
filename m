From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] cgroups.7: tfix
Date: Wed, 18 May 2016 22:37:05 +0200
Message-ID: <29a3d861-a44b-ca15-e2e4-bd58113bc399@gmail.com>
References: <1462994188-7596-1-git-send-email-jwilk@jwilk.net>
 <1462994188-7596-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462994188-7596-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/11/2016 09:16 PM, Jakub Wilk wrote:
> Remove duplicated word.

Thanks, Jakub. Patch applied.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/cgroups.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index 3f3d11a..21ee749 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -95,7 +95,7 @@ This hierarchy is defined by creating, removing, and
>  renaming subdirectories within the cgroup filesystem.
>  At each level of the hierarchy, attributes (e.g., limits) can be defined;
>  these attributes may govern or propagate
> -to child cgroups and and their descendants in the hierarchy.
> +to child cgroups and their descendants in the hierarchy.
>  .\"
>  .SS Cgroups version 1 and version 2
>  The initial release of the cgroups implementation was in Linux 2.6.24.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
