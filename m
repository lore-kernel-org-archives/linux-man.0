From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpnam.3: Reformat thread-safety information
Date: Tue, 15 Jul 2014 07:15:32 +0200
Message-ID: <53C4B8F4.3000503@gmail.com>
References: <1405327011-10439-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405327011-10439-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Best regards,

Michael

On 07/14/2014 10:36 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tmpnam.3 | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
> index 869ca3c..0371d79 100644
> --- a/man3/tmpnam.3
> +++ b/man3/tmpnam.3
> @@ -84,15 +84,20 @@ filename, or NULL if a unique name cannot be generated.
>  .SH ERRORS
>  No errors are defined.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR tmpnam ()
> -function is thread-safe with exceptions.
> -It is not thread-safe if called with a NULL parameter.
> -.LP
> -The
> +T}	Thread safety	MT-Safe /!s
> +T{
>  .BR tmpnam_r ()
> -function is thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
>  POSIX.1-2008 marks
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
