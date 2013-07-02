From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: Mention that PTRACE_PEEK* libc API and
	kernel API are different
Date: Tue, 2 Jul 2013 21:50:33 +0200
Message-ID: <20130702195033.GB9359@redhat.com>
References: <1372764004-1791-1-git-send-email-dvlasenk@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372764004-1791-1-git-send-email-dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/02, Denys Vlasenko wrote:
>
> By Oleg's request.

I spent several hours trying to understand why my test-case
doesn't work ;)

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

Thanks!

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
