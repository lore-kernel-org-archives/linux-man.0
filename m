From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: Mention that PTRACE_PEEK* libc API and kernel
 API are different
Date: Wed, 10 Jul 2013 20:27:16 +0200
Message-ID: <51DDA784.5020801@gmail.com>
References: <1372764004-1791-1-git-send-email-dvlasenk@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372764004-1791-1-git-send-email-dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Denys. Applied.

On 07/02/13 13:20, Denys Vlasenko wrote:
> By Oleg's request.
> 
> Signed-off-by: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
>  man2/ptrace.2 | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 55c4fe2..a6e01a0 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1776,8 +1776,15 @@ the report is sent only once.
>  .SH RETURN VALUE
>  On success,
>  .B PTRACE_PEEK*
> -requests return the requested data,
> -while other requests return zero.
> +requests return the requested data, while other requests return zero.
> +(On Linux, this is done in the libc wrapper around ptrace system call.
> +On the system call level,
> +.B PTRACE_PEEK*
> +requests have a different API: they store the result
> +at the address specified by
> +.I data
> +parameter, and return value is the error flag.)
> +.LP
>  On error, all requests return \-1, and
>  .I errno
>  is set appropriately.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
