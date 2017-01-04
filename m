From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/8] keyrings.7: tfix
Date: Wed, 4 Jan 2017 15:25:59 +1300
Message-ID: <4c35abb7-695f-2c55-40a8-1cb2c28f37f1@gmail.com>
References: <20170103233657.8875-1-jwilk@jwilk.net>
 <20170103233657.8875-6-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-6-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/04/2017 12:36 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>


Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man7/keyrings.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 73302bc82..18d3ffc34 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -656,7 +656,7 @@ For most key types, it has the form
>  
>  The
>  .I name
> -subfield is the the key's description (name).
> +subfield is the key's description (name).
>  The optional
>  .I extra\-info
>  field provides some further information about the key.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
