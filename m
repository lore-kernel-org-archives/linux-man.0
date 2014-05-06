From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] open.2: wfix
Date: Tue, 06 May 2014 14:42:22 +0200
Message-ID: <5368D8AE.3070801@gmail.com>
References: <E1WheIv-0006U7-Ih@gen1a.internal.sanger.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1WheIv-0006U7-Ih-C7knxpdOu9iG/K1MMn+nwkOANFhmJ+9t9dF7HbQ/qKg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Marshall <jm18-5fLPn3lgkryFxr2TtlUqVg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, John. Applied.

Cheers,

Michael


On 05/06/2014 02:17 PM, John Marshall wrote:
> Signed-off-by: John Marshall <jm18-5fLPn3lgkryFxr2TtlUqVg@public.gmane.org>
> ---
>  man2/open.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index a9ff304..4a1344c 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -748,7 +748,7 @@ except for the differences described here.
>  If the pathname given in
>  .I pathname
>  is relative, then it is interpreted relative to the directory
> -relative to by the file descriptor
> +referred to by the file descriptor
>  .I dirfd
>  (rather than relative to the current working directory of
>  the calling process, as is done by
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
