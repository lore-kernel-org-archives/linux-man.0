From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ecvt.3: Modify thread-safety information
Date: Tue, 30 Dec 2014 14:27:57 +0100
Message-ID: <54A2A85D.3020901@gmail.com>
References: <1419487365-2790-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419487365-2790-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/25/2014 07:02 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the 
> thread-safety information to be same as glibc manual.


Thanks, Ma Shimiao. Applied in the 'attributes_reformat_2' branch.

Cheers,

Michael



> 
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ecvt.3 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/ecvt.3 b/man3/ecvt.3
> index f484a77..c468105 100644
> --- a/man3/ecvt.3
> +++ b/man3/ecvt.3
> @@ -116,9 +116,11 @@ lb lb lb
>  l l l.
>  Interface	Attribute	Value
>  T{
> -.BR ecvt (),
> +.BR ecvt ()
> +T}	Thread safety	MT-Unsafe race:ecvt
> +T{
>  .BR fcvt ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe race:fcvt
>  .TE
>  .SH CONFORMING TO
>  SVr2;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
