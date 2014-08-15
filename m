From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timegm.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Fri, 15 Aug 2014 20:28:15 +0200
Message-ID: <53EE513F.6070800@gmail.com>
References: <1407226743-29634-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407226743-29634-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied (in my local branch).

Cheers,

Michael


On 08/05/2014 10:19 AM, Peng Haitao wrote:
> The functions timelocal() and timegm() are thread safe with
> exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/timegm.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/timegm.3 b/man3/timegm.3
> index e2b74fd..07bbb7a 100644
> --- a/man3/timegm.3
> +++ b/man3/timegm.3
> @@ -51,6 +51,19 @@ are the inverses of
>  .BR localtime (3)
>  and
>  .BR gmtime (3).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw21 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR timelocal (),
> +.BR timegm ()
> +T}	Thread safety	MT-Safe env locale
> +.TE
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions
>  that are also present on the BSDs.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
