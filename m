From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ilogb.3: tfix
Date: Sat, 13 Sep 2014 19:24:26 -0700
Message-ID: <5414FC5A.9080205@gmail.com>
References: <1410242133-9514-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410242133-9514-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in the attributes_2 branch.

Cheers,

Michel


On 09/08/2014 10:55 PM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ilogb.3 | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/man3/ilogb.3 b/man3/ilogb.3
> index e8b16ad..caad9fa 100644
> --- a/man3/ilogb.3
> +++ b/man3/ilogb.3
> @@ -144,7 +144,6 @@ or raise an exception for this case.
>  .\" log(), log2(), log10() do set errno
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
