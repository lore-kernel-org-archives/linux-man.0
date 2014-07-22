From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getw.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 22 Jul 2014 07:12:39 +0200
Message-ID: <53CDF2C7.2060600@gmail.com>
References: <1405998052-25687-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405998052-25687-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my local branch.

Cheers,

Michael



On 07/22/2014 05:00 AM, Peng Haitao wrote:
> The functions getw() and putw() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getw.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getw.3 b/man3/getw.3
> index 7850de0..430343b 100644
> --- a/man3/getw.3
> +++ b/man3/getw.3
> @@ -77,6 +77,19 @@ returns the word read, and
>  .BR putw ()
>  returns 0.
>  On error, they return \fBEOF\fP.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw14 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getw (),
> +.BR putw ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  SVr4, SUSv2.
>  Not present in POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
