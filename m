From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwnam(3): fix wrapped arg alignment
Date: Fri, 22 Aug 2014 17:53:46 -0500
Message-ID: <53F7C9FA.40601@gmail.com>
References: <1408696572-17488-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408696572-17488-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mike. Applied.

Cheers,

Michael


On 08/22/2014 03:36 AM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man3/getpwnam.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
> index 5b63f1e..50886e9 100644
> --- a/man3/getpwnam.3
> +++ b/man3/getpwnam.3
> @@ -48,11 +48,11 @@ getpwnam, getpwnam_r, getpwuid, getpwuid_r \- get password file entry
>  .sp
>  .BI "int getpwnam_r(const char *" name ", struct passwd *" pwd ,
>  .br
> -.BI "            char *" buf ", size_t " buflen ", struct passwd **" result );
> +.BI "               char *" buf ", size_t " buflen ", struct passwd **" result );
>  .sp
>  .BI "int getpwuid_r(uid_t " uid ", struct passwd *" pwd ,
>  .br
> -.BI "            char *" buf ", size_t " buflen ", struct passwd **" result );
> +.BI "               char *" buf ", size_t " buflen ", struct passwd **" result );
>  .fi
>  .sp
>  .in -4n
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
