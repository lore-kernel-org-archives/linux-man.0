From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.2: do not reference futex.7 semantics
Date: Tue, 03 Mar 2015 09:01:33 +0100
Message-ID: <54F56A5D.6050709@gmail.com>
References: <1424181990-13202-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424181990-13202-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 02/17/2015 03:06 PM, Heinrich Schuchardt wrote:
> The futex.2 system call makes no assumption about the meaning
> of the values of a futex.
> It may check if the value changes.
> 
> The current futex.7 speaks of incrementing and decrementing
> a futex. That choice is arbitrary and unwise as overflows may
> occur.
> 
> If special considerations for the usage of futex.2 have to be made
> in a futex.7 example, this should be explained in futex.7

A recent patch by Torvald Riegel also proposed many of the same changes, and
I've applied that patch. Oone piece was not quite covered by Torvald's 
patch see my comment below.

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/futex.2 | 33 +--------------------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 6c02da7..0ea7db2 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -68,16 +68,6 @@ When a futex operation did not finish uncontended in user space, a
>  call needs to be made to the kernel to arbitrate.
>  Arbitration can either mean putting the caller
>  to sleep or, conversely, waking a waiting process or thread.
> -.PP
> -Callers of
> -.BR futex ()
> -are expected to adhere to the semantics described in
> -.BR futex (7).
> -As these semantics involve writing nonportable assembly instructions
> -(see the example library referred to in SEE ALSO),
> -this in turn probably means that most users will in fact be
> -library authors and not general application developers.
> -.\"
>  .SS Arguments
>  The
>  .I uaddr
> @@ -229,18 +219,6 @@ The arguments
>  and
>  .I val3
>  are ignored.
> -
> -For
> -.BR futex (7),
> -this call is executed if decrementing the count gave a negative value
> -(indicating contention),
> -and will sleep until another process or thread releases
> -the futex and executes the
> -.B FUTEX_WAKE
> -operation.
> -.\"
> -.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> -.\"
>  .TP
>  .BR FUTEX_WAKE " (since Linux 2.6.0)"
>  .\" Strictly speaking, since Linux 2.5.x
> @@ -266,15 +244,6 @@ The arguments
>  and
>  .I val3
>  are ignored.
> -
> -For
> -.BR futex (7),
> -this is executed if incrementing the count showed that there were waiters,
> -.\" FIXME How does "incrementing the count showed that there were waiters"?
> -once the futex value has been set to 1 (indicating that it is available).
> -.\"
> -.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> -.\"
>  .TP
>  .BR FUTEX_FD " (from Linux 2.6.0 up to and including Linux 2.6.25)"
>  .\" Strictly speaking, from Linux 2.5.x to 2.6.25
> @@ -304,7 +273,7 @@ and
>  are ignored.
>  
>  To prevent race conditions, the caller should test if the futex has
> -been upped after
> +been changed after

Torvald also questioned this sentence; currently it has a FIXME 
asking whether maybe it should just be removed altogether.

Thanks,

Michael


>  .B FUTEX_FD
>  returns.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
