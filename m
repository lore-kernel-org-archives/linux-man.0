From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] user_namespaces(7): typo fixes
Date: Tue, 30 Dec 2014 22:16:08 +0100
Message-ID: <54A31618.30901@gmail.com>
References: <1415169094-28799-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415169094-28799-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mike. Applied.

Cheers,

Michael


On 11/05/2014 07:31 AM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man7/user_namespaces.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index d76721d..cadfa7a 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -34,7 +34,7 @@ For an overview of namespaces, see
>  User namespaces isolate security-related identifiers and attributes,
>  in particular,
>  user IDs and group IDs (see
> -.BR credentials (7),
> +.BR credentials (7)),
>  the root directory,
>  keys (see
>  .BR keyctl (2)),
> @@ -572,7 +572,7 @@ in
>  
>  The cases where unmapped IDs are mapped in this fashion include
>  system calls that return user IDs
> -.RB ( getuid (2)
> +.RB ( getuid (2),
>  .BR getgid (2),
>  and similar),
>  credentials passed over a UNIX domain socket,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
