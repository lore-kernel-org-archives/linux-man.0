From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/24] perror.3: Fix declaration
Date: Wed, 21 May 2014 19:50:09 +0200
Message-ID: <537CE751.1030109@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-7-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-7-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The elements of the array sys_errlist are also const.
> 
> Also, it is probably not desirable to pretend that errno.h defines
> errno in the traditional way (errno(3) correctly contains an explicit
> warning against this). I don't know what the best solution is, though.

Well, your proposal does improve things. Applied.

Thanks,

Michael



> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/perror.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/perror.3 b/man3/perror.3
> index 57580a9..34f3ec5 100644
> --- a/man3/perror.3
> +++ b/man3/perror.3
> @@ -38,11 +38,11 @@ perror \- print a system error message
>  .sp
>  .B #include <errno.h>
>  .sp
> -.BI "const char *" sys_errlist [];
> +.BI "const char * const " sys_errlist [];
>  .br
>  .BI "int " sys_nerr ;
>  .br
> -.BI "int " errno ;
> +.BI "int " errno "; /* Not really declared this way; see errno(3). */"
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
