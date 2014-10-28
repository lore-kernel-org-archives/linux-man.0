From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] random.4: SEE ALSO getrandom.2
Date: Tue, 28 Oct 2014 15:38:06 +0100
Message-ID: <544FAA4E.5000506@gmail.com>
References: <1412295197-8100-1-git-send-email-xypron.glpk@gmx.de> <1412295335-8287-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412295335-8287-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied in a local branch.

Cheers,

Michael

On 10/03/2014 02:15 AM, Heinrich Schuchardt wrote:
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man4/random.4 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man4/random.4 b/man4/random.4
> index a193ddf..9ec0341 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -280,6 +280,7 @@ wall clock) to the pools.
>  .\" The kernel's random number generator was written by
>  .\" Theodore Ts'o (tytso-f/2Lh7Kzk888qNwGfFDJ/Q@public.gmane.org).
>  .SH SEE ALSO
> +.BR getrandom (2),
>  .BR mknod (1)
>  .br
>  RFC\ 1750, "Randomness Recommendations for Security"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
