From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] request_key.2: wfix
Date: Mon, 21 Nov 2016 22:59:48 +0100
Message-ID: <4780d347-264c-6013-0501-70cc9faa0de0@gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121210001.GA16802@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121210001.GA16802@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene

On 11/21/2016 10:00 PM, Eugene Syromyatnikov wrote:> ---
>  man2/request_key.2 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied. Thanks!

Cheers,

Michael

> diff --git a/man2/request_key.2 b/man2/request_key.2
> index 63e8206..1a3af3f 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -198,8 +198,7 @@ in the requesting program.
>  The payload of the key is taken from the data specified in
>  .IR callout_info .
>  .IP *
> -Internally, the kernel also records a record of the PID of the process
> -that called
> +Internally, the kernel also records the PID of the process that called
>  .BR request_key (2).
>  .RE
>  .IP c)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
