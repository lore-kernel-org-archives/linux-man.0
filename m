From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] catopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 22 Jul 2014 07:11:04 +0200
Message-ID: <53CDF268.1080005@gmail.com>
References: <1405913791-16629-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405913791-16629-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my local branch.

Cheers,

Michael

On 07/21/2014 05:36 AM, Peng Haitao wrote:
> The functions catopen() and catclose() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/catopen.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/catopen.3 b/man3/catopen.3
> index 0d8d33b..b582a4a 100644
> --- a/man3/catopen.3
> +++ b/man3/catopen.3
> @@ -143,6 +143,21 @@ is set to
>  The language to use if
>  .I flag
>  is 0.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR catopen ()
> +T}	Thread safety	MT-Safe env
> +T{
> +.BR catclose ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .\" In XPG 1987, Vol. 3 it says:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
