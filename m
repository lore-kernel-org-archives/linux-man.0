From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] Add cloexec information to fdinfo
Date: Mon, 20 Jun 2011 14:31:31 -0700
Message-ID: <20110620143131.9c6e040c.akpm@linux-foundation.org>
References: <201106100355.p5A3t8Aa024924@drepperk.user.openhosting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201106100355.p5A3t8Aa024924-/1RLGD9tqMZ22nUyOigohnmVWlWGoA+o+lehtg8QC5Y@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: drepper-85h5CteqBpZAfugRpC6u6w@public.gmane.org
Cc: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, wilsons-bbsPK2OMKKo@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 9 Jun 2011 23:55:08 -0400
drepper-85h5CteqBpZAfugRpC6u6w@public.gmane.org wrote:

> There is one piece of information about a file descriptor which is
> currently not visible from the outside: the close-on-exec flag.  The
> /proc/PID/fdinfo/* files have the mode information but this is
> missing.  Is the following patch acceptable?
> 
> What I don't know is whether the RCU locking is needed given that
> real locks are taken.  Someone with more knowledge could just
> remove those two lines.

The locking looks OK to me.

Hopefully /prod/pid/fdinfo is documented somewhere. 
linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org appears to be the email address we use to rub
the documentation lamp.

> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 14def99..bda3651 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1924,12 +1924,23 @@ static int proc_fd_info(struct inode *inode, struct path *path, char *info)
>  				*path = file->f_path;
>  				path_get(&file->f_path);
>  			}
> -			if (info)
> +			if (info) {
> +				int cloexec;
> +				struct fdtable *fdt;
> +
> +				rcu_read_lock();
> +				fdt = files_fdtable(files);
> +				cloexec = FD_ISSET(fd, fdt->close_on_exec);

Does FD_ISSET return 0 or 1?  Or 0 or non-zero?

For x86 it's the former.

<checks the architectures>

arch/h8300/include/asm/posix_types.h: busted
#define __FD_ISSET(d, set)      ((set)->fds_bits[__FDELT(d)] & __FDMASK(d))

arch/m68k/include/asm/posix_types.h: busted
#define __FD_ISSET(d, set)      ((set)->fds_bits[__FDELT(d)] & __FDMASK(d))

arch/xtensa/include/asm/posix_types.h: busted
#define __FD_ISSET(d, set)      ((set)->fds_bits[__FDELT(d)] & __FDMASK(d))


From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

Harmonise these return values with other architectures.  In some cases
this affects all compilers and in other cases non-gcc compilers only.

Cc: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>
Cc: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
---

 arch/h8300/include/asm/posix_types.h  |    2 +-
 arch/m68k/include/asm/posix_types.h   |    2 +-
 arch/xtensa/include/asm/posix_types.h |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff -puN arch/h8300/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1 arch/h8300/include/asm/posix_types.h
--- a/arch/h8300/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1
+++ a/arch/h8300/include/asm/posix_types.h
@@ -50,7 +50,7 @@ typedef struct {
 #define	__FD_CLR(d, set)	((set)->fds_bits[__FDELT(d)] &= ~__FDMASK(d))
 
 #undef	__FD_ISSET
-#define	__FD_ISSET(d, set)	((set)->fds_bits[__FDELT(d)] & __FDMASK(d))
+#define	__FD_ISSET(d, set)	(!!((set)->fds_bits[__FDELT(d)] & __FDMASK(d)))
 
 #undef	__FD_ZERO
 #define __FD_ZERO(fdsetp) (memset (fdsetp, 0, sizeof(*(fd_set *)fdsetp)))
diff -puN arch/m68k/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1 arch/m68k/include/asm/posix_types.h
--- a/arch/m68k/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1
+++ a/arch/m68k/include/asm/posix_types.h
@@ -51,7 +51,7 @@ typedef struct {
 #define	__FD_CLR(d, set)	((set)->fds_bits[__FDELT(d)] &= ~__FDMASK(d))
 
 #undef	__FD_ISSET
-#define	__FD_ISSET(d, set)	((set)->fds_bits[__FDELT(d)] & __FDMASK(d))
+#define	__FD_ISSET(d, set)	(!!((set)->fds_bits[__FDELT(d)] & __FDMASK(d)))
 
 #undef	__FD_ZERO
 #define __FD_ZERO(fdsetp) (memset (fdsetp, 0, sizeof(*(fd_set *)fdsetp)))
diff -puN arch/xtensa/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1 arch/xtensa/include/asm/posix_types.h
--- a/arch/xtensa/include/asm/posix_types.h~h8300-m68k-xtensa-__fd_isset-should-return-0-1
+++ a/arch/xtensa/include/asm/posix_types.h
@@ -58,7 +58,7 @@ typedef struct {
 
 #define	__FD_SET(d, set)	((set)->fds_bits[__FDELT(d)] |= __FDMASK(d))
 #define	__FD_CLR(d, set)	((set)->fds_bits[__FDELT(d)] &= ~__FDMASK(d))
-#define	__FD_ISSET(d, set)	((set)->fds_bits[__FDELT(d)] & __FDMASK(d))
+#define	__FD_ISSET(d, set)	(!!((set)->fds_bits[__FDELT(d)] & __FDMASK(d)))
 #define	__FD_ZERO(set)	\
   ((void) memset ((void *) (set), 0, sizeof (__kernel_fd_set)))
 
_


> +				rcu_read_unlock();
> +
>  				snprintf(info, PROC_FDINFO_MAX,
>  					 "pos:\t%lli\n"
> -					 "flags:\t0%o\n",
> +					 "flags:\t0%o\n"
> +					 "cloexec: %d\n",

Should use a tab here for consistency.

--- a/fs/proc/base.c~proc-pid-fdinfo-add-cloexec-information-fix
+++ a/fs/proc/base.c
@@ -1936,7 +1936,7 @@ static int proc_fd_info(struct inode *in
 				snprintf(info, PROC_FDINFO_MAX,
 					 "pos:\t%lli\n"
 					 "flags:\t0%o\n"
-					 "cloexec: %d\n",
+					 "cloexec:\t%d\n",
 					 (long long) file->f_pos,
 					 file->f_flags,
 					 cloexec);
_

>  					 (long long) file->f_pos,
> -					 file->f_flags);
> +					 file->f_flags,
> +					 cloexec);
> +			}
>  			spin_unlock(&files->file_lock);
>  			put_files_struct(files);
>  			return 0;
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
