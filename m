From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] umask.2, open.2, mknod.2, mkdir.2: Explain what default
 acls do
Date: Tue, 21 Apr 2015 14:39:43 +0200
Message-ID: <5536450F.3050806@gmail.com>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher@gmail.com> <3fa52386efe0d027409e803629c6b751e0b7b602.1428946673.git.andreas.gruenbacher@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fa52386efe0d027409e803629c6b751e0b7b602.1428946673.git.andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Gruenbacher <andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andreas,

I applied, but fixed a little, including one important detail below.

On 04/13/2015 07:38 PM, Andreas Gruenbacher wrote:
> Explain the effect that default acls have (instead of the umask) in umask.2.
> Mention that default acls can have an affect in open.2, mknod.2, and mkdir.2.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/mkdir.2 |  5 ++---
>  man2/mknod.2 |  5 +++--
>  man2/open.2  |  3 ++-
>  man2/umask.2 | 11 +++++++++++
>  4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/mkdir.2 b/man2/mkdir.2
> index 41fad55..42fc26b 100644
> --- a/man2/mkdir.2
> +++ b/man2/mkdir.2
> @@ -54,7 +54,8 @@ The argument
>  specifies the permissions to use.
>  It is modified by the process's
>  .I umask
> -in the usual way: the permissions of the created directory are
> +in the usual way: in the absence of a default acl, the permissions of the
> +created directory are
>  .RI ( mode " & ~" umask " & 0777)."
>  Other mode bits of the created directory depend on the operating system.
>  For Linux, see below.
> @@ -212,8 +213,6 @@ POSIX.1-2008.
>  Under Linux, apart from the permission bits, only the
>  .B S_ISVTX
>  mode bit is honored.
> -That is, under Linux the created directory actually gets mode
> -.RI ( mode " & ~" umask " & 01777)."

You dropped a "1" from the expression here. I restored it.

Thanks for the patch!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
