From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] random.3: SEE ALSO getrandom.2
Date: Tue, 28 Oct 2014 15:37:35 +0100
Message-ID: <544FAA2F.5040600@gmail.com>
References: <1412295197-8100-1-git-send-email-xypron.glpk@gmx.de> <1412295324-8241-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412295324-8241-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied in a local branch.

Thanks,

Michael


On 10/03/2014 02:15 AM, Heinrich Schuchardt wrote:
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man3/random.3 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man3/random.3 b/man3/random.3
> index dc6fa9f..9789cb6 100644
> --- a/man3/random.3
> +++ b/man3/random.3
> @@ -196,6 +196,7 @@ is (as specified) set on error, but the function does not return NULL.
>  .\" http://sourceware.org/bugzilla/show_bug.cgi?id=15380
>  .SH SEE ALSO
>  .BR drand48 (3),
> +.BR getrandom (2),
>  .BR rand (3),
>  .BR random_r (3),
>  .BR srand (3)




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
