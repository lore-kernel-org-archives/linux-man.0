From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdio_ext.3: Reformat thread-safety information
Date: Fri, 15 Aug 2014 20:36:45 +0200
Message-ID: <53EE533D.8060605@gmail.com>
References: <1407232376-3331-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407232376-3331-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao, Applied.

Cheers,

Michael


On 08/05/2014 11:52 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stdio_ext.3 | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
> index ef052ea..bdf6194 100644
> --- a/man3/stdio_ext.3
> +++ b/man3/stdio_ext.3
> @@ -130,24 +130,31 @@ The
>  .BR __fpurge ()
>  function discards the contents of the stream's buffer.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR __fbufsize (),
>  .BR __fpending (),
> -.BR __fpurge ()
> -and
> +.br
> +.BR __fpurge (),
>  .BR __fsetlocking ()
> -functions do not lock the stream, so they are not thread-safe.
> -.LP
> -The
> +T}	Thread safety	MT-Unsafe
> +T{
>  .BR __flbf (),
>  .BR __freadable (),
> +.br
>  .BR __freading (),
>  .BR __fwritable (),
> -.BR __fwriting ()
> -and
> +.br
> +.BR __fwriting (),
>  .BR _flushlbf ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH SEE ALSO
>  .BR flockfile (3),
>  .BR fpurge (3)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
