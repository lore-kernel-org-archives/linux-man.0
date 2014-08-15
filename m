From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: Reformat thread-safety information
Date: Fri, 15 Aug 2014 20:32:24 +0200
Message-ID: <53EE5238.20804@gmail.com>
References: <1407142812-25389-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407142812-25389-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao, Applied.

Cheers,

Michael


On 08/04/2014 11:00 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strcpy.3 | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 94a7188..5b8e34c 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -114,12 +114,18 @@ functions return a pointer to
>  the destination string
>  .IR dest .
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> -.BR strcpy ()
> -and
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw19 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR strcpy (),
>  .BR strncpy ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
