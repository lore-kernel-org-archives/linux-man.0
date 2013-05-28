From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getusershell.3: ATTRIBUTES: Note functions that are not
 thread-safe
Date: Tue, 28 May 2013 16:06:51 +0200
Message-ID: <51A4B9FB.1050006@gmail.com>
References: <1369734610-12284-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369734610-12284-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/28/13 11:50, Peng Haitao wrote:
> The functions getusershell(), setusershell() and endusershell()
> are not thread safe.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getusershell.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/getusershell.3 b/man3/getusershell.3
> index a6c8ab1..b9e7e58 100644
> --- a/man3/getusershell.3
> +++ b/man3/getusershell.3
> @@ -82,6 +82,14 @@ function returns a NULL pointer on end-of-file.
>  .nf
>  /etc/shells
>  .fi
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getusershell (),
> +.BR setusershell ()
> +and
> +.BR endusershell ()
> +functions are not thread-safe.
>  .SH CONFORMING TO
>  4.3BSD.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
