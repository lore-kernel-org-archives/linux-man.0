From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtrace.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 11:11:13 +0200
Message-ID: <53AA9231.9000303@gmail.com>
References: <1403674014-18733-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403674014-18733-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied (in my local branch).

Cheers,

Michael


On 06/25/2014 07:26 AM, Peng Haitao wrote:
> The functions mtrace() and muntrace() are not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mtrace.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/mtrace.3 b/man3/mtrace.3
> index ef93fcd..eb2e581 100644
> --- a/man3/mtrace.3
> +++ b/man3/mtrace.3
> @@ -75,6 +75,19 @@ In set-user-ID and set-group-ID programs,
>  is ignored, and
>  .BR mtrace ()
>  has no effect.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw20 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR mtrace (),
> +.BR muntrace ()
> +T}	Thread safety	MT-Unsafe
> +.TE
>  .SH CONFORMING TO
>  These functions are GNU extensions.
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
