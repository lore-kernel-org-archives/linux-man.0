From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] futex.2: clarify address mapping
Date: Sat, 11 Apr 2015 08:56:05 +0200
Message-ID: <5528C585.5030805@gmail.com>
References: <1427654293-19851-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427654293-19851-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/29/2015 08:38 PM, Heinrich Schuchardt wrote:
> Using the word "physical" address should make the text easier to
> make.
> 
> Avoid negations like "may not be equal".


Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/futex.2 | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index b4a52b1..0644fc6 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -54,12 +54,10 @@ The condition is represented by the futex word, which is an address
>  in memory supplied to the
>  .BR futex ()
>  system call, and the value at this memory location.
> -(While the virtual addresses for the same memory in separate
> -processes may not be equal,
> -the kernel maps them internally so that the same memory mapped
> -in different locations will correspond for
> -.BR futex ()
> -calls.)
> +(While the virtual addresses for the same physical memory address
> +in separate processes may be different,
> +the same physical address may be shared by the processes using
> +.BR mmap (2).)
>  
>  When executing a futex operation that requests to block a thread,
>  the kernel will only block if the futex word has the value that the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
