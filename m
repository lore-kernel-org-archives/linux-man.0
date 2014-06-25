From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getopt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 11:12:04 +0200
Message-ID: <53AA9264.9020200@gmail.com>
References: <1403677765-23418-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403677765-23418-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied (in my local branch).

Cheers,

Michael


On 06/25/2014 08:29 AM, Peng Haitao wrote:
> The functions getopt(), getopt_long() and getopt_long_only() are
> not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getopt.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/getopt.3 b/man3/getopt.3
> index 21b7dad..891cc64 100644
> --- a/man3/getopt.3
> +++ b/man3/getopt.3
> @@ -315,6 +315,20 @@ wildcard expansion and so should not be considered as options.
>  This behavior was removed in
>  .BR bash (1)
>  version 2.01, but the support remains in glibc.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getopt (),
> +.BR getopt_long (),
> +.BR getopt_long_only ()
> +T}	Thread safety	MT-Unsafe env
> +.TE
>  .SH CONFORMING TO
>  .TP
>  .BR getopt ():
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
