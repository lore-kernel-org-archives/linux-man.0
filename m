From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: spfix
Date: Mon, 29 Feb 2016 12:23:19 +0100
Message-ID: <56D42A27.6080204@gmail.com>
References: <1456702856-6077-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456702856-6077-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jakub,

On 02/29/2016 12:40 AM, Jakub Wilk wrote:
> Fix capitalization in the reference to section "Effect of user ID
> changes on capabilities".

Good spotting! Patch applied.

Thanks,

Michael

> 
> Capitalization of the section name was changed in
> c634028ab5768a042196fd71a38088499b21de12, but the reference remained
> unchanged.
>
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/capabilities.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 26de609..b4824ba 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -1096,7 +1096,7 @@ Setting this flag stops the kernel from adjusting capability sets when
>  the thread's effective and filesystem UIDs are switched between
>  zero and nonzero values.
>  (See the subsection
> -.IR "Effect of User ID Changes on Capabilities" .)
> +.IR "Effect of user ID changes on capabilities" .)
>  .TP
>  .B SECBIT_NOROOT
>  If this bit is set, then the kernel does not grant capabilities
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
