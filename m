From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for ipv6.7
Date: Fri, 17 Jan 2014 21:45:05 +1300
Message-ID: <52D8ED91.7080302@gmail.com>
References: <20140116202239.2c4fba19@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140116202239.2c4fba19-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/17/2014 05:22 AM, Yuri Kozlov wrote:
> Hello.

Applied. Thanks, Yuri.

Cheers,

Michael


> --- man-pages-git/man7/ipv6.7   2013-06-06 21:38:12.077409548 +0400
> +++ /tmp/ipv6.7 2014-01-16 20:20:04.276184187 +0400
> @@ -313,7 +313,9 @@
>  .B IPV6_ROUTER_ALERT
>  Pass forwarded packets containing a router alert hop-by-hop option to
>  this socket.
> -Only allowed for SOCK_RAW sockets.
> +Only allowed for
> +.B SOCK_RAW
> +sockets.
>  The tapped packets are not forwarded by the kernel, it is the
>  user's responsibility to send them out again.
>  Argument is a pointer to an integer.
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
