From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open: Document O_TMPFILE
Date: Mon, 20 Jan 2014 13:52:05 +0100
Message-ID: <52DD1BF5.6080502@gmail.com>
References: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/07/2013 07:31 PM, Andy Lutomirski wrote:
> O_TMPFILE is new in Linux 3.11

Thanks, Andy. I've applied your patch. I also added the following
errors under ERRORS. Do they look okay to you?

       EINVAL O_TMPFILE  was  specified in flags, but neither O_WRONLY
              nor O_RDWR was specified.

       EISDIR O_TMPFILE  and  one of O_WRONLY or O_RDWR were specified
              in flags, but this kernel version does not  provide  the
              O_TMPFILE functionality.

Cheers,

Michael


> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
> ---
> 
> This may have formatting issues -- I'm terrible at groff.
> 
> If the corresponding linkat patch makes it in, it would probably be
> worth documenting as well:
> 
> https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git/commit/?h=for-linus&id=bb2314b47996491bbc5add73633905c3120b6268
> 
>  man2/open.2 | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index ef0f664..8bf56a0 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -126,6 +126,7 @@ are
>  .BR O_EXCL ,
>  .BR O_NOCTTY ,
>  .BR O_NOFOLLOW ,
> +.BR O_TMPFILE ,
>  .BR O_TRUNC ,
>  and
>  .BR O_TTY_INIT .
> @@ -226,11 +227,15 @@ described in
>  specifies the permissions to use in case a new file is created.
>  This argument must be supplied when
>  .B O_CREAT
> +or
> +.B O_TMPFILE
>  is specified in
>  .IR flags ;
> -if
> +if neither
>  .B O_CREAT
> -is not specified, then
> +nor
> +.B O_TMPFILE
> +is specified, then
>  .I mode
>  is ignored.
>  The effective permissions are modified by
> @@ -284,6 +289,29 @@ The following symbolic constants are provided for
>  00001 others have execute permission
>  .RE
>  .TP
> +.BR O_TMPFILE " (Since Linux 3.11)"
> +Create an unnamed temporary file.  The pathname parameter specifies a
> +directory; an unnamed inode will be created in that directory's
> +filesystem.  Anything written to the resulting file will be lost when
> +the last fd is closed, unless the file is given a name.
> +.RS
> +.PP
> +.B O_TMPFILE
> +must be specified with one of
> +.B O_RDWR
> +or
> +.B O_WRONLY
> +and, optionally,
> +.B O_EXCL.
> +If O_EXCL is not specified, then
> +.BR linkat (2)
> +can be used to link the temporary file into the filesystem, making it
> +permanent.
> +.PP
> +The mode parameter determines the inode's mode, as with
> +.B O_CREAT.
> +.RE
> +.TP
>  .BR O_DIRECT " (Since Linux 2.4.10)"
>  Try to minimize cache effects of the I/O to and from this file.
>  In general this will degrade performance, but it is useful in
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
