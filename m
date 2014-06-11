From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.7: tfix
Date: Wed, 11 Jun 2014 19:43:02 +0200
Message-ID: <53989526.1050804@gmail.com>
References: <1402508046-4534-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402508046-4534-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael



On 06/11/2014 07:34 PM, Yuri Kozlov wrote:
> ---
>  man7/locale.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/locale.7 b/man7/locale.7
> index 3bcbfc8..6270739 100644
> --- a/man7/locale.7
> +++ b/man7/locale.7
> @@ -221,7 +221,7 @@ which returns a string such as "49" (for Germany).
>  This category governs the formatting used for date and time values.
>  For example, most of Europe uses a 24-hour clock versus the
>  12-hour clock used in the United States.
> -the setting of this category affects the behavior of functions such as
> +The setting of this category affects the behavior of functions such as
>  .BR strftime (3)
>  and
>  .BR strptime (3).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
