From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] iconv.1: ffix
Date: Thu, 26 Jan 2017 07:25:48 +1300
Message-ID: <a4e600fe-7d62-d973-f097-414eb60cf8f5@gmail.com>
References: <20170125155846.4908-1-jwilk@jwilk.net>
 <20170125155846.4908-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125155846.4908-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 04:58 AM, Jakub Wilk wrote:
> Don't embolden commas between option names.


Applied! Thanks, Jakub.

Cheers,

Michael



> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man1/iconv.1 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man1/iconv.1 b/man1/iconv.1
> index 8c7e2447d..7d9eda76c 100644
> --- a/man1/iconv.1
> +++ b/man1/iconv.1
> @@ -55,12 +55,12 @@ from the current locale's character
>  encoding.
>  .SH OPTIONS
>  .TP
> -.BI \-f " from-encoding" ", \-\-from\-code=" from-encoding
> +.BI \-f " from-encoding" "\fR, \fP\-\-from\-code=" from-encoding
>  Use
>  .I from-encoding
>  for input characters.
>  .TP
> -.BI \-t " to-encoding" ", \-\-to\-code=" to-encoding
> +.BI \-t " to-encoding" "\fR, \fP\-\-to\-code=" to-encoding
>  Use
>  .I to-encoding
>  for output characters.
> @@ -90,7 +90,7 @@ List all known character set encodings.
>  Silently discard characters that cannot be converted instead of
>  terminating when encountering such characters.
>  .TP
> -.BI \-o " outputfile" ", \-\-output=" outputfile
> +.BI \-o " outputfile" "\fR, \fP\-\-output=" outputfile
>  Use
>  .I outputfile
>  for output.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
