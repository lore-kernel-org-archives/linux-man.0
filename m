From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ether_aton.3: ATTRIBUTES: Note functions that are not
 thread-safe
Date: Tue, 28 May 2013 23:06:02 +0200
Message-ID: <51A51C3A.9020700@gmail.com>
References: <1369732102-8641-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369732102-8641-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/28/13 11:08, Peng Haitao wrote:
> The functions ether_aton() and ether_ntoa() are not thread safe.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ether_aton.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/ether_aton.3 b/man3/ether_aton.3
> index eb65777..9355de1 100644
> --- a/man3/ether_aton.3
> +++ b/man3/ether_aton.3
> @@ -120,6 +120,22 @@ struct ether_addr {
>  }
>  .fi
>  .in
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ether_aton ()
> +and
> +.BR ether_ntoa ()
> +functions are not thread-safe.
> +.LP
> +The
> +.BR ether_ntohost (),
> +.BR ether_hostton (),
> +.BR ether_line (),
> +.BR ether_ntoa_r ()
> +and
> +.BR ether_aton_r ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, SunOS.
>  .SH BUGS
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
