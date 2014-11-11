From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] user_namespaces(7): drop spurious underline
Date: Tue, 11 Nov 2014 06:39:29 +0100
Message-ID: <5461A111.40001@gmail.com>
References: <1414814229-32200-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414814229-32200-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mike. Applied.

Cheers,

Michael

On 11/01/2014 04:57 AM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man7/user_namespaces.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index 0893640..d76721d 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -26,7 +26,7 @@
>  .\"
>  .TH USER_NAMESPACES 7 2014-09-21 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> -user_namespaces \- overview of Linux user_namespaces
> +user_namespaces \- overview of Linux user namespaces
>  .SH DESCRIPTION
>  For an overview of namespaces, see
>  .BR namespaces (7).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
