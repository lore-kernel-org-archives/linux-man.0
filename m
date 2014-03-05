From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: doubled reference to NOTES
Date: Wed, 05 Mar 2014 12:17:43 +0100
Message-ID: <531707D7.3050503@gmail.com>
References: <1393974318-29105-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393974318-29105-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/05/2014 12:05 AM, Simon Paillard wrote:
> Keep only one reference.

Hi Simon,

The doubled reference was deliberate, since these are under two 
different list items. (Or have I missed your point?)

Thanks,

Michael



> ---
>  man2/ptrace.2 | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 4fc2611..aca7d29 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -179,7 +179,6 @@ The word is returned as the result of the
>  call.
>  Typically, the offset must be word-aligned, though this might vary by
>  architecture.
> -See NOTES.
>  .RI ( data
>  is ignored; but see NOTES.)
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
