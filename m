From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] add_key.2: add information regarding EFAULT
Date: Wed, 16 Nov 2016 18:56:58 +0100
Message-ID: <229c13d1-f49b-acb5-c275-2189f5c80d08@gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <20161115084430.GA20968@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115084430.GA20968@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/15/2016 09:44 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/add_key.2 | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks, Eugene. Applied.

Cheers,

Michael


> diff --git a/man2/add_key.2 b/man2/add_key.2
> index 78b1b99..082a2b8 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -148,6 +148,11 @@ The keyring wasn't available for modification by the user.
>  The key quota for this user would be exceeded by creating this key or linking
>  it to the keyring.
>  .TP
> +.B EFAULT
> +(Part of)
> +.IR type ", " description " or " payload
> +points outside process' accessible address space.
> +.TP
>  .B EINVAL
>  The size of the string (including the terminating null byte) specified in
>  .I type
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
