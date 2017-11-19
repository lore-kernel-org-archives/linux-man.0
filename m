From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] user_namespaces.7: Record new 340 line idmap limit
Date: Sun, 19 Nov 2017 10:00:39 +0100
Message-ID: <0b3acf79-dd24-5845-b4f4-6d2f9222a5a6@gmail.com>
References: <20171119012505.1925-1-christian.brauner@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171119012505.1925-1-christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org, ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Christian,


On 11/19/2017 02:25 AM, Christian Brauner wrote:
> This patch documents the following commit:
> 
> commit 6397fac4915ab3002dc15aae751455da1a852f25
> Author: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Oct 25 00:04:41 2017 +0200
> 
>     userns: bump idmap limits to 340
> 
> Since Linux 4.15 the number of idmap lines has been bumped to 340.
> The patch also removes the "(arbitrary)" in "There is an (arbitrary) limit on
> the number of lines in the file." since the 340 line limit is well-explained by
> the current implementation. The struct recording the idmaps is 12 bytes and
> quite some proc files only allow writes the size of a single page size which is
> 4096kB. This leaves room for 340 idmappings (340 * 12 = 4080 bytes).
> The struct layout itself has been chosen very carefully to allow for an
> implementation that limits the time-complexity for the idmap codepaths to
> O(log n). However, I think it's unnecessary to expose this much implementation
> detail to users in the man page. So only mention this in the commit message.
> Furthermore, the comment about the page size restriction is misleading. The
> kernel sources show that >= page size is considered an error.

Thanks for the patch and the detailed commit message.
I've applied the patch, but restored the historical details,
since users need also to now about older kernel behavior.

Cheers,

Michael

> Signed-off-by: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> ---
>  man7/user_namespaces.7 | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index 11ca41162..5968c09cc 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -510,13 +510,10 @@ and the last field must be greater than 0.
>  .IP *
>  Lines are terminated by newline characters.
>  .IP *
> -There is an (arbitrary) limit on the number of lines in the file.
> -As at Linux 3.18, the limit is five lines.
> +There is a limit on the number of lines in the file.
> +As of Linux 4.15, the limit is 340 lines.
>  In addition, the number of bytes written to
>  the file must be less than the system page size,
> -.\" FIXME(Eric): the restriction "less than" rather than "less than or equal"
> -.\" seems strangely arbitrary. Furthermore, the comment does not agree
> -.\" with the code in kernel/user_namespace.c. Which is correct?
>  and the write must be performed at the start of the file (i.e.,
>  .BR lseek (2)
>  and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
