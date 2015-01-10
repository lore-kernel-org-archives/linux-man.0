From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] random.4: describe handling of O_NONBLOCK
Date: Sat, 10 Jan 2015 14:32:18 +0100
Message-ID: <54B129E2.3040407@gmail.com>
References: <1417042565-16707-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417042565-16707-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/26/2014 11:56 PM, Heinrich Schuchardt wrote:
> /dev/random and /dev/urandom treat O_NONBLOCK differently.
> This should be described in the manpage.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man4/random.4 | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/man4/random.4 b/man4/random.4
> index a193ddf..44d9e34 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -44,6 +44,22 @@ pool.
>  high quality randomness such as one-time pad or key generation.
>  When the entropy pool is empty, reads from \fI/dev/random\fP will block
>  until additional environmental noise is gathered.
> +If
> +.BR open (2)
> +is called for
> +.I /dev/random
> +with flag
> +.BR O_NONBLOCK ,
> +a subsequent
> +.BR read (2)
> +will not block if the requested number of bytes is not available.
> +Instead the available bytes are returned.
> +If no byte is available
> +.BR read (2)
> +will return -1 and
> +.I errno
> +will be set to
> +.BR EAGAIN .
>  .LP
>  A read from the \fI/dev/urandom\fP device will not block
>  waiting for more entropy.
> @@ -55,6 +71,15 @@ literature, but it is theoretically possible that such an attack may
>  exist.
>  If this is a concern in your application, use \fI/dev/random\fP
>  instead.
> +.B O_NONBLOCK
> +has no effect when opening
> +.IR /dev/urandom .
> +When calling
> +.BR read (2)
> +for device
> +.I /dev/urandom
> +signals will not be handled until after the requested random bytes
> +have been generated.
>  .LP
>  Writing to \fI/dev/random\fP or \fI/dev/urandom\fP will update the
>  entropy pool with the data written, but this will not result in a
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
