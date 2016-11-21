From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] requesT_key.2: add information regarding minimal
 kernel version for key instantiation on request
Date: Mon, 21 Nov 2016 23:00:23 +0100
Message-ID: <ba65d2e1-02b7-ee65-4498-9db77abc2b9b@gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205948.GA16611@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121205948.GA16611@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eugene,

On 11/21/2016 09:59 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/request_key.2 | 2 ++
>  1 file changed, 2 insertions(+)

Applied. Thank you!

Cheers,

Michael


> diff --git a/man2/request_key.2 b/man2/request_key.2
> index e29ca06..e46dd61 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -364,6 +364,8 @@ No matching key was found.
>  Insufficient memory to create a key.
>  .SH VERSIONS
>  This system call first appeared in Linux 2.6.10.
> +.\" 3e30148c3d524a9c1c63ca28261bc24c457eb07a
> +The ability to instantiate keys upon request has been added in Linux 2.6.13.
>  .SH CONFORMING TO
>  This system call is a nonstandard Linux extension.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
