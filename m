From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fanotify_mark.2: tfix
Date: Thu, 22 Jan 2015 20:48:38 +0100
Message-ID: <54C15416.2030706@gmail.com>
References: <CALhU9tn16qUxifE+=te3L7HUHYSzdnYRmJmk58--65cB2qSHVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tn16qUxifE+=te3L7HUHYSzdnYRmJmk58--65cB2qSHVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/21/2015 09:40 PM, Akihiro Motoki wrote:
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> index 32ecfd5..bab5d2c 100644
> --- a/man2/fanotify_mark.2
> +++ b/man2/fanotify_mark.2
> @@ -72,7 +72,7 @@ will occur.
>  .B FAN_MARK_FLUSH
>  Remove either all mount or all non-mount marks from the fanotify group.
>  If
> -.I flag
> +.I flags
>  contains
>  .BR FAN_MARK_MOUNT ,
>  all marks for mounts are removed from the group.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
