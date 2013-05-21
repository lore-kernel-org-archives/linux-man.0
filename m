From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdio_ext.3: ATTRIBUTES: Note functions that are not
 thread-safe
Date: Tue, 21 May 2013 13:19:48 +0200
Message-ID: <519B5854.7040709@gmail.com>
References: <1369028530-12542-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369028530-12542-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/13 07:42, Peng Haitao wrote:
> The functions __fbufsize(), __fpending(), __fpurge() and
> __fsetlocking() are not thread safe.

Thanks, Peng. Applied in my local branch for this work.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stdio_ext.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
> index fb5767a..d2578fe 100644
> --- a/man3/stdio_ext.3
> +++ b/man3/stdio_ext.3
> @@ -129,6 +129,25 @@ output to a terminal is forced out, say before reading keyboard input.)
>  The
>  .BR __fpurge ()
>  function discards the contents of the stream's buffer.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR __fbufsize (),
> +.BR __fpending (),
> +.BR __fpurge ()
> +and
> +.BR __fsetlocking ()
> +functions do not lock the stream, so they are not thread-safe.
> +.LP
> +The
> +.BR __flbf (),
> +.BR __freadable (),
> +.BR __freading (),
> +.BR __fwritable (),
> +.BR __fwriting ()
> +and
> +.BR _flushlbf ()
> +functions are thread-safe.
>  .SH SEE ALSO
>  .BR flockfile (3),
>  .BR fpurge (3)
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
