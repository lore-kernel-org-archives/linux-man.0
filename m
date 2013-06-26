From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): document /proc/[pid]/fd/ symlinks a bit more
Date: Thu, 27 Jun 2013 01:58:33 +0200
Message-ID: <51CB8029.2010706@gmail.com>
References: <1371230352-15529-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371230352-15529-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/14/13 19:19, Mike Frysinger wrote:
> This covers the type:[inode] syntax used in this dir.

Thanks, Mike. I've applied this, with some tweaks. See the 
version in Git.

Cheers,

Michael


> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/proc.5 | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 5ecdd87..05675b2 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -220,13 +220,24 @@ with the
>  .I \-inum
>  option can be used to locate the file.
>  .TP
> -.I /proc/[pid]/fd
> +.I /proc/[pid]/fd/
>  This is a subdirectory containing one entry for each file which the
>  process has open, named by its file descriptor, and which is a
>  symbolic link to the actual file.
>  Thus, 0 is standard input, 1 standard output, 2 standard error, etc.
>  
> -.\" The following was still true as at kernel 2.6.13
> +For fds open to non-files, they will be symlinks to the type with the inode.
> +A
> +.BR readlink (2)
> +call on this file returns a string in the format:
> +.br
> +    type:[inode]
> +.br
> +For example, socket:[2248868] will be a socket and its inode is 2248868.
> +For sockets, that inode can be used to find more info in one of the files under
> +.IR /proc/net/ .
> +
> +.\"The following was still true as at kernel 2.6.13
>  In a multithreaded process, the contents of this directory
>  are not available if the main thread has already terminated
>  (typically by calling
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
