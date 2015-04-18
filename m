From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] icmp.7: Document net.ipv4.ping_group_range knob.
Date: Sat, 18 Apr 2015 23:10:13 +0200
Message-ID: <5532C835.2070604@gmail.com>
References: <552F9CEA.7010209@miraclelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552F9CEA.7010209-GmhWrQMWH5w7YuNMryXyOw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-2022-JP?B?WU9TSElGVUpJIEhpZGVha2kvGyRCNUhGIzFRTEAbKEI=?= <hideaki.yoshifuji-GmhWrQMWH5w7YuNMryXyOw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "YOSHIFUJI Hideaki (USAGI Project)" <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/16/2015 01:28 PM, YOSHIFUJI Hideaki/吉藤英明 wrote:
> Signed-off-by: YOSHIFUJI Hideaki <hideaki.yoshifuji-GmhWrQMWH5w7YuNMryXyOw@public.gmane.org>

Thank you, Hideaki. Applied.

Cheers,

Michael

> ---
>  man7/icmp.7 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man7/icmp.7 b/man7/icmp.7
> index ea86cb4..2f9d370 100644
> --- a/man7/icmp.7
> +++ b/man7/icmp.7
> @@ -158,6 +158,11 @@ Maximum rate for sending
>  packets.
>  These packets are
>  sent to prevent loops when a packet has crossed too many hops.
> +.TP
> +.IR ping_group_range " (two integers; default: see below; since Linux 2.6.39)"
> +Range of group IDs (minimum and maximum group IDs, inclusive)
> +allowed to create ICMP Echo sockets.  Default is "1 0", which
> +means no group is allowed to create ICMP Echo sockets.
>  .SH VERSIONS
>  Support for the
>  .B ICMP_ADDRESS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
