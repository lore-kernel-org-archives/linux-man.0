From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mount.2: revise description of MS_REMOUNT | MS_BIND
Date: Mon, 22 May 2017 13:43:01 +0200
Message-ID: <fe0b23c0-be8f-e12b-8aed-6af6f0edc802@gmail.com>
References: <87zie9jpy1.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87zie9jpy1.fsf-wvvUuzkyo1HefUI2i7LXDhCRmIWqnp/j@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/19/2017 08:55 AM, NeilBrown wrote:
> 
> MS_REMOUNT|MS_BIND affect all per-mount-point
> flag.  MS_READONLY is only special because it,
> uniquely, is both a per-mount-point flag *and* a
> per-filesystem flag.
> 
> So the sections of per-mount-point flags and
> MS_REMOUNT can usefully be clarified.
> 
> Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>

Thanks, Neil. Applied.

Cheers,

Michael

> ---
>  man2/mount.2 | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/man2/mount.2 b/man2/mount.2
> index 35fdda084d61..3e5348368757 100644
> --- a/man2/mount.2
> +++ b/man2/mount.2
> @@ -288,6 +288,12 @@ are also settable on a per-mount-point basis.
>  The
>  .B MS_RELATIME
>  flag is also settable on a per-mount-point basis.
> +Since Linux 2.6.16,
> +.B MS_RDONLY
> +can be set or cleared on a per-mount-point basis as well as on
> +the underlying filesystem.  The mounted filesystem will only be
> +writable if neither the filesystem nor the mountpoint are flagged as
> +read-only.
>  .\"
>  .SS Remounting an existing mount
>  An existing mount may be remounted by specifying
> @@ -317,6 +323,10 @@ and
>  arguments should match the values used in the original
>  .BR mount ()
>  call, except for those parameters that are being deliberately changed.
> +Another exception is that
> +.B MS_BIND
> +has a different meaning for remount, and it should only be included if
> +explicitly desired.
>  
>  The following
>  .I mountflags
> @@ -351,17 +361,20 @@ then the remount operation preserves the existing values of these flags
>  (rather than defaulting to
>  .BR MS_RELATIME ).
>  
> -Since Linux 2.6.26, this flag can also be used to make
> +Since Linux 2.6.26, this flag can be used with
> +.B MS_BIND
> +to only modify the per-mount-point flags.
>  .\" See https://lwn.net/Articles/281157/
> -an existing bind mount read-only by specifying
> +This is particularly useful for setting or clearing the "read-only"
> +flag on a mount point without changing the underlying filesystem.
> +Specifying
>  .IR mountflags
>  as:
>  
>      MS_REMOUNT | MS_BIND | MS_RDONLY
>  
> -Note that only the
> -.BR MS_RDONLY
> -setting of the bind mount can be changed in this manner.
> +will make access through this mountpoint read-only, without affecting
> +other mount points.
>  .\"
>  .SS Creating a bind mount
>  If
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
