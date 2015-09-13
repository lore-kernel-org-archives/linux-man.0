From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] user_namespaces.7: drop spurious period
Date: Sun, 13 Sep 2015 09:53:03 +0200
Message-ID: <55F52B5F.4070208@gmail.com>
References: <1442080980-18130-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442080980-18130-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/12/2015 08:03 PM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Thanks, Mike. Applied.

Cheers,

Michael


> ---
>  man7/user_namespaces.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index 9e6ef49..56a73ec 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -700,7 +700,7 @@ in the user namespace),
>  it is no longer possible to disallow
>  .BR setgroups (2)
>  by writing
> -.RI \(dq deny \(dq.
> +.RI \(dq deny \(dq
>  to
>  .IR /proc/[pid]/setgroups
>  (the write fails with the error
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
