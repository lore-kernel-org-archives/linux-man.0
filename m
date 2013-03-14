From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] netlink.7: add a note about broadcast messages to
 multiple groups
Date: Thu, 14 Mar 2013 10:41:27 +0100
Message-ID: <CAKgNAkhpzfq2A+-0QcYZr26Mx_A+pQ6yMcTT3Mc7z-Q8fJpEGw@mail.gmail.com>
References: <1363169621-3929-1-git-send-email-avagin@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363169621-3929-1-git-send-email-avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Andrey. Applied.

On Wed, Mar 13, 2013 at 11:13 AM, Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
>
> Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man7/netlink.7 | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/man7/netlink.7 b/man7/netlink.7
> index de955e4..7c235d8 100644
> --- a/man7/netlink.7
> +++ b/man7/netlink.7
> @@ -346,6 +346,8 @@ or does a
>  Only processes with an effective UID of 0 or the
>  .B CAP_NET_ADMIN
>  capability may send or listen to a netlink multicast group.
> +.\" d629b836d151d43332492651dd841d32e57ebe3b
> +Since Linux 2.6.13 messages can't be broadcasted to multiple groups.
>  Any replies to a message received for a multicast group should be
>  sent back to the sending PID and the multicast group.
>  Some Linux kernel subsystems may additionally allow other users
> --
> 1.7.11.7
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
