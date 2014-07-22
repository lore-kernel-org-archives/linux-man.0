From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getcwd.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 22 Jul 2014 07:11:39 +0200
Message-ID: <53CDF28B.50706@gmail.com>
References: <1405933029-894-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405933029-894-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my local branch.

Cheers,

Michael



On 07/21/2014 10:57 AM, Peng Haitao wrote:
> The functions getcwd(), getwd() and get_current_dir_name() are
> thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getcwd.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/getcwd.3 b/man3/getcwd.3
> index d351938..f4762f2 100644
> --- a/man3/getcwd.3
> +++ b/man3/getcwd.3
> @@ -205,6 +205,22 @@ The
>  argument is less than the length of the absolute pathname of the
>  working directory, including the terminating null byte.
>  You need to allocate a bigger array and try again.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw22 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getcwd (),
> +.BR getwd ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR get_current_dir_name ()
> +T}	Thread safety	MT-Safe env
> +.TE
>  .SH CONFORMING TO
>  .BR getcwd ()
>  conforms to POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
