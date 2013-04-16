From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: Adding IP_MULTICAST_ALL Option
Date: Tue, 16 Apr 2013 08:01:52 +0200
Message-ID: <CAKgNAkhKUOBYG3eev=Oqy+vfA=gjnf7Z=Yk6GBHixmnk+oeUeg@mail.gmail.com>
References: <1363797611-20016-1-git-send-email-rpazdera@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363797611-20016-1-git-send-email-rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Radek,

On Wed, Mar 20, 2013 at 5:40 PM, Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> This commit adds documentation for the IP_MULTICAST_ALL socket option.
>
> The option was added to the Linux kernel in 2.6.31:
>
>     Author Nivedita Singhvi <niv-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>     Commit f771bef98004d9d141b085d987a77d06669d4f4f
>
> The description is based on a previous one [3] posted by the original
> author of the code -- Nivedita, but it is slightly re-worded.
>
> I tested it myself and it works as described.
>
> References:
>     [1] http://lxr.free-electrons.com/source/net/ipv4/ip_sockglue.c#L972
>     [2] http://lxr.free-electrons.com/source/net/ipv4/igmp.c#L2267
>     [3] http://patchwork.ozlabs.org/patch/28902/
>
> Signed-off-by: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks for the detailed commit message! Applied.

Cheers,

Michael


> ---
>  man7/ip.7 |   14 +++++++++++---
>  1 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/man7/ip.7 b/man7/ip.7
> index 9bef3bf..cc8eea6 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -29,9 +29,6 @@
>  .\"    MCAST_JOIN_SOURCE_GROUP (2.4.22 / 2.6)
>  .\"    MCAST_LEAVE_SOURCE_GROUP (2.4.22 / 2.6)
>  .\"    MCAST_MSFILTER (2.4.22 / 2.6)
> -.\"    IP_MULTICAST_ALL (2.6.31)
> -.\"        commit f771bef98004d9d141b085d987a77d06669d4f4f
> -.\"        Author: Nivedita Singhvi <niv-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>  .\"    IP_UNICAST_IF (3.4)
>  .\"        commit 76e21053b5bf33a07c76f99d27a74238310e3c71
>  .\"        Author: Erich E. Hoover <ehoover-/qOHPfZA4H6HXe+LvDLADg@public.gmane.org>
> @@ -525,6 +522,17 @@ This is also particularly useful for diagnostic tools such as
>  that wish to deliberately send probe packets larger than
>  the observed Path MTU.
>  .TP
> +.BR IP_MULTICAST_ALL " (since Linux 2.6.31)"
> +This option can be used to modify the delivery policy of multicast messages
> +to sockets bound to the wildcard
> +.B INADDR_ANY
> +address. The argument is a boolean integer (defaults to 1). If set to 1,
> +the socket will receive messages from all the groups that have been joined
> +globally on the whole system. Otherwise, it will deliver only messages from
> +the groups that have been explicitly joined (for example via the
> +.B IP_ADD_MEMBERSHIP
> +option) on this particular socket.
> +.TP
>  .BR IP_MULTICAST_IF " (since Linux 1.2)"
>  Set the local device for a multicast socket.
>  Argument is an
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
