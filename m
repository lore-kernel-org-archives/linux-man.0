From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: [PATCH 1/1] futex.7: NPTL, avoid abbreviation
Date: Sat, 21 Feb 2015 08:56:52 +0100
Message-ID: <54E83A44.4040508@gmail.com>
References: <1424165125-6278-1-git-send-email-xypron.glpk@gmx.de> <54E30DC6.3020307@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54E30DC6.3020307-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org >> linux-man" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/17/2015 10:45 AM, Heinrich Schuchardt wrote:
> The abbreviation NPTL cannot be assumed to be common knowledge
> of all readers of futex.7.
> 
> pthread.7 has details about the NPTL pthreads implementation.

Applied. Thanks, Heinrich.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/futex.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/futex.7 b/man7/futex.7
> index 87d2997..c3c57f0 100644
> --- a/man7/futex.7
> +++ b/man7/futex.7
> @@ -29,7 +29,8 @@ but restricts itself to issues relevant for
>  application and library development.
>  Most programmers will in fact not be using futexes directly but will
>  instead rely on system libraries built on them,
> -such as the NPTL pthreads implementation.
> +such as the Native POSIX Thread Library (NPTL) (see
> +.BR pthreads (7)).
>  .PP
>  A futex is identified by a piece of memory which can be
>  shared between processes or threads.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
