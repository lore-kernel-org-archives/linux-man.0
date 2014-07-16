From: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Subject: [PATCH] sendfile.2: caution against modifying sent pages
Date: Wed, 16 Jul 2014 22:50:50 +0000
Message-ID: <20140716225050.GA4675@dcvr.yhbt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The following program illustrates the difference between TCP and Unix
stream sockets doing sendfile.  Since TCP implements zero-copy, the new
modifications to the file tranferred is seen upon reading despite
the modifications happening after sendfile was last called.

Unix stream sockets do not implement zero-copy (as of Linux 3.15),
so readers continue to see the contents of the file at the time it
was sent, not as they are at the time of reading.

----------------- sendfile-mod.c ---------------
	#define _GNU_SOURCE
	#include <sys/ioctl.h>
	#include <sys/types.h>
	#include <sys/socket.h>
	#include <sys/sendfile.h>
	#include <arpa/inet.h>
	#include <stdio.h>
	#include <errno.h>
	#include <string.h>
	#include <unistd.h>
	#include <assert.h>
	#include <fcntl.h>

static void tcp_socketpair(int sv[2])
{
	struct sockaddr_in addr;
	socklen_t addrlen = sizeof(addr);
	int l = socket(PF_INET, SOCK_STREAM, 0);
	int c = socket(PF_INET, SOCK_STREAM, 0);
	int a;
	int val = 1;

	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = INADDR_ANY;
	addr.sin_port = 0;
	assert(0 == bind(l, (struct sockaddr*)&addr, addrlen));
	assert(0 == listen(l, 1024));
	assert(0 == getsockname(l, (struct sockaddr *)&addr, &addrlen));
	assert(0 == connect(c, (struct sockaddr *)&addr, addrlen));
	a = accept4(l, NULL, NULL, SOCK_NONBLOCK);
	assert(a >= 0);
	close(l);
	assert(0 == ioctl(c, FIONBIO, &val));
	sv[0] = a;
	sv[1] = c;
}

int main(int argc, char *argv[])
{
	int pair[2];
	FILE *tmp = tmpfile();
	int tfd;
	char buf[16384];
	ssize_t w, r;
	size_t i;
	const size_t n = 2048;
	off_t off = 0;
	char expect[4096];
	int flags = SOCK_STREAM|SOCK_NONBLOCK;

	tfd = fileno(tmp);
	assert(tfd >= 0);

	/* prepare the tempfile */
	memset(buf, 'a', sizeof(buf));
	for (i = 0; i < n; i++)
		assert(sizeof(buf) == write(tfd, buf, sizeof(buf)));

	if (argc == 2 && strcmp(argv[1], "unix") == 0)
		assert(0 == socketpair(AF_UNIX, flags, 0, pair));
	else if (argc == 2 && strcmp(argv[1], "pipe") == 0)
		assert(0 == pipe2(pair, O_NONBLOCK));
	else
		tcp_socketpair(pair);

	/* fill up the socket buffer */
	for (;;) {
		w = sendfile(pair[1], tfd, &off, n);
		if (w > 0)
			continue;
		if (w < 0 && errno == EAGAIN)
			break;
		assert(0 && "unhandled error" && w && errno);
	}
	printf("wrote off=%lld\n", (long long)off);

	/* rewrite the tempfile */
	memset(buf, 'A', sizeof(buf));
	assert(0 == lseek(tfd, 0, SEEK_SET));
	for (i = 0; i < n; i++)
		assert(sizeof(buf) == write(tfd, buf, sizeof(buf)));

	/* we should be reading 'a's, not 'A's */
	memset(expect, 'a', sizeof(expect));
	do {
		r = read(pair[0], buf, sizeof(expect));

		/* TCP fails here since it is zero copy (on Linux 3.15.5) */
		if (r > 0)
			assert(memcmp(buf, expect, r) == 0);
	} while (r > 0);

	return 0;
}

Signed-off-by: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
---
  One of my applications turned out to be buggy due to my failure to
  realize this in time.  Hopefully this note prevents others from
  suffering the same fate.

  I think splice.2 and tee.2 will need similar notes
  (not sure if my current wording here is good enough,
   I am not comfortable writing documentation :x)

 man2/sendfile.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/sendfile.2 b/man2/sendfile.2
index 6e9ec42..fcc2724 100644
--- a/man2/sendfile.2
+++ b/man2/sendfile.2
@@ -190,6 +190,15 @@ fails with
 or
 .BR ENOSYS .
 
+If
+.I out_fd
+refers to a socket or pipe with zero-copy support, callers must ensure the
+transferred portions of the file referred to by
+.I in_fd
+remain unmodified until the reader on the other end of
+.I out_fd
+has consumed the transferred data.
+
 The Linux-specific
 .BR splice (2)
 call supports transferring data between arbitrary files
-- 
EW

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
