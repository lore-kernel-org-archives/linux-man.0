From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-pages] tcp.7: tcp_abc was removed in 3.9
Date: Wed, 3 May 2017 06:45:41 +0200
Message-ID: <85266ab8-7738-de94-b138-c3f68f87ad21@gmail.com>
References: <20170503012538.11867-1-chema@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170503012538.11867-1-chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chema Gonzalez <chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chemag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/03/2017 03:25 AM, Chema Gonzalez wrote:
> From: Chema Gonzalez <chemag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, Chema. Applied.

Cheers,

Michael


> 
> Signed-off-by: Chema Gonzalez <chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man7/tcp.7 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index fe3a30710..38e0d022e 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -257,7 +257,9 @@ take an integer value, with a nonzero value ("true") meaning that
>  the corresponding option is enabled, and a zero value ("false")
>  meaning that the option is disabled.
>  .TP
> -.IR tcp_abc " (Integer; default: 0; since Linux 2.6.15)"
> +.IR tcp_abc " (Integer; default: 0; Linux 2.6.15 to Linux 3.8)"
> +.\" Since 2.6.15; removed in 3.8
> +.\" commit ca2eb5679f8ddffff60156af42595df44a315ef0
>  .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
>  Control the Appropriate Byte Count (ABC), defined in RFC 3465.
>  ABC is a way of increasing the congestion window
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
