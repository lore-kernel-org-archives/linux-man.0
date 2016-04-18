From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale(5): country_car: add a better description
Date: Mon, 18 Apr 2016 14:59:27 +0100
Message-ID: <5714E83F.1050407@gmail.com>
References: <1460513138-16422-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460513138-16422-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/13/2016 03:05 AM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Thanks, Mike. Applied.

Cheers,

Michael


> ---
>  man5/locale.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 6aa8b9f..863de47 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -219,7 +219,7 @@ followed by the three-letter abbreviation of the country (ISO 3166).
>  followed by the numeric country code as plain numbers (ISO 3166).
>  .TP
>  .I country_car
> -followed by the code for the country car number.
> +followed by the international licence plate country code.
>  .TP
>  .I country_isbn
>  followed by the ISBN code (for books).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
