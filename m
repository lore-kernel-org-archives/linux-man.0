From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: refer to correct functions in description of
 O_TMPFILE
Date: Thu, 26 May 2016 16:17:43 -0500
Message-ID: <d4f8fd70-1134-56c0-882b-47b715b98453@gmail.com>
References: <1463871615-1982-1-git-send-email-ebiggers3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463871615-1982-1-git-send-email-ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Eric. Applied.

Cheers,

Michael



On 05/21/2016 06:00 PM, Eric Biggers wrote:
> Signed-off-by: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/open.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index 012d0c4..6403776 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -726,8 +726,8 @@ functionality: race-free creation of temporary files that
>  .IP *
>  Creating a file that is initially invisible, which is then populated
>  with data and adjusted to have appropriate filesystem attributes
> -.RB ( chown (2),
> -.BR chmod (2),
> +.RB ( fchown (2),
> +.BR fchmod (2),
>  .BR fsetxattr (2),
>  etc.)
>  before being atomically linked into the filesystem
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
