From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ecvt_r.3: tfix
Date: Tue, 03 Mar 2015 08:29:21 +0100
Message-ID: <54F562D1.8040708@gmail.com>
References: <1425117558-7642-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425117558-7642-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael

On 02/28/2015 10:59 AM, Yuri Kozlov wrote:
> ---
>  man3/ecvt_r.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/ecvt_r.3 b/man3/ecvt_r.3
> index 2f31e61..17c7a95 100644
> --- a/man3/ecvt_r.3
> +++ b/man3/ecvt_r.3
> @@ -85,7 +85,7 @@ and
>  .BR qecvt (3).
>  .SH RETURN VALUE
>  These functions return 0 on success, and \-1 otherwise.
> -+.SH ATTRIBUTES
> +.SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
