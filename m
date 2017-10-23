From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ipv6.7: tfix
Date: Mon, 23 Oct 2017 06:43:44 +0200
Message-ID: <a1b679ce-69b2-29fa-de13-cf8d2500ca33@gmail.com>
References: <20171022100650.az4as6es7s5oqh7y@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022100650.az4as6es7s5oqh7y-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Branden. Applied.

Cheers,

Michael




On 10/22/2017 12:06 PM, G. Branden Robinson wrote:
> Use correct indefinite article before noun beginning with vowel sound.
> 
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index 4fb274f76..2f502923a 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -137,7 +137,7 @@ handling functions in the C library.
>   .PP
>   IPv4 and IPv6 share the local port space.
>   When you get an IPv4 connection
> -or packet to a IPv6 socket, its source address will be mapped
> +or packet to an IPv6 socket, its source address will be mapped
>   to v6 and it will be mapped to v6.
>   .SS Address format
>   .in +4n
> @@ -180,7 +180,7 @@ IPv6 supports several address types: unicast to address a single
>   host, multicast to address a group of hosts,
>   anycast to address the nearest member of a group of hosts
>   (not implemented in Linux), IPv4-on-IPv6 to
> -address a IPv4 host, and other reserved address types.
> +address an IPv4 host, and other reserved address types.
>   .PP
>   The address notation for IPv6 is a group of 8 4-digit hexadecimal
>   numbers, separated with a \(aq:\(aq.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
