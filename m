From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: [PATCH] mmap.2: Add note about partial page in BUGS section
Date: Mon, 12 Nov 2012 12:25:45 +0100
Message-ID: <20121112112544.GC6764@rei.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
This adds note about Linux behavior with partial page at the end of the
object. The problem here is that pages that contains only part of a
file (because the file size is not multiple of PAGE_SIZE) stays in page
cache even after the mapping is unmapped and the file closed. So if some
proces dirties such page other mappings will see the the changes rather
than zeroes.

I've also attached reproducer which is a stripped down version of LTP
test. The child creates file of the size of PAGE_SIZE/2, maps it,
changes content after the PAGE_SIZE/2. The parent waits for child to
exit, maps the same file and checks the content after the PAGE_SIZE/2.
Uncommenting the msync() makes the test succeed.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="0002-mmap.2-Add-note-about-partial-page-in-BUGS.patch"

>From 24dda667d02a128274133a60f8985bb061fe056c Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 7 Nov 2012 12:20:19 +0100
Subject: [PATCH 2/2] mmap.2: Add note about partial page in BUGS

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/mmap.2 |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 29fcc3d..5d2f7ee 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -573,6 +573,15 @@ Since kernel 2.6.12,
 fails with the error
 .B EINVAL
 for this case.
+
+POSIX specifies that system shall always zero fill any partial page at the end
+of the object and that system will newer write any modification of object
+beyond its end. On Linux when you write data to such partial page after the end
+of the object the data stays in page cache even after you closed and unmaped
+the file and although the data are newer written to the file itself subsequent
+mappings may see the modified content. In some cases this could be fixed by
+calling msync before the unmap takes place, this however doesn't work on tmpfs
+(for example when using shm ipc interface).
 .SH EXAMPLE
 .\" FIXME . Add an example here that uses an anonymous shared region for
 .\" IPC between parent and child.
-- 
1.7.8.6


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-mmap.2-Add-note-about-partial-page-in-BUGS.patch"

>From 24dda667d02a128274133a60f8985bb061fe056c Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 7 Nov 2012 12:20:19 +0100
Subject: [PATCH 2/2] mmap.2: Add note about partial page in BUGS

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/mmap.2 |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index 29fcc3d..5d2f7ee 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -573,6 +573,15 @@ Since kernel 2.6.12,
 fails with the error
 .B EINVAL
 for this case.
+
+POSIX specifies that system shall always zero fill any partial page at the end
+of the object and that system will newer write any modification of object
+beyond its end. On Linux when you write data to such partial page after the end
+of the object the data stays in page cache even after you closed and unmaped
+the file and although the data are newer written to the file itself subsequent
+mappings may see the modified content. In some cases this could be fixed by
+calling msync before the unmap takes place, this however doesn't work on tmpfs
+(for example when using shm ipc interface).
 .SH EXAMPLE
 .\" FIXME . Add an example here that uses an anonymous shared region for
 .\" IPC between parent and child.
-- 
1.7.8.6


--TRYliJ5NKNqkz5bu
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="reproducer.c"

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

int main(void)
{
	char tmpfname[256];
	long page_size;

	void *pa;
	size_t len;
	int fd;

	pid_t child;
	char *ch;
	int exit_val;

	page_size = sysconf(_SC_PAGE_SIZE);

	len = page_size / 2;

	snprintf(tmpfname, sizeof(tmpfname), "/tmp/test");
	child = fork();
	switch (child) {
	case 0:
		/* Create shared object */
		unlink(tmpfname);
		fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL,
			  S_IRUSR | S_IWUSR);
		if (fd == -1) {
			printf("Error at open(): %s\n", strerror(errno));
			return 1;
		}
		if (ftruncate(fd, len) == -1) {
			printf("Error at ftruncate(): %s\n", strerror(errno));
			return 1;
		}

		pa = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
		if (pa == MAP_FAILED) {
			printf("Error at mmap(): %s\n", strerror(errno));
			return 1;
		}
		
		/* Check the patial page is ZERO filled */
		ch = pa + len + 1;
		if (*ch != 0) {
			printf("Test FAILED: "
			       "The partial page at the end of an object "
			       "is not zero-filled\n");
			return 1;
		}

		/* Write the partial page */
		*ch = 'b';
		//msync(pa, len, MS_SYNC);
		munmap(pa, len);
		close(fd);
		return 0;
	case -1:
		printf("Error at fork(): %s\n", strerror(errno));
		return 1;
	default:
	break;
	}

	wait(&exit_val);
	if (!(WIFEXITED(exit_val) && (WEXITSTATUS(exit_val) == 0))) {
		unlink(tmpfname);
		printf("Child exited abnormally\n");
		return 1;
	}

	fd = open(tmpfname, O_RDWR, 0);
	unlink(tmpfname);

	pa = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (pa == MAP_FAILED) {
		printf("Error at 2nd mmap(): %s\n", strerror(errno));
		return 1;
	}

	ch = pa + len + 1;
	if (*ch == 'b') {
		printf("Test FAILED: Modification of the partial page "
		       "at the end of an object is written out\n");
		return 1;
	}
	close(fd);
	munmap(pa, len);

	printf("Test PASSED\n");
	return 0;
}

--TRYliJ5NKNqkz5bu--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
