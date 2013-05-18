From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fcloseall.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:03:42 +0200
Message-ID: <5197C27E.7050809@gmail.com>
References: <1368584804-8358-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368584804-8358-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/15/13 04:26, Peng Haitao wrote:
> The function fcloseall() is not thread safe.

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael

> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fcloseall.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/fcloseall.3 b/man3/fcloseall.3
> index 001bd99..6c41ceb 100644
> --- a/man3/fcloseall.3
> +++ b/man3/fcloseall.3
> @@ -52,6 +52,11 @@ This function returns 0 if all files were successfully closed;
>  on error,
>  .B EOF
>  is returned.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fcloseall ()
> +does not lock the streams, so it is not thread-safe.
>  .SH CONFORMING TO
>  This function is a GNU extension.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
