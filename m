From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ttyslot.3: Reformat thread-safety information
Date: Tue, 15 Jul 2014 07:13:32 +0200
Message-ID: <53C4B87C.8050004@gmail.com>
References: <1405318860-32653-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405318860-32653-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Best regards,

Michael

On 07/14/2014 08:21 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ttyslot.3 | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/man3/ttyslot.3 b/man3/ttyslot.3
> index 918ac14..e0d78f5 100644
> --- a/man3/ttyslot.3
> +++ b/man3/ttyslot.3
> @@ -121,12 +121,17 @@ associated with a terminal that occurs in this data base)
>  it returns 0 on UNIX\ V6 and V7 and BSD-like systems,
>  but \-1 on System V-like systems.
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
>  .BR ttyslot ()
> -function calls thread-unsafe function
> -.BR getttyent (),
> -so it is not thread-safe.
> +T}	Thread safety	MT-Unsafe
> +.TE
>  .SH CONFORMING TO
>  SUSv1; marked as LEGACY in SUSv2; removed in POSIX.1-2001.
>  SUSv2 requires \-1 on error.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
