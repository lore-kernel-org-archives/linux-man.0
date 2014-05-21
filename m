From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 15/24] rexec.3: Fix prototypes
Date: Wed, 21 May 2014 20:10:29 +0200
Message-ID: <537CEC15.3010400@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-16-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-16-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus. Applied.

Cheers,

Michael



On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The user, passwd and cmd arguments to rexec and rexec_af are all
> const.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/rexec.3 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/rexec.3 b/man3/rexec.3
> index b62897b..12ba477 100644
> --- a/man3/rexec.3
> +++ b/man3/rexec.3
> @@ -46,11 +46,11 @@ rexec, rexec_af \- return stream to a remote command
>  .BR "#define _BSD_SOURCE" "             /* See feature_test_macros(7) */"
>  .B #include <netdb.h>
>  .sp
> -.BI "int rexec(char **" ahost ", int " inport ", char *" user ", "
> -.BI "          char *" passwd ", char *" cmd ", int *" fd2p );
> +.BI "int rexec(char **" ahost ", int " inport ", const char *" user ", "
> +.BI "          const char *" passwd ", const char *" cmd ", int *" fd2p );
>  .sp
> -.BI "int rexec_af(char **" ahost ", int " inport ", char *" user ", "
> -.BI "             char *" passwd ", char *" cmd ", int *" fd2p ,
> +.BI "int rexec_af(char **" ahost ", int " inport ", const char *" user ", "
> +.BI "             const char *" passwd ", const char *" cmd ", int *" fd2p ,
>  .BI "             sa_family_t " af  );
>  .fi
>  .SH DESCRIPTION
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
