From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core.5: Mention that %E exists since Linux 3.0
Date: Thu, 23 Jan 2014 13:49:25 +0100
Message-ID: <52E10FD5.6040606@gmail.com>
References: <1390422790-5482-1-git-send-email-bernhard@bwalle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390422790-5482-1-git-send-email-bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/22/2014 09:33 PM, Bernhard Walle wrote:
> '%E' in the 'core_pattern' has been introduced in kernel commit
> 57cc083ad9e1bfeeb4a0ee831e7bb008c8865bf0 which was included in
> version 3.0. Add that information to the manual page.

Thanks, Bernhard. Applied.

Cheers,

Michael



> Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
> ---
>  man5/core.5 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/core.5 b/man5/core.5
> index 551f4a3..4855829 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -150,7 +150,8 @@ executable filename (without path prefix)
>  .TP
>  %E
>  pathname of executable,
> -with slashes (\(aq/\(aq) replaced by exclamation marks (\(aq!\(aq).
> +with slashes (\(aq/\(aq) replaced by exclamation marks (\(aq!\(aq)
> +(since Linux 3.0).
>  .TP
>  %c
>  core file size soft resource limit of crashing process (since Linux 2.6.24)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
