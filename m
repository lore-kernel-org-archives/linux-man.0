From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: tfix
Date: Mon, 11 Dec 2017 20:00:55 +0100
Message-ID: <510f6a8b-9086-fc9f-58ad-8fe14f6c86c2@gmail.com>
References: <20171208231348.9176-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208231348.9176-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/09/2017 12:13 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  Changes.old | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Changes.old b/Changes.old
> index f8b8d9e5e..d0fbbecdd 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -47001,7 +47001,7 @@ errno.3
>              the C standards) that error numbers are positive, rather
>              than nonzero.
>      Michael Kerrisk
> -        Reorganize the text and and some subheadings
> +        Reorganize the text and some subheadings
>              Restructure the text and add some subheadings for better
>              readability. No (intentional) content changes.
>      Michael Kerrisk  [Wesley Aptekar-Cassels]

Thanks for spotting this, Jakub. The change I actually made is below.

Cheers,

Michael

--- a/Changes.old
+++ b/Changes.old
@@ -47001,7 +47001,7 @@ errno.3
             the C standards) that error numbers are positive, rather
             than nonzero.
     Michael Kerrisk
-        Reorganize the text and and some subheadings
+        Reorganize the text and add some subheadings
             Restructure the text and add some subheadings for better
             readability. No (intentional) content changes.
     Michael Kerrisk  [Wesley Aptekar-Cassels]



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
