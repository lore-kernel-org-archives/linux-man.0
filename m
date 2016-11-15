From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] add_key.2: add information regarding EPERM
Date: Tue, 15 Nov 2016 22:00:49 +0100
Message-ID: <fc419c25-7e99-9b47-0439-3469bb6e9ed6@gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <20161115084440.GA21255@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115084440.GA21255@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eugene

On 11/15/2016 09:44 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/add_key.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/add_key.2 b/man2/add_key.2
> index 082a2b8..241eb92 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -183,6 +183,19 @@ The keyring doesn't exist.
>  .TP
>  .B ENOMEM
>  Insufficient memory to create a key.
> +.TP
> +.B EPERM
> +The
> +.I type
> +started from dot.

Oh -- I was unaware of this! What are key types that start with "." about,
do you know?

Cheers,

Michael


> +.TP
> +.B EPERM
> +.I type
> +was
> +.I """keyring"""
> +and the
> +.I description
> +started from dot.
>  .SH VERSIONS
>  This system call first appeared in Linux 2.6.10.
>  .SH CONFORMING TO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
