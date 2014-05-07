From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: adjust description of the fanotify queue
Date: Wed, 07 May 2014 10:18:56 +0200
Message-ID: <5369EC70.1040009@gmail.com>
References: <53686BA4.6050505@gmail.com> <1399401666-24806-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399401666-24806-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/06/2014 08:41 PM, Heinrich Schuchardt wrote:
> In http://www.spinics.net/lists/linux-man/msg05624.html
> Jan Kara proposed to clarify the deletion of events from the fanotify queue
> and the occurence of ENOENT when writing to the fanotify file descriptor.

Thanks, Heinrich. I've applied and added a Reviewed-by: from Jan.

I've also pushed a few other fixes to the pages. I'd be happy if you could 
take a look at these commits in particular, to check I injected no errors:

3253bbc
a4cd12a

There are three other (larger) commits as well, but they are essentially 
wording and formatting fixes.

Cheers,

Michael

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 182d2d7..bce70ac 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -113,10 +113,11 @@ whether permission for a file access shall be granted.
>  For these events, the recipient must write a response which decides whether
>  access is granted or not.
>  
> -Queue entries for notification events are removed when the event has been
> +An event is removed from the event queue of the fanotify group when it has been
>  read.
> -Queue entries for permission events are removed when the permission
> -decision has been taken by writing to the fanotify file descriptor.
> +Permission events that have been read are kept in an internal list of the
> +fanotify group until either a permission decision has been taken by writing to
> +the fanotify file descriptor or the fanotify file descriptor is closed.
>  .SS Reading fanotify events
>  Calling
>  .BR read (2)
> @@ -400,8 +401,8 @@ in the response structure is not valid.
>  The file descriptor
>  .I fd
>  in the response structure is not valid.
> -This might occur because the file was already deleted by another thread or
> -process.
> +This may occur when a response for the permission event already has been
> +written before.
>  .SH VERSIONS
>  The fanotify API was introduced in version 2.6.36 of the Linux kernel and
>  enabled in version 2.6.37.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
