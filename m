From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtrace.1: ffix
Date: Sat, 4 Feb 2017 23:29:33 +1300
Message-ID: <b4ac14f9-1b7e-47a0-8170-e417e339fad7@gmail.com>
References: <20170203233749.957-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170203233749.957-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2017 12:37 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man1/mtrace.1 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man1/mtrace.1 b/man1/mtrace.1
> index 975500018..35e96ae58 100644
> --- a/man1/mtrace.1
> +++ b/man1/mtrace.1
> @@ -57,7 +57,8 @@ Print help and exit.
>  Print version information and exit.
>  .SH BUGS
>  For bug reporting instructions, please see:
> -<http://www.gnu.org/software/libc/bugs.html>.
> +.UR http://www.gnu.org/software/libc/bugs.html
> +.UE .
>  .SH SEE ALSO
>  .BR memusage (1),
>  .BR mtrace (3)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
