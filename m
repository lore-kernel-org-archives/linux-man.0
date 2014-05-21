From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/24] rcmd.3: Fix prototypes
Date: Wed, 21 May 2014 20:09:27 +0200
Message-ID: <537CEBD7.4020801@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-14-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-14-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus. Applied.

Cheers,

Michael



On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> Unlike the BSDs, the second argument of rcmd() and rcmd_af() has
> type unsigned short.
> 
> The first argument of iruserok_af() has type const void*.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/rcmd.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/rcmd.3 b/man3/rcmd.3
> index 09c6457..4086fe4 100644
> --- a/man3/rcmd.3
> +++ b/man3/rcmd.3
> @@ -49,7 +49,7 @@ stream to a remote command
>  .nf
>  .B #include <netdb.h> \ \ \fP/* Or <unistd.h> on some systems */
>  .sp
> -.BI "int rcmd(char **" ahost ", int " inport ", const char *" locuser ", "
> +.BI "int rcmd(char **" ahost ", unsigned short " inport ", const char *" locuser ", "
>  .BI "         const char *" remuser ", const char *" cmd ", int *" fd2p );
>  .sp
>  .BI "int rresvport(int *" port );
> @@ -60,13 +60,13 @@ stream to a remote command
>  .BI "int ruserok(const char *" rhost ", int " superuser ", "
>  .BI "            const char *" ruser ", const char *" luser );
>  .sp
> -.BI "int rcmd_af(char **" ahost ", int " inport ", const char *" locuser ", "
> +.BI "int rcmd_af(char **" ahost ", unsigned short " inport ", const char *" locuser ", "
>  .BI "            const char *" remuser ", const char *" cmd ", int *" fd2p ,
>  .BI "            sa_family_t " af );
>  .sp
>  .BI "int rresvport_af(int *" port ", sa_family_t " af );
>  .sp
> -.BI "int iruserok_af(uint32_t " raddr ", int " superuser ", "
> +.BI "int iruserok_af(const void *" raddr ", int " superuser ", "
>  .BI "                const char *" ruser ", const char *" luser \
>  ", sa_family_t " af );
>  .sp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
