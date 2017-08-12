From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Sat, 12 Aug 2017 22:11:56 +0200
Message-ID: <962508f3-52da-f5d7-06db-b60d99113398@gmail.com>
References: <873790rtni.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <873790rtni.fsf-wvvUuzkyo1HefUI2i7LXDhCRmIWqnp/j@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/10/2017 05:25 AM, NeilBrown wrote:
> 
> - fstatfs is now permitted.
> - ioctl isn't, and is worth listing explicitly
> - O_PATH allows an automount point to be opened with
>   triggering the mount.
> 
> All tested

Thanks, Neil. Patch applied.

Cheers,

Michael


> Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
> ---
>  man2/open.2 | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index e3b00939790c..38d532397b02 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -585,6 +585,7 @@ The file itself is not opened, and other file operations (e.g.,
>  .BR fchmod (2),
>  .BR fchown (2),
>  .BR fgetxattr (2),
> +.BR ioctl (2),
>  .BR mmap (2))
>  fail with the error
>  .BR EBADF .
> @@ -599,8 +600,11 @@ be performed on the resulting file descriptor:
>  (since Linux 3.5);
>  .\" commit 332a2e1244bd08b9e3ecd378028513396a004a24
>  .BR fstat (2)
> -(since Linux 3.6).
> +(since Linux 3.6);
>  .\" fstat(): commit 55815f70147dcfa3ead5738fd56d3574e2e3c1c2
> +.BR fstatfs (2)
> +(since Linux 3.12).
> +.\" fstatfs(): commit 9d05746e7b16d8565dddbe3200faa1e669d23bbf
>  .IP *
>  Duplicating the file descriptor
>  .RB ( dup (2),
> @@ -666,6 +670,16 @@ argument in calls to
>  and
>  .BR readlinkat (2)
>  with an empty pathname to have the calls operate on the symbolic link.
> +
> +If
> +.I pathname
> +refers to an automount point that has not yet been triggered, so no
> +other filesystem is mounted on it, then the call returns a file
> +descriptor referring to the automount directory without triggering a mount.
> +.BR fstatfs (2)
> +can then be used to determine if it is, in fact, an untriggered
> +automount point
> +.RB ( ".f_type == AUTOFS_SUPER_MAGIC" ).
>  .TP
>  .B O_SYNC
>  Write operations on the file will complete according to the requirements of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
