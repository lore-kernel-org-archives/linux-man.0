From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] tcp.7: Clarify tcp_tw_recycle on Internet-facing hosts
Date: Wed, 07 Jan 2015 08:49:12 +0100
Message-ID: <54ACE4F8.1000409@gmail.com>
References: <CALQAp37_DD-sy480u7QfC68GaaNK1yqb23vdEyNwJMK91PmD-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALQAp37_DD-sy480u7QfC68GaaNK1yqb23vdEyNwJMK91PmD-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Troy Davis <troy-EyOyorkO9KA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/23/2014 05:28 PM, Troy Davis wrote:
> Clarify that tcp_tw_recycle will break communication with many
> general-purpose remote Internet hosts (namely, remote NAT devices)
> even when the Linux device itself is not behind NAT.
> 
> Sources:
>   - BCP to make NAT implementors aware of this problem (2013):
> https://tools.ietf.org/html/draft-penno-behave-rfc4787-5382-5508-bis-04#section-3.1.2
>   - RFC 1323 (PAWS)
>   - RFC 6191: Reducing the TIME-WAIT State Using TCP Timestamps
>   - The many users who unknowingly enabled this option on devices
> communicating with the general-purpose Internet:
> https://www.google.com/search?q=tcp_tw_recycle%20ip%20nat%20timestamp
> 
> Patched against git HEAD as of this email
> (ac5ba355d52a5a29f2d26badc96e6da9e48c0097).
> 
> 
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index e6f5aee..06cc127 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -780,10 +780,11 @@ building larger TSO frames.
>  .TP
>  .IR tcp_tw_recycle " (Boolean; default: disabled; since Linux 2.4)"
>  .\" Since 2.3.15
> -Enable fast recycling of TIME_WAIT sockets.
> -Enabling this option is not
> -recommended since this causes problems when working
> -with NAT (Network Address Translation).
> +Enable fast recycling of TIME_WAIT sockets. Enabling this option is
> +not recommended for devices communicating with the general Internet
> +or using NAT (Network Address Translation). Since some NAT gateways
> +pass through IP timestamp values, one IP can appear to have
> +non-increasing timestamps. See RFC 1323 (PAWS), RFC 6191.
>  .\"
>  .\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
>  .TP

Hello Troy,

The patch is well described, so I'm just  going to take your word on all 
of the above. Applied.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
