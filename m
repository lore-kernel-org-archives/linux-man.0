From: Christoph Hellwig <hch@infradead.org>
Subject: [PATCH] fsync_range, was: Re: munmap, msync: synchronization
Date: Tue, 22 Apr 2014 02:28:37 -0700
Message-ID: <20140422092837.GA6191@infradead.org>
References: <5353A158.9050009@gmx.de>
 <5354F00E.8050609@gmail.com>
 <20140421181431.GA17125@infradead.org>
 <53557768.5070905@gmail.com>
 <20140421213418.GH30215@jl-vm1.vm.bytemark.co.uk>
 <20140422060320.GA21241@infradead.org>
 <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140422070421.GI30215@jl-vm1.vm.bytemark.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jamie Lokier <jamie@shareable.org>
Cc: Christoph Hellwig <hch@infradead.org>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Theodore T'so <tytso@mit.edu>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
List-Id: linux-man@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 22, 2014 at 08:04:21AM +0100, Jamie Lokier wrote:
> Hi Christoph,
> 
> Hardly research, I just did a quick Google and was surprised to find
> some results.  AIX API differs from the BSDs; the BSDs seem to agree
> with each other. fsync_range(), with a flag parameter saying what type
> of sync, and whether it flushes the storage device write cache as well
> (because they couldn't agree that was good - similar to the barriers
> debate).

There is no FreeBSD implementation, I think you were confused by FreeBSD
also hosting NetBSD man pages on their site, just as I initially was.

The APIs are mostly the same, except that AIX reuses O_ flags as
argument and NetBSD has a separate namespace.  Following the latter
seems more sensible, and also allows developer to define the separate
name to the O_ flag for portability.

> As for me doing it, no, sorry, I haven't touched the kernel in a few
> years, life's been complicated for non-technical reasons, and I don't
> have time to get back into it now.

I've cooked up a patch, but I really need someone to test it and promote
it.  Find the patch attached.  There are two differences to the NetBSD
one:

 1) It doesn't fail for read-only FDs.  fsync doesn't, and while
    standards used to have fdatasync and aio_fsync fail for them,
    Linux never did and the standards are catching up:

	http://austingroupbugs.net/view.php?id=501
	http://austingroupbugs.net/view.php?id=671

 2) I don't implement the FDISKSYNC.  Requiring it is utterly broken,
    and we wouldn't even have the infrastructure for it.  It might make
    sense to provide it defined to 0 so that we have the identifier but
    make it a no-op.

> In the kernel, I was always under the impression the simple part of
> fsync_range - writing out data pages - was solved years ago, but being
> sure the filesystem's updated its metadata in the proper way, that
> begs for a little research into what filesystems do when asked,
> doesn't it?

The filesystems I care about handle it fine, and while I don't know
the details of others they better handle it properly, given that we
use vfs_fsync_range to implement O_SNYC/O_DSYNC writes and commits
from the nfs server.


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-fs-implement-fsync_range.patch"

>From b63881cac84b35ce3d6a61a33e33ac795a5c583c Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 22 Apr 2014 11:24:51 +0200
Subject: fs: implement fsync_range

Implement a fsync/fdatasync variant that takes a range to sync.  This follow the
NetBSD implementation:

	http://www.freebsd.org/cgi/man.cgi?query=fsync&apropos=0&sektion=0&manpath=NetBSD+5.0&format=html

and is fairly close the AIX implementation that the NetBSD one is based on:

	http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp?topic=%2Fcom.ibm.aix.basetechref%2Fdoc%2Fbasetrf1%2Ffsync.htm

The implementation is very simple because the VFS already offers a ranged
fsync infrastrucute, which is most prominently used to implement O_SYNC
and O_DSYNC writes.

Differences from NetBSD are:

 1) It doesn't fail for read-only FDs.  fsync doesn't, and while standards
    used require fdatasync and aio_fsync to fail for read-only file
    descriptors Linux never did and the standards are catching up:

	http://austingroupbugs.net/view.php?id=501
	http://austingroupbugs.net/view.php?id=671

 2) It doesn't implement the FDISKSYNC.  Requiring a flag to actuall make
    data persistant is completely broken, and the Linux infrastructure
    doesn't support it anyway.  We could provide it as a no-op if we
    really need to.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/syscalls/syscall_32.tbl |    1 +
 arch/x86/syscalls/syscall_64.tbl |    1 +
 fs/sync.c                        |  101 ++++++++++++++++++++++++--------------
 include/uapi/linux/fs.h          |    6 ++-
 4 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/arch/x86/syscalls/syscall_32.tbl b/arch/x86/syscalls/syscall_32.tbl
index d6b8679..e239d46 100644
--- a/arch/x86/syscalls/syscall_32.tbl
+++ b/arch/x86/syscalls/syscall_32.tbl
@@ -360,3 +360,4 @@
 351	i386	sched_setattr		sys_sched_setattr
 352	i386	sched_getattr		sys_sched_getattr
 353	i386	renameat2		sys_renameat2
+354	i386	fsync_range		sys_fsync_range
diff --git a/arch/x86/syscalls/syscall_64.tbl b/arch/x86/syscalls/syscall_64.tbl
index 04376ac..006d57f 100644
--- a/arch/x86/syscalls/syscall_64.tbl
+++ b/arch/x86/syscalls/syscall_64.tbl
@@ -323,6 +323,7 @@
 314	common	sched_setattr		sys_sched_setattr
 315	common	sched_getattr		sys_sched_getattr
 316	common	renameat2		sys_renameat2
+317	common	fsync_range		sys_fsync_range
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
diff --git a/fs/sync.c b/fs/sync.c
index b28d1dd..58f9ca7 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -197,13 +197,13 @@ int vfs_fsync(struct file *file, int datasync)
 }
 EXPORT_SYMBOL(vfs_fsync);
 
-static int do_fsync(unsigned int fd, int datasync)
+static int do_fsync(unsigned int fd, loff_t start, loff_t end, int datasync)
 {
 	struct fd f = fdget(fd);
 	int ret = -EBADF;
 
 	if (f.file) {
-		ret = vfs_fsync(f.file, datasync);
+		ret = vfs_fsync_range(f.file, start, end, datasync);
 		fdput(f);
 	}
 	return ret;
@@ -211,12 +211,69 @@ static int do_fsync(unsigned int fd, int datasync)
 
 SYSCALL_DEFINE1(fsync, unsigned int, fd)
 {
-	return do_fsync(fd, 0);
+	return do_fsync(fd, 0, LLONG_MAX, 0);
 }
 
 SYSCALL_DEFINE1(fdatasync, unsigned int, fd)
 {
-	return do_fsync(fd, 1);
+	return do_fsync(fd, 0, LLONG_MAX, 1);
+}
+
+static loff_t end_offset(loff_t offset, loff_t nbytes)
+{
+	loff_t endbyte = offset + nbytes;
+
+	if ((s64)offset < 0)
+		return -EINVAL;
+	if ((s64)endbyte < 0)
+		return -EINVAL;
+	if (endbyte < offset)
+		return -EINVAL;
+
+	if (sizeof(pgoff_t) == 4) {
+		if (offset >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
+			/*
+			 * The range starts outside a 32 bit machine's
+			 * pagecache addressing capabilities.  Let it "succeed"
+			 */
+			return 0;
+		}
+		if (endbyte >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
+			/*
+			 * Out to EOF
+			 */
+			return LLONG_MAX;
+		}
+	}
+
+	if (nbytes == 0)
+		endbyte = LLONG_MAX;
+	else
+		endbyte--;		/* inclusive */
+
+	return endbyte;
+}
+
+SYSCALL_DEFINE4(fsync_range, unsigned int, fd, int, how,
+		loff_t, start, loff_t, length)
+{
+	int datasync = 0;
+	loff_t end;
+
+	switch (how) {
+	case FDATASYNC:
+		datasync = 1;
+		break;
+	case FFILESYNC:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	end = end_offset(start, length);
+	if (end <= 0)
+		return end;
+	return do_fsync(fd, start, end, datasync);
 }
 
 /*
@@ -275,40 +332,12 @@ SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
 	loff_t endbyte;			/* inclusive */
 	umode_t i_mode;
 
-	ret = -EINVAL;
 	if (flags & ~VALID_FLAGS)
-		goto out;
-
-	endbyte = offset + nbytes;
-
-	if ((s64)offset < 0)
-		goto out;
-	if ((s64)endbyte < 0)
-		goto out;
-	if (endbyte < offset)
-		goto out;
-
-	if (sizeof(pgoff_t) == 4) {
-		if (offset >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
-			/*
-			 * The range starts outside a 32 bit machine's
-			 * pagecache addressing capabilities.  Let it "succeed"
-			 */
-			ret = 0;
-			goto out;
-		}
-		if (endbyte >= (0x100000000ULL << PAGE_CACHE_SHIFT)) {
-			/*
-			 * Out to EOF
-			 */
-			nbytes = 0;
-		}
-	}
+		return -EINVAL;
 
-	if (nbytes == 0)
-		endbyte = LLONG_MAX;
-	else
-		endbyte--;		/* inclusive */
+	endbyte = end_offset(offset, nbytes);
+	if (endbyte <= 0)
+		return endbyte;
 
 	ret = -EBADF;
 	f = fdget(fd);
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index ca1a11b..491d9fe 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -199,9 +199,13 @@ struct inodes_stat_t {
 #define FS_FL_USER_VISIBLE		0x0003DFFF /* User visible flags */
 #define FS_FL_USER_MODIFIABLE		0x000380FF /* User modifiable flags */
 
-
+/* flags for sync_file_range */
 #define SYNC_FILE_RANGE_WAIT_BEFORE	1
 #define SYNC_FILE_RANGE_WRITE		2
 #define SYNC_FILE_RANGE_WAIT_AFTER	4
 
+/* flags for fsync_range */
+#define FDATASYNC	0x0010
+#define FFILESYNC	0x0020
+
 #endif /* _UAPI_LINUX_FS_H */
-- 
1.7.10.4


--/9DWx/yDrRhgMJTb--
