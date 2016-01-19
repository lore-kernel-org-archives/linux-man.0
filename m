From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perror.3: tfix
Date: Tue, 19 Jan 2016 12:52:40 +0100
Message-ID: <569E2388.3000305@gmail.com>
References: <20160119041557.64cdbaaf.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160119041557.64cdbaaf.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/19/2016 04:15 AM, Alexander Miller wrote:
> Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>

Thanks, Alexander. Applied. (But note that your mailer is
breaking patches by wrapping them.)

Cheers,

Michael


> diff --git a/man3/perror.3 b/man3/perror.3
> index f36cfcf..557eb54 100644
> --- a/man3/perror.3
> +++ b/man3/perror.3
> @@ -98,7 +98,7 @@ The function
>  serves to translate this error code into human-readable form.
>  Note that
>  .I errno
> -is undefined after a successful sysme call or library function call:
> +is undefined after a successful system call or library function call:
>  this call may well change this variable, even though it succeeds,
>  for example because it internally used some other library function
> that failed.
>  Thus, if a failing call is not immediately followed by a call to
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
