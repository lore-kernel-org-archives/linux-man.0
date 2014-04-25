From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fanotify: fanotify_mark: missing period in BUGS
Date: Fri, 25 Apr 2014 19:56:47 +0200
Message-ID: <535AA1DF.8090506@gmail.com>
References: <1398437088-6950-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398437088-6950-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/25/2014 04:44 PM, Heinrich Schuchardt wrote:
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Thanks, Heinrich. Applied.

(But see https://www.kernel.org/doc/man-pages/patches.html
for info on how to format the subject line. In this case it
should have been:

[PATCH] fanotify_mark.2: tfix

Cheers,,

Michael


> ---
>  man2/fanotify_mark.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> index ee6c909..693eff8 100644
> --- a/man2/fanotify_mark.2
> +++ b/man2/fanotify_mark.2
> @@ -307,7 +307,7 @@ contains
>  .I dfd
>  and
>  .I pathname
> -must indicate a filesystem object, even though this object is not used
> +must indicate a filesystem object, even though this object is not used.
>  .IP *
>  .\" FIXME: Patch is in next-20140424.
>  .BR readdir (2)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
