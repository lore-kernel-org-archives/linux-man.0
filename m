From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpnam.3: Modify thread-safety information
Date: Fri, 17 Oct 2014 07:11:43 +0200
Message-ID: <5440A50F.3050104@gmail.com>
References: <1413514866-28678-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413514866-28678-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied in the attributes_reformat_2 branch.

Cheers,

Michael



On 10/17/2014 05:01 AM, Peng Haitao wrote:
> When the argument s is NULL, tmpnam() should be MT-Unsafe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tmpnam.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
> index 0371d79..bf68159 100644
> --- a/man3/tmpnam.3
> +++ b/man3/tmpnam.3
> @@ -93,7 +93,7 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR tmpnam ()
> -T}	Thread safety	MT-Safe /!s
> +T}	Thread safety	MT-Unsafe race:tmpnam/!s
>  T{
>  .BR tmpnam_r ()
>  T}	Thread safety	MT-Safe
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
