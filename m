From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] zdump.8: Add OPTIONS section
Date: Mon, 10 Apr 2017 13:43:47 +0200
Message-ID: <375ea687-063b-ef85-b703-dc719e86fb68@gmail.com>
References: <20170408155241.6130-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170408155241.6130-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/08/2017 05:52 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Hi Jakub,

Applied. Thanks! 

Cheers,

Michael


> ---
>  man8/zdump.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man8/zdump.8 b/man8/zdump.8
> index 789e6672b..f5c2d643b 100644
> --- a/man8/zdump.8
> +++ b/man8/zdump.8
> @@ -24,7 +24,7 @@ prints the current time in each
>  .I zonename
>  named on the command line.
>  .PP
> -These options are available:
> +.SH OPTIONS
>  .TP
>  .B \-\-version
>  Output version information and exit.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
