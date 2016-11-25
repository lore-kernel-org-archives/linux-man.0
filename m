From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 6/7] keyrings.7: tfix
Date: Fri, 25 Nov 2016 09:43:00 +0100
Message-ID: <845f639b-a04b-48e4-6ac5-4144c99c5e8e@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010125.GA784@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010125.GA784@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:01 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 2 --
>  1 file changed, 2 deletions(-)


Applied. Thanks, Eugene.

Cheers,

Michael

> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 2da882c..9dac4db 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -588,8 +588,6 @@ The key type (user, keyring, etc.)
>  .TP
>  Description
>  The key description (name).
> -.TP
> -Description
>  This field contains descriptive information about the key.
>  For most key types, it has the form
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
