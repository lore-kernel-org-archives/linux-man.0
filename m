From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:11:47 +0200
Message-ID: <5197C463.1020409@gmail.com>
References: <1367572734-21974-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367572734-21974-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/03/13 11:18, Peng Haitao wrote:
> The function getgrent() is not thread safe.

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getgrent.3 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man3/getgrent.3 b/man3/getgrent.3
> index ecf29fe..363fc15 100644
> --- a/man3/getgrent.3
> +++ b/man3/getgrent.3
> @@ -152,6 +152,17 @@ Insufficient buffer space supplied.
>  .TP
>  .I /etc/group
>  local group database file
> +.SH ATTRIBUTES
> +.SS Multithreading(see pthreads(7))
> +The
> +.BR getgrent()
> +is not thread-safe.
> +.LP
> +The
> +.BR setgrent()
> +and
> +.BR endgrent()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
