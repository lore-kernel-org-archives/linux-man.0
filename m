From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [manpages PATCH] open_by_handle_at.2: clarify MAX_HANDLE_SZ
Date: Fri, 24 Nov 2017 09:34:51 +0100
Message-ID: <CAKgNAkh+oDszm=_P5qFsU3azE6qRczc6o6jjCHzaQSwPvsXkYg@mail.gmail.com>
References: <87wp2j1ggu.fsf@notabene.neil.brown.name> <52c5800b-150a-7ec9-133b-6c32e97249f4@gmail.com>
 <873754zh4v.fsf@notabene.neil.brown.name>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <873754zh4v.fsf-wvvUuzkyo1HefUI2i7LXDhCRmIWqnp/j@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Neil,

On 24 November 2017 at 00:53, NeilBrown <neilb-IBi9RG/b67k@public.gmane.org> wrote:
>
> As hinted in the kernel source, MAX_HANDLE_SZ is a hint
> rather than a promise:
>
>     /* limit the handle size to NFSv4 handle size now */
>     #define MAX_HANDLE_SZ 128
>
> Note the "now" (probably should be "for now").
> So change the description to make this clear.

Thanks! Applied.

Cheers,

Michael


> Reported-by: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
> Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
> ---
>  man2/open_by_handle_at.2 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
> index 79987308bf3e..f3473d24fa50 100644
> --- a/man2/open_by_handle_at.2
> +++ b/man2/open_by_handle_at.2
> @@ -91,7 +91,8 @@ field should be initialized to contain the allocated size for
>  .BR MAX_HANDLE_SZ ,
>  defined in
>  .IR <fcntl.h> ,
> -specifies the maximum possible size for a file handle.)
> +specifies the maximum expected size for a file handle. It is not a
> +guaranteed upper limit as future filesystems may require more space.)
>  Upon successful return, the
>  .IR handle_bytes
>  field is updated to contain the number of bytes actually written to
> --
> 2.14.0.rc0.dirty
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
