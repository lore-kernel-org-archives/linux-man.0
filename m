From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: tfix
Date: Wed, 02 Dec 2015 17:13:55 +0100
Message-ID: <565F18C3.2060701@gmail.com>
References: <1445257851-7427-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445257851-7427-1-git-send-email-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Namhyung Kim. Applied.

Cheers,

Michael



On 10/19/2015 02:30 PM, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/ptrace.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 058893f..46eccc4 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -834,7 +834,7 @@ returns
>  instead of having
>  .B SIGSTOP
>  signal delivered to them.
> -.BR evecve (2)
> +.BR execve (2)
>  does not deliver an extra
>  .BR SIGTRAP .
>  Only a
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
