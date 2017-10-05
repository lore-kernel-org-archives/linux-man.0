From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] sysfs.5: tfix
Date: Thu, 5 Oct 2017 20:37:37 +0200
Message-ID: <3ec315cc-97c6-34ed-1c39-fb588f09d65a@gmail.com>
References: <20171003154512.9245-1-jwilk@jwilk.net>
 <20171003154512.9245-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003154512.9245-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/03/2017 05:45 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man5/sysfs.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Jakub. Applied.

Cheers,

Michael


> diff --git a/man5/sysfs.5 b/man5/sysfs.5
> index 5f7fb9985..a8f6b30be 100644
> --- a/man5/sysfs.5
> +++ b/man5/sysfs.5
> @@ -197,7 +197,7 @@ This subdirectory contains one subdirectory for each of the
>  huge page sizes that the system supports.
>  The subdirectory name indicates the huge page size (e.g.,
>  .IR hugepages-2048kB ).
> -Within each of these subbdirectories is a set of files
> +Within each of these subdirectories is a set of files
>  that can be used to view and (in some cases) change settings
>  associated with that huge page size.
>  For further information, see the kernel source file
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
