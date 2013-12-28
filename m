From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] kcmp.2: note about SECURITY_YAMA
Date: Sun, 29 Dec 2013 00:33:12 +1300
Message-ID: <52BEB6F8.5040302@gmail.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Shawn,

Can you supply more background on this patch. 

Looking at security/yama/yama_lsm.c:

[[
#define YAMA_SCOPE_DISABLED     0
#define YAMA_SCOPE_RELATIONAL   1
#define YAMA_SCOPE_CAPABILITY   2
#define YAMA_SCOPE_NO_ATTACH    3

static int ptrace_scope = YAMA_SCOPE_RELATIONAL;
]]

This suggests that your statement that the default value is 2 is incorrect,
but I may be missing something.

Cheers,

Michael


On 12/21/13 13:37, Shawn Landden wrote:
> Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> ---
>  man2/kcmp.2 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/kcmp.2 b/man2/kcmp.2
> index 59dd4d1..c910ac2 100644
> --- a/man2/kcmp.2
> +++ b/man2/kcmp.2
> @@ -187,7 +187,12 @@ is invalid.
>  Insufficient permission to inspect process resources.
>  The
>  .B CAP_SYS_PTRACE
> -capability is required to inspect processes that you do not own.
> +capability is required to inspect processes that you do not own. Other
> +limitations on ptrace apply, such as
> +.BR CONFIG_SECURITY_YAMA ,
> +which when /proc/sys/kernel/yama/ptrace_scope is 2 (the default) limits
> +.BR kcmp()
> +to child processes.
>  .TP
>  .B ESRCH
>  Process
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
