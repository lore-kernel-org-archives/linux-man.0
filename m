From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inet.3: ATTRIBUTES: Note functions that are thread safe
 with exceptions
Date: Mon, 28 Jul 2014 12:24:51 +0200
Message-ID: <53D624F3.2060907@gmail.com>
References: <1406529347-29019-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406529347-29019-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Thanks. Applied (in my local branch).

Cheers,

Michael



On 07/28/2014 08:35 AM, Peng Haitao wrote:
> The functions inet_aton() and inet_addr() are thread safe with
> exceptions.
> The functions inet_network(), inet_ntoa(), inet_makeaddr(),
> inet_lnaof() and inet_netof() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/inet.3 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/man3/inet.3 b/man3/inet.3
> index bf2cd28..6e4663c 100644
> --- a/man3/inet.3
> +++ b/man3/inet.3
> @@ -215,6 +215,28 @@ struct in_addr {
>  };
>  .fi
>  .in
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw30 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR inet_aton (),
> +.BR inet_addr ()
> +T}	Thread safety	MT-Safe locale
> +T{
> +.BR inet_network (),
> +.BR inet_ntoa (),
> +.br
> +.BR inet_makeaddr (),
> +.BR inet_lnaof (),
> +.br
> +.BR inet_netof ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  4.3BSD.
>  .BR inet_addr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
