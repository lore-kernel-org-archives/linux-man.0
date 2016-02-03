From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] wavelan.4: tfix
Date: Wed, 3 Feb 2016 08:27:30 +0100
Message-ID: <56B1ABE2.3000305@gmail.com>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
 <1454446248-448-5-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-5-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/02/2016 09:50 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man4/wavelan.4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/wavelan.4 b/man4/wavelan.4
> index ebc4100..3ebdb7c 100644
> --- a/man4/wavelan.4
> +++ b/man4/wavelan.4
> @@ -118,7 +118,7 @@ This distribution might be used to calculate the mean value
>  and standard deviation of the signal level.
>  .SS Specific notes
>  This driver will fail to detect some
> -.B non-NCR/ATT&T/Lucent
> +.B non-NCR/AT&T/Lucent
>  Wavelan cards.
>  If this happens for you, you must look in the source code on
>  how to add your card to the detection routine.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
