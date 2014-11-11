From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cmsg.3: ensure buf is suitably aligned in sending example
Date: Tue, 11 Nov 2014 10:04:24 +0100
Message-ID: <5461D118.6080706@gmail.com>
References: <sa7fve1i4jw.fsf@wragg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <sa7fve1i4jw.fsf-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Wragg <david-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/03/2014 12:08 AM, David Wragg wrote:
> Inspection of the definition of CMSG_FIRSTHDR (both in glibc and the
> suggested definition in RFC3542) shows that it yields the msg_control
> field.  So when sending, the pointer placed in msg_control should be
> suitably aligned as a struct cmsghdr. In the sending example, buf was
> declared as a bare char array, and so is not necessarily suitably
> aligned.
> 
> The solution here involves placing buf inside a union, and is based on
> the sockets/scm_rights_send.c sample from The Linux Programming
> Interface "dist" source code collection.

Thanks, David. Applied.

Cheers,

Michael


> Signed-off-by: David Wragg <david-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
> ---
>  man3/cmsg.3 | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/cmsg.3 b/man3/cmsg.3
> index f355e6b..03f542e 100644
> --- a/man3/cmsg.3
> +++ b/man3/cmsg.3
> @@ -198,11 +198,16 @@ UNIX domain socket using
>  struct msghdr msg = {0};
>  struct cmsghdr *cmsg;
>  int myfds[NUM_FD]; /* Contains the file descriptors to pass. */
> -char buf[CMSG_SPACE(sizeof myfds)];  /* ancillary data buffer */
> +union {
> +    /* ancillary data buffer, wrapped in a union in order to ensure it is
> +       suitably aligned */
> +    char buf[CMSG_SPACE(sizeof myfds)];
> +    struct cmsghdr align;
> +} u;
>  int *fdptr;
>  
> -msg.msg_control = buf;
> -msg.msg_controllen = sizeof buf;
> +msg.msg_control = u.buf;
> +msg.msg_controllen = sizeof u.buf;
>  cmsg = CMSG_FIRSTHDR(&msg);
>  cmsg\->cmsg_level = SOL_SOCKET;
>  cmsg\->cmsg_type = SCM_RIGHTS;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
