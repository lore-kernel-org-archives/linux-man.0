From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] send.2: tfix
Date: Sun, 08 Jun 2014 21:16:30 +0200
Message-ID: <5394B68E.4040104@gmail.com>
References: <1402238251-6758-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402238251-6758-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael


On 06/08/2014 04:37 PM, Yuri Kozlov wrote:
> ---
>  man2/send.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/send.2 b/man2/send.2
> index c0ee0cf..8051198 100644
> --- a/man2/send.2
> +++ b/man2/send.2
> @@ -262,7 +262,7 @@ The
>  field is used on an unconnected socket to specify the target
>  address for a datagram.
>  It points to a buffer containing the address; the
> -.I msg_name
> +.I msg_namelen
>  field should be set to the size of the address.
>  For a connected socket, these fields should be specified as NULL and 0,
>  respectively.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
