From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] encrypt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Sat, 18 May 2013 20:07:39 +0200
Message-ID: <5197C36B.2040209@gmail.com>
References: <1367827405-3608-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367827405-3608-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/06/13 10:03, Peng Haitao wrote:
> The functions encrypt() and setkey() are not thread safe.


Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/encrypt.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/encrypt.3 b/man3/encrypt.3
> index 411cb22..50b0f15 100644
> --- a/man3/encrypt.3
> +++ b/man3/encrypt.3
> @@ -121,6 +121,19 @@ On success, it is unchanged.
>  .B ENOSYS
>  The function is not provided.
>  (For example because of former USA export restrictions.)
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The functions
> +.BR encrypt ()
> +and
> +.BR setkey ()
> +are not thread-safe.
> +.LP
> +The functions
> +.BR encrypt_r ()
> +and
> +.BR setkey_r ()
> +are thread-safe.
>  .SH CONFORMING TO
>  The functions
>  .BR encrypt ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
