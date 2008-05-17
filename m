From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes -- version 2
Date: Sat, 17 May 2008 21:57:21 +0200
Message-ID: <482F38A1.9070704@gmail.com>
References: <482D4665.4050401@gmail.com> <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1Jx3Gw-0002eA-55-8f8m9JG5TPIdUIPVzhDTVZP2KDSNp7ea@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Cc: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Miklos,

Thanks for the comments.

Miklos Szeredi wrote:
>> This is a revised version of my earlier
>> (http://article.gmane.org/gmane.linux.man/129/ ) patch to fix
>> non-conformances in the utimensat() implementation.
>
> The patch looks functionally correct.  But there are several things I
> don't really like...

[..]

>> -	if (!times || (nsec_special(times[0].tv_nsec) &&
>> -		       nsec_special(times[1].tv_nsec))) {
>> +	if (!times || (times[0].tv_nsec == UTIME_NOW &&
>> +		       times[1].tv_nsec == UTIME_NOW)) {
>>  		error = -EACCES;
>> +
>
> How about explicitly turning UTIME_NOW/UTIME_NOW into times = NULL at
> the beginning of the function?  That would both simplify things and
> also make it absolutely sure that the two cases are handled the same
> way (which makes sense, and is also what the standard wants).

Yes, simple, and sensible.

>>                  if (IS_IMMUTABLE(inode))
>>  			goto mnt_drop_write_and_out;
>>
>> @@ -147,7 +145,20 @@
>>  					goto mnt_drop_write_and_out;
>>  			}
>>  		}
>> +	} else if (times && ((times[0].tv_nsec == UTIME_NOW &&
>> +			      times[1].tv_nsec == UTIME_OMIT)
>> +			     ||
>> +			     (times[0].tv_nsec == UTIME_OMIT &&
>> +			      times[1].tv_nsec == UTIME_NOW))) {
>> +		error = -EPERM;
>> +
>> +		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
>> +			goto mnt_drop_write_and_out;
>> +
>> +		if (!is_owner_or_cap(inode))
>> +			goto mnt_drop_write_and_out;
>
> I don't like adding _more_ owner checks to this function.  It would be
> better if we were removing them: some weird filesystems want to do
> their own permission checking and so the owner checks should really be
> moved into inode_change_ok().
>
> One way to do that could be to add a pseudo attribute flag,
> e.g. ATTR_TIMES_UPDATE, that tells the permission checking code to
> check the owner, even when neither ATTR_[AM]TIME_SET flag is set.
>
> Even the check for the owner in the !times case could be removed, by
> adding ATTR_TIMES_UPDATE only if we don't have write permission on the
> file.  That's a cleanup I'd really be happy with.

See below.

> All this may also be done with the ATTR_FORCE flag, but that would
> mean:
>
>   - modifying lots of call sites
>   - making it impossible to selectively check the permission if
>     multiple attributes are being modified (don't know if any callers
>     want that though).

Okay, I won't go that route...

Regarding your suggestions above, are you meaning something like the
patch below?

The patch is a little less pretty than I'd like because of the need to
return EACCES or EPERM depending on whether (times == NULL).  In
particular, these lines in utimes.c:

+	if (!times && error == -EPERM)
+		error = -EACCES;

seem a little fragile (but maybe I worry too much).

Cheers,

Michael

========================

diff -ru linux-2.6.26-rc2/fs/attr.c linux-2.6.26-rc2-utimensat-fix/fs/attr.c
--- linux-2.6.26-rc2/fs/attr.c	2008-01-24 23:58:37.000000000 +0100
+++ linux-2.6.26-rc2-utimensat-fix/fs/attr.c	2008-05-16 21:56:51.000000000 +0200
@@ -51,7 +51,8 @@
 	}

 	/* Check for setting the inode time. */
-	if (ia_valid & (ATTR_MTIME_SET | ATTR_ATIME_SET)) {
+	if (ia_valid & (ATTR_MTIME_SET | ATTR_ATIME_SET |
+			ATTR_TIMES_UPDATE)) {
 		if (!is_owner_or_cap(inode))
 			goto error;
 	}
diff -ru linux-2.6.26-rc2/fs/utimes.c linux-2.6.26-rc2-utimensat-fix/fs/utimes.c
--- linux-2.6.26-rc2/fs/utimes.c	2008-05-15 10:33:20.000000000 +0200
+++ linux-2.6.26-rc2-utimensat-fix/fs/utimes.c	2008-05-16 22:14:31.000000000 +0200
@@ -40,14 +40,9 @@

 #endif

-static bool nsec_special(long nsec)
-{
-	return nsec == UTIME_OMIT || nsec == UTIME_NOW;
-}
-
 static bool nsec_valid(long nsec)
 {
-	if (nsec_special(nsec))
+	if (nsec == UTIME_OMIT || nsec == UTIME_NOW)
 		return true;

 	return nsec >= 0 && nsec <= 999999999;
@@ -102,11 +97,15 @@
 	if (error)
 		goto dput_and_out;

+	if (times && times[0].tv_nsec == UTIME_NOW &&
+		     times[1].tv_nsec == UTIME_NOW)
+		times = NULL;
+
 	/* Don't worry, the checks are done in inode_change_ok() */
 	newattrs.ia_valid = ATTR_CTIME | ATTR_MTIME | ATTR_ATIME;
 	if (times) {
 		error = -EPERM;
-                if (IS_APPEND(inode) || IS_IMMUTABLE(inode))
+		if (IS_APPEND(inode) || IS_IMMUTABLE(inode))
 			goto mnt_drop_write_and_out;

 		if (times[0].tv_nsec == UTIME_OMIT)
@@ -131,25 +130,39 @@
 	 * UTIME_NOW, then need to check permissions, because
 	 * inode_change_ok() won't do it.
 	 */
-	if (!times || (nsec_special(times[0].tv_nsec) &&
-		       nsec_special(times[1].tv_nsec))) {
+	if (!times) {
 		error = -EACCES;
                 if (IS_IMMUTABLE(inode))
 			goto mnt_drop_write_and_out;

-		if (!is_owner_or_cap(inode)) {
-			if (f) {
-				if (!(f->f_mode & FMODE_WRITE))
-					goto mnt_drop_write_and_out;
-			} else {
-				error = vfs_permission(&nd, MAY_WRITE);
-				if (error)
-					goto mnt_drop_write_and_out;
-			}
+		if (f) {
+			if (!(f->f_mode & FMODE_WRITE))
+				newattrs.ia_valid |= ATTR_TIMES_UPDATE;
+		} else {
+			error = vfs_permission(&nd, MAY_WRITE);
+			if (error == -EACCES)
+				newattrs.ia_valid |= ATTR_TIMES_UPDATE;
+			else if (error)
+				goto mnt_drop_write_and_out;
 		}
+	} else if (times && ((times[0].tv_nsec == UTIME_NOW &&
+			      times[1].tv_nsec == UTIME_OMIT)
+			     ||
+			     (times[0].tv_nsec == UTIME_OMIT &&
+			      times[1].tv_nsec == UTIME_NOW))) {
+		error = -EPERM;
+
+		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
+			goto mnt_drop_write_and_out;
+
+		newattrs.ia_valid |= ATTR_TIMES_UPDATE;
 	}
+
 	mutex_lock(&inode->i_mutex);
 	error = notify_change(dentry, &newattrs);
+	if (!times && error == -EPERM)
+		error = -EACCES;
+		
 	mutex_unlock(&inode->i_mutex);
 mnt_drop_write_and_out:
 	mnt_drop_write(mnt);
diff -ru linux-2.6.26-rc2/include/linux/fs.h linux-2.6.26-rc2-utimensat-fix/include/linux/fs.h
--- linux-2.6.26-rc2/include/linux/fs.h	2008-05-15 10:33:25.000000000 +0200
+++ linux-2.6.26-rc2-utimensat-fix/include/linux/fs.h	2008-05-16 21:39:24.000000000 +0200
@@ -317,22 +317,23 @@
  * Attribute flags.  These should be or-ed together to figure out what
  * has been changed!
  */
-#define ATTR_MODE	1
-#define ATTR_UID	2
-#define ATTR_GID	4
-#define ATTR_SIZE	8
-#define ATTR_ATIME	16
-#define ATTR_MTIME	32
-#define ATTR_CTIME	64
-#define ATTR_ATIME_SET	128
-#define ATTR_MTIME_SET	256
-#define ATTR_FORCE	512	/* Not a change, but a change it */
-#define ATTR_ATTR_FLAG	1024
-#define ATTR_KILL_SUID	2048
-#define ATTR_KILL_SGID	4096
-#define ATTR_FILE	8192
-#define ATTR_KILL_PRIV	16384
-#define ATTR_OPEN	32768	/* Truncating from open(O_TRUNC) */
+#define ATTR_MODE		1
+#define ATTR_UID		2
+#define ATTR_GID		4
+#define ATTR_SIZE		8
+#define ATTR_ATIME		16
+#define ATTR_MTIME		32
+#define ATTR_CTIME		64
+#define ATTR_ATIME_SET		128
+#define ATTR_MTIME_SET		256
+#define ATTR_FORCE		512	/* Not a change, but a change it */
+#define ATTR_ATTR_FLAG		1024
+#define ATTR_KILL_SUID		2048
+#define ATTR_KILL_SGID		4096
+#define ATTR_FILE		8192
+#define ATTR_KILL_PRIV		16384
+#define ATTR_OPEN		32768	/* Truncating from open(O_TRUNC) */
+#define ATTR_TIMES_UPDATE	65536

 /*
  * This is the Inode Attributes structure, used for notify_change().  It
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
