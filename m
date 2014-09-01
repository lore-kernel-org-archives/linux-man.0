From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: tfix
Date: Mon, 01 Sep 2014 19:07:26 +0200
Message-ID: <5404A7CE.7030704@gmail.com>
References: <1408970442-12572-1-git-send-email-roques@mti.ag>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408970442-12572-1-git-send-email-roques-DeIDFP5fInQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian von Roques <roques-DeIDFP5fInQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Christian. Applied.

Cheers,

Michael


On 08/25/2014 02:40 PM, Christian von Roques wrote:
> diff --git a/man2/open.2 b/man2/open.2
> index 6dca2b8..51455aa 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -603,7 +603,7 @@ Write operations on the file will complete according to the requirements of
>  synchronized I/O
>  .I file
>  integrity completion
> -(by contrast with contrast with the
> +(by contrast with the
>  synchronized I/O
>  .I data
>  integrity completion
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
