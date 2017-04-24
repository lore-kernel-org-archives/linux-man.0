From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bpf.2: tfix
Date: Mon, 24 Apr 2017 13:18:08 +0200
Message-ID: <b4d4973c-29c0-de27-880d-172ea1d6e77c@gmail.com>
References: <20170424092055.26140-1-alexander@alemayhu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424092055.26140-1-alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Alemayhu <alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/24/2017 11:20 AM, Alexander Alemayhu wrote:
> o s/log_bug/log_buf
> 
> Signed-off-by: Alexander Alemayhu <alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>

Thanks, Alexander. Applied.

Cheers,

Michael


> ---
>  man2/bpf.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index 5339495769d0..544a3993ef2f 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -778,7 +778,7 @@ The format of the output can change at any time as the verifier evolves.
>  .IP *
>  .I log_size
>  size of the buffer pointed to by
> -.IR log_bug .
> +.IR log_buf .
>  If the size of the buffer is not large enough to store all
>  verifier messages, \-1 is returned and
>  .I errno
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
