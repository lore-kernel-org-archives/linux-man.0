From: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes -- version 2
Date: Fri, 16 May 2008 18:59:10 +0200
Message-ID: <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu>
References: <482D4665.4050401@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <482D4665.4050401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (message from Michael Kerrisk on
	Fri, 16 May 2008 10:31:33 +0200)
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Cc: miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> This is a revised version of my earlier
> (http://article.gmane.org/gmane.linux.man/129/ ) patch to fix
> non-conformances in the utimensat() implementation.

The patch looks functionally correct.  But there are several things I
don't really like...

> --- linux-2.6.26-rc2/fs/utimes.c	2008-05-15 10:33:20.000000000 +0200
> +++ linux-2.6.26-rc2-mtk/fs/utimes.c	2008-05-16 07:33:02.000000000 +0200
> @@ -40,14 +40,9 @@
> 
>  #endif
> 
> -static bool nsec_special(long nsec)
> -{
> -	return nsec == UTIME_OMIT || nsec == UTIME_NOW;
> -}
> -
>  static bool nsec_valid(long nsec)
>  {
> -	if (nsec_special(nsec))
> +	if (nsec == UTIME_OMIT || nsec == UTIME_NOW)
>  		return true;
> 
>  	return nsec >= 0 && nsec <= 999999999;
> @@ -106,7 +101,9 @@
>  	newattrs.ia_valid = ATTR_CTIME | ATTR_MTIME | ATTR_ATIME;
>  	if (times) {
>  		error = -EPERM;
> -                if (IS_APPEND(inode) || IS_IMMUTABLE(inode))
> +		if (!(times[0].tv_nsec == UTIME_NOW &&
> +		      times[1].tv_nsec == UTIME_NOW) &&
> +		    (IS_IMMUTABLE(inode) || IS_APPEND(inode)))
>  			goto mnt_drop_write_and_out;
> 
>  		if (times[0].tv_nsec == UTIME_OMIT)
> @@ -131,9 +128,10 @@
>  	 * UTIME_NOW, then need to check permissions, because
>  	 * inode_change_ok() won't do it.
>  	 */
> -	if (!times || (nsec_special(times[0].tv_nsec) &&
> -		       nsec_special(times[1].tv_nsec))) {
> +	if (!times || (times[0].tv_nsec == UTIME_NOW &&
> +		       times[1].tv_nsec == UTIME_NOW)) {
>  		error = -EACCES;
> +

How about explicitly turning UTIME_NOW/UTIME_NOW into times = NULL at
the beginning of the function?  That would both simplify things and
also make it absolutely sure that the two cases are handled the same
way (which makes sense, and is also what the standard wants).

>                  if (IS_IMMUTABLE(inode))
>  			goto mnt_drop_write_and_out;
> 
> @@ -147,7 +145,20 @@
>  					goto mnt_drop_write_and_out;
>  			}
>  		}
> +	} else if (times && ((times[0].tv_nsec == UTIME_NOW &&
> +			      times[1].tv_nsec == UTIME_OMIT)
> +			     ||
> +			     (times[0].tv_nsec == UTIME_OMIT &&
> +			      times[1].tv_nsec == UTIME_NOW))) {
> +		error = -EPERM;
> +
> +		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
> +			goto mnt_drop_write_and_out;
> +
> +		if (!is_owner_or_cap(inode))
> +			goto mnt_drop_write_and_out;

I don't like adding _more_ owner checks to this function.  It would be
better if we were removing them: some weird filesystems want to do
their own permission checking and so the owner checks should really be
moved into inode_change_ok().

One way to do that could be to add a pseudo attribute flag,
e.g. ATTR_TIMES_UPDATE, that tells the permission checking code to
check the owner, even when neither ATTR_[AM]TIME_SET flag is set.

Even the check for the owner in the !times case could be removed, by
adding ATTR_TIMES_UPDATE only if we don't have write permission on the
file.  That's a cleanup I'd really be happy with.

All this may also be done with the ATTR_FORCE flag, but that would
mean:

  - modifying lots of call sites
  - making it impossible to selectively check the permission if
    multiple attributes are being modified (don't know if any callers
    want that though).

Miklos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
