From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] statx.2: tfix
Date: Tue, 25 Apr 2017 14:47:59 +0200
Message-ID: <eb9779e8-f248-457e-6c91-f097e7d51112@gmail.com>
References: <1493122695-8001-1-git-send-email-andrew@digital-domain.net>
 <1493122695-8001-3-git-send-email-andrew@digital-domain.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493122695-8001-3-git-send-email-andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/25/2017 02:18 PM, Andrew Clayton wrote:
> Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>

Thanks, Andrew. Applied.

Cheers,

Michael


> ---
>  man2/statx.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/statx.2 b/man2/statx.2
> index 12e0846..b2ff1ed 100644
> --- a/man2/statx.2
> +++ b/man2/statx.2
> @@ -44,7 +44,7 @@ statx \- get file status (extended)
>  
>  .IR Note :
>  There is no glibc wrapper for
> -.BR renameat2 ();
> +.BR statx ();
>  see NOTES.
>  .SH DESCRIPTION
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
