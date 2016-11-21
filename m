From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] request_key.2: additional error information
Date: Mon, 21 Nov 2016 23:00:49 +0100
Message-ID: <856db77a-29b2-4d46-a75e-9c2aa6d5e978@gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121210008.GA16907@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121210008.GA16907@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/21/2016 10:00 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/request_key.2 | 10 ++++++++++
>  1 file changed, 10 insertions(+)


Hello Eugene,

Applied. Thank you!

Cheers,

Michael


> diff --git a/man2/request_key.2 b/man2/request_key.2
> index 1a3af3f..936989a 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -331,6 +331,11 @@ The keyring wasn't available for modification by the user.
>  The key quota for this user would be exceeded by creating this key or linking
>  it to the keyring.
>  .TP
> +.B EFAULT
> +(Part of)
> +.IR type ", " description " or " callout_info
> +points outside process' accessible address space.
> +.TP
>  .B EINTR
>  The request was interrupted by a signal; see
>  .BR signal (7).
> @@ -361,6 +366,11 @@ No matching key was found.
>  .TP
>  .B ENOMEM
>  Insufficient memory to create a key.
> +.TP
> +.B EPERM
> +The
> +.I type
> +started from dot.
>  .SH VERSIONS
>  This system call first appeared in Linux 2.6.10.
>  .\" 3e30148c3d524a9c1c63ca28261bc24c457eb07a
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
