From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rand.3: ATTRIBUTES: Note macros that are thread-safe
Date: Fri, 15 Aug 2014 20:29:15 +0200
Message-ID: <53EE517B.3090601@gmail.com>
References: <1407317081-16194-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407317081-16194-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied (in my local branch).

Cheers,

Michael


On 08/06/2014 11:24 AM, Peng Haitao wrote:
> The functions rand(), rand_r() and srand() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/rand.3 | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/rand.3 b/man3/rand.3
> index afa41a7..62e6331 100644
> --- a/man3/rand.3
> +++ b/man3/rand.3
> @@ -81,7 +81,7 @@ function is automatically seeded with a value of 1.
>  .PP
>  The function
>  .BR rand ()
> -is not reentrant or thread-safe, since it
> +is not reentrant, since it
>  uses hidden state that is modified on each call.
>  This might just be the seed value to be used by the next call,
>  or it might be something more elaborate.
> @@ -126,6 +126,20 @@ functions return a value between 0 and
>  The
>  .BR srand ()
>  function returns no value.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw25 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR rand (),
> +.BR rand_r (),
> +.BR srand ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  The functions
>  .BR rand ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
