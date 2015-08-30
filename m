From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] setsid.2: tfix
Date: Sun, 30 Aug 2015 05:07:42 -0700
Message-ID: <55E2F20E.2050308@gmail.com>
References: <20150818144110.GA1805@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150818144110.GA1805@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/18/2015 07:41 AM, Tobias Stoeckmann wrote:
> it -> its

Thanks, Tobias. Applied.

Cheers,

Michael


> ---
>  man2/setsid.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/setsid.2 b/man2/setsid.2
> index 22885dd..089bf26 100644
> --- a/man2/setsid.2
> +++ b/man2/setsid.2
> @@ -46,7 +46,7 @@ The calling process is the leader of the new session
>  (i.e., its session ID is made the same as its process ID).
>  The calling process also becomes
>  the process group leader of a new process group in the session
> -(i.e., its process group ID is made the same as it process ID).
> +(i.e., its process group ID is made the same as its process ID).
>  
>  The calling process will be the only process in
>  the new process group and in the new session.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
