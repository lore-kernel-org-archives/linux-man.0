From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtnetlink.7: Add info about ability to create links with
 given index
Date: Thu, 28 Feb 2013 15:14:34 +0100
Message-ID: <CAKgNAkiO_XNHz_LobZ2XUF89r4qjOS1BpzMu3CmUX47FEy9USw@mail.gmail.com>
References: <51226176.9020203@parallels.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51226176.9020203-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Feb 18, 2013 at 6:14 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> Since kernel v3.7 the RTM_NEWLINK message not accepts non-zero values
> in ifi_index field. Mention this fact in the respective rtneltlink.7
> section.
>
> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

Thanks Pavel. Applied.

Cheers,

Michael

> ---
>
> diff --git a/man7/rtnetlink.7 b/man7/rtnetlink.7
> index ebd9107..0809026 100644
> --- a/man7/rtnetlink.7
> +++ b/man7/rtnetlink.7
> @@ -78,7 +78,10 @@ struct ifinfomsg {
>  contains the device flags, see
>  .BR netdevice (7);
>  .I ifi_index
> -is the unique interface index,
> +is the unique interface index (since kernel v3.7 it is possible to feed a non-zero
> +value with the
> +.B RTM_NEWLINK
> +message, thus creating a link with the given ifindex);
>  .I ifi_change
>  is reserved for future use and should be always set to 0xFFFFFFFF.
>  .na



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
