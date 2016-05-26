From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fnctl.2: tfix - remove duplicate paragraph in NOTES
Date: Thu, 26 May 2016 16:16:54 -0500
Message-ID: <1d5e1606-67ec-1092-92ec-4129add41596@gmail.com>
References: <20160523095427.GA23850@hq.k1024.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160523095427.GA23850-lfa4byCdxoxg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Iustin Pop <iustin-JC6qDa14zzLYtjvyW6yDsg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/23/2016 04:54 AM, Iustin Pop wrote:
> This paragraph already appears above, right before the "File Locking"
> one.

Thanks, Iustin. Applied.

Cheers,

Michael


> Signed-off-by: Iustin Pop <iustin-JC6qDa14zzLYtjvyW6yDsg@public.gmane.org>
> ---
>  man2/fcntl.2 | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index d7c6ccf..a28812b 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -1758,10 +1758,6 @@ However, these details can be ignored by applications using glibc, whose
>  wrapper function transparently employs the more recent system call
>  where it is available.
>  
> -The errors returned by
> -.BR dup2 (2)
> -are different from those returned by
> -.BR F_DUPFD .
>  .SS Record locks
>  Since kernel 2.0, there is no interaction between the types of lock
>  placed by
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
