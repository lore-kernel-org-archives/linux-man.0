From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] random.4: mention PRNG used by urandom
Date: Sat, 10 Jan 2015 14:34:18 +0100
Message-ID: <54B12A5A.1050808@gmail.com>
References: <1417042709-16767-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417042709-16767-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/26/2014 11:58 PM, Heinrich Schuchardt wrote:
> /dev/urandom uses a pseudo random number generator to replace
> missing entropy.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man4/random.4 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/man4/random.4 b/man4/random.4
> index 44d9e34..1be19b8 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -63,8 +63,9 @@ will be set to
>  .LP
>  A read from the \fI/dev/urandom\fP device will not block
>  waiting for more entropy.
> -As a result, if there is not sufficient entropy in the
> -entropy pool, the returned values are theoretically vulnerable to a
> +If there is not sufficient entropy, a pseudorandom number generator is used
> +to create the requested bytes.
> +As a result, in this case the returned values are theoretically vulnerable to a
>  cryptographic attack on the algorithms used by the driver.
>  Knowledge of how to do this is not available in the current unclassified
>  literature, but it is theoretically possible that such an attack may
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
