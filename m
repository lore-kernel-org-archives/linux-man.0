From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syslog.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Thu, 10 Jul 2014 12:27:34 +0200
Message-ID: <53BE6A96.3050201@gmail.com>
References: <1404898196-3437-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404898196-3437-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my local branch.

Cheers,

Michael


On 07/09/2014 11:29 AM, Peng Haitao wrote:
> The functions openlog() and closelog() are thread safe.
> The functions syslog() and vsyslog() are thread safe with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/syslog.3 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/man3/syslog.3 b/man3/syslog.3
> index 4c77ab4..94b870b 100644
> --- a/man3/syslog.3
> +++ b/man3/syslog.3
> @@ -249,6 +249,23 @@ debug-level message
>  The function
>  .BR setlogmask (3)
>  can be used to restrict logging to specified levels only.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw21 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR openlog (),
> +.BR closelog ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR syslog (),
> +.BR vsyslog ()
> +T}	Thread safety	MT-Safe env locale
> +.TE
>  .SH CONFORMING TO
>  The functions
>  .BR openlog (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
