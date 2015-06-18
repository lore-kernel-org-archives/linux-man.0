From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] setsid.2: tfix
Date: Thu, 18 Jun 2015 08:44:19 +0200
Message-ID: <558268C3.7060908@gmail.com>
References: <20150617203136.GA7998@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150617203136.GA7998@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/17/2015 10:31 PM, Tobias Stoeckmann wrote:
> it -> its

Thanks, Tobias. Applied.

Cheers,

Michael


> --- man-pages-4.00/man2/setsid.2	2015-05-07 08:30:41.000000000 +0200
> +++ man-pages-4.00/man2/setsid.2	2015-04-17 21:56:24.284269525 +0200
> @@ -43,7 +43,7 @@
>  creates a new session if the calling process is not a
>  process group leader.
>  The calling process is the leader of the new session
> -(i.e., its session ID is made the same as it process ID).
> +(i.e., its session ID is made the same as its process ID).
>  The calling process also becomes
>  the process group leader of a new process group in the session
>  (i.e., its process group ID is made the same as it process ID).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
