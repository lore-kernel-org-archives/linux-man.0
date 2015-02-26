From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] kill.2: tfix
Date: Thu, 26 Feb 2015 08:41:14 +0100
Message-ID: <54EECE1A.4040708@gmail.com>
References: <20150222225849.GA3056@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150222225849.GA3056@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hallo Tobias,

On 02/22/2015 11:58 PM, Tobias Stoeckmann wrote:
> A missing s after send:

It depends whether one believes that subjunctive[1] still exists 
in English. Opinions are divided. I'm trying to hold onto it,
so I've not applied this patch.

Cheers,

Michael

[1] http://en.wikipedia.org/wiki/Subjunctive_mood#English

> POSIX.1-2001 requires that kill(-1,sig) send_s_ sig to [...]
> ---
>  man2/kill.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/kill.2 b/man2/kill.2
> index abd7807..e15c0a9 100644
> --- a/man2/kill.2
> +++ b/man2/kill.2
> @@ -129,7 +129,7 @@ has explicitly installed signal handlers.
>  This is done to assure the
>  system is not brought down accidentally.
>  .LP
> -POSIX.1-2001 requires that \fIkill(\-1,sig)\fP send \fIsig\fP
> +POSIX.1-2001 requires that \fIkill(\-1,sig)\fP sends \fIsig\fP
>  to all processes that the calling process may send signals to,
>  except possibly for some implementation-defined system processes.
>  Linux allows a process to signal itself, but on Linux the call
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
