From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] capabilities.7: tfix
Date: Sun, 28 Feb 2016 14:40:03 +0100
Message-ID: <56D2F8B3.7010209@gmail.com>
References: <1456619561-613-1-git-send-email-jwilk@jwilk.net>
 <1456619561-613-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456619561-613-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/28/2016 01:32 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>


Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man7/capabilities.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 6ba9987..26de609 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -1093,7 +1093,7 @@ operation.)
>  .TP
>  .B SECBIT_NO_SETUID_FIXUP
>  Setting this flag stops the kernel from adjusting capability sets when
> -the threads's effective and filesystem UIDs are switched between
> +the thread's effective and filesystem UIDs are switched between
>  zero and nonzero values.
>  (See the subsection
>  .IR "Effect of User ID Changes on Capabilities" .)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
