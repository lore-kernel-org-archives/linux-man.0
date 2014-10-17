From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hsearch.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 07:11:38 +0200
Message-ID: <5440A50A.302@gmail.com>
References: <1413516914-30757-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413516914-30757-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied in the attributes_reformat_2 branch.

Cheers,

Michael



On 10/17/2014 05:35 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/hsearch.3 | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index 176262f..aced682 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -229,20 +229,24 @@ POSIX.1-2001 specifies only the
>  .B ENOMEM
>  error.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw38 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR hcreate (),
>  .BR hsearch (),
> -and
>  .BR hdestroy ()
> -functions use a global space for storing the table, so they are not thread-safe.
> -.LP
> -The
> +T}	Thread safety	MT-Unsafe
> +T{
>  .BR hcreate_r (),
>  .BR hsearch_r (),
> -and
>  .BR hdestroy_r ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  The functions
>  .BR hcreate (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
