From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] msgctl.2: Add note about ignored arg to IPC_RMID.
Date: Fri, 07 Feb 2014 14:37:18 +0100
Message-ID: <52F4E18E.9060608@gmail.com>
References: <20140206140737.GA16304@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140206140737.GA16304-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/06/2014 03:07 PM, Cyril Hrubis wrote:
> This bit of information is missing from the man page but can be, for

Thanks, Cyril. Patch applied.

Cheers,

Michael


> example, found in the Linux Programming Interface book.
> 
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/msgctl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/msgctl.2 b/man2/msgctl.2
> index 9ffd75b..5f32be6 100644
> --- a/man2/msgctl.2
> +++ b/man2/msgctl.2
> @@ -144,7 +144,7 @@ set to
>  .BR EIDRM ).
>  The calling process must have appropriate privileges
>  or its effective user ID must be either that of the creator or owner
> -of the message queue.
> +of the message queue. The third argument to msgctl() is ignored in this case.
>  .TP
>  .BR IPC_INFO " (Linux-specific)"
>  Returns information about system-wide message queue limits and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
