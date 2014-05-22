From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: fanotify_read should use aligned buffer
Date: Thu, 22 May 2014 08:52:30 +0200
Message-ID: <537D9EAE.4040800@gmail.com>
References: <1400703376-17347-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400703376-17347-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/21/2014 10:16 PM, Heinrich Schuchardt wrote:
> Michael Kerrisk pointed me to alignment issues which may
> arise when reading misaligned integers.
> 
> On some systems integer values can only be read if they are
> correctly aligned. Other system have a lower performance when
> reading from or writing to misaligned memory positions.
> 
> Therefore, the buffer used to call read(2) for a fanotify
> file descriptor should have the same alignment as
> struct fanotify_event_metadata.
> 
> Due to the casting to char* inside the macros
> FAN_EVENT_OK and FAN_EVENT_NEXT we can use any
> data structure for the buffer.
> 
> With the patch an array of struct fanotify_event_metadata is
> used as buffer which seems a natural choice to ensure proper
> alignment.
> 
> It should be remembered that the offset between events is given
> by field event_len and iterating over the array may not be
> allowable in future. Instead the macros should be used.

Applied. Thanks for the excellent commit message, Heinrich.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index b3225dd..c62fc12 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -556,7 +556,7 @@ static void
>  handle_events(int fd)
>  {
>      const struct fanotify_event_metadata *metadata;
> -    char buf[4096];
> +    struct fanotify_event_metadata buf[200];
>      ssize_t len;
>      char path[PATH_MAX];
>      ssize_t path_len;
> @@ -582,7 +582,7 @@ handle_events(int fd)
>  
>          /* Point to the first event in the buffer */
>  
> -        metadata = (struct fanotify_event_metadata *) buf;
> +        metadata = buf;
>  
>          /* Loop over all events in the buffer */
>  
> @@ -612,7 +612,7 @@ handle_events(int fd)
>                      response.fd = metadata\->fd;
>                      response.response = FAN_ALLOW;
>                      write(fd, &response,
> -                            sizeof(struct fanotify_response));
> +                          sizeof(struct fanotify_response));
>                  }
>  
>                  /* Handle closing of writable file event */
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
