From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vcs.4: tfix
Date: Mon, 25 Jan 2016 14:28:22 +0100
Message-ID: <56A622F6.1010705@gmail.com>
References: <20160123121846.GA20560@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160123121846.GA20560-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/23/2016 01:18 PM, Dmitry V. Levin wrote:
> Fixes: 42c3e94740fb ("Convert inline formatting (\fX...\fP) to dot-directive formatting")
> Reported-by: Pakin Yury <zxwarior-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Thanks, Dmitry. Applied.

Cheers,

Michael


> ---
>  man4/vcs.4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/vcs.4 b/man4/vcs.4
> index e4928a7..3399c78 100644
> --- a/man4/vcs.4
> +++ b/man4/vcs.4
> @@ -107,7 +107,7 @@ Note that the output does not contain
>  newline characters, so some processing may be required, like
>  in
>  
> -    old \-w 81 /dev/vcs3 | lpr
> +    fold \-w 81 /dev/vcs3 | lpr
>  
>  or (horrors)
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
