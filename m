From: Kirill Smelkov <kirr@nexedi.com>
Subject: Why mmap(MAP_POPULATE | MAP_NONBLOCK) is needed  (Re: [patch]
 mmap.2: Add link to commit which broke MAP_POPULATE | MAP_NONBLOCK to be
 noop)
Date: Mon, 20 Mar 2017 18:59:49 +0300
Message-ID: <20170320155948.pgpp2uhgoppicdl4@deco.navytux.spb.ru>
References: <20170318194010.11639-1-kirr@nexedi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170318194010.11639-1-kirr@nexedi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Sat, Mar 18, 2017 at 10:40:10PM +0300, Kirill Smelkov wrote:
> Signed-off-by: Kirill Smelkov <kirr@nexedi.com>
> ---
>  man2/mmap.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index 96875e486..f6fd56523 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -300,6 +300,7 @@ Don't perform read-ahead:
>  create page tables entries only for pages
>  that are already present in RAM.
>  Since Linux 2.6.23, this flag causes
> +.\" commit 54cb8821de07f2ffcd28c380ce9b93d5784b40d7
>  .BR MAP_POPULATE
>  to do nothing.
>  One day, the combination of

Please also find below benchmark which explains why

	mmap(MAP_POPULATE | MAP_NONBLOCK)
	
is actually needed.

Thanks,
Kirill

---- 8< ---- (https://lab.nexedi.com/kirr/misc/blob/5a25f4ae/t_sysmmap_c.c)
/* This program benchmarks pagefault time.
 *
 * Unfortunately as of 2017-Mar-20 for data in pagecache the situation is as
 * follows (i7-6600U, Linux 4.9.13):
 *
 * 1. minor pagefault:			~ 1200ns
 *    (this program)
 *
 * 2. read syscall + whole page copy:	~  215ns
 *    (https://github.com/golang/go/issues/19563#issuecomment-287423654)
 *
 * 3. it is not possible to mmap(MAP_POPULATE | MAP_NONBLOCK) (i.e. prefault
 *    those PTE that are already in pagecache).
 *    ( http://www.spinics.net/lists/linux-man/msg11420.html,
 *      https://git.kernel.org/linus/54cb8821de07f2ffcd28c380ce9b93d5784b40d7 )
 *
 * 4. (Q) I'm not sure a mechanism exists in the kernel to automatically
 *    subscribe a VMA so that when a page becomes pagecached, associated PTE is
 *    adjusted so that programs won't need to pay minor pagefault time on
 *    access.
 *
 * unless 3 and 4 are solved mmap unfortunately seems to be slower choice
 * compared to just pread.
 */
#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/user.h>
#include <sys/mman.h>

//		 12345678
#define	NITER	500000

// microtime returns current time as double
double microtime() {
	int err;
	struct timeval tv;

	err = gettimeofday(&tv, NULL);
	if (err == -1) {
		perror("gettimeofday");
		abort();
	}

	return tv.tv_sec + 1E-6 * tv.tv_usec;
}


int main() {
	unsigned char *addr, sum = 0;
	int fd, err, i;
	size_t size;
	double Tstart, Tend;

	fd = open("/dev/shm/y.dat", O_RDWR | O_CREAT | O_TRUNC, 0666);
	if (fd == -1) {
		perror("open");
		abort();
	}

	size = NITER * PAGE_SIZE;

	err = ftruncate(fd, size);
	if (err == -1) {
		perror("ftruncate");
		abort();
	}

#if 1
	// make sure RAM is actually allocated
	Tstart = microtime();
	err = fallocate(fd, /*mode*/0, 0, size);
	Tend = microtime();
	if (err == -1) {
		perror("fallocate");
		abort();
	}
	printf("T(fallocate):\t%.1f\t%6.1f ns / page\n", Tend - Tstart, (Tend - Tstart) * 1E9 / NITER);
#endif

	Tstart = microtime();
	addr = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
	//addr = mmap(NULL, size, PROT_READ, MAP_SHARED | MAP_POPULATE, fd, 0);
	//addr = mmap(NULL, size, PROT_READ, MAP_SHARED | MAP_POPULATE | MAP_NONBLOCK, fd, 0);
	if (addr == MAP_FAILED) {
		perror("mmap");
		abort();
	}
	Tend = microtime();
	printf("T(mmap):\t%.1f\t%6.1f ns / page\n", Tend - Tstart, (Tend - Tstart) * 1E9 / NITER);

	Tstart = microtime();
	//for (int j=0; j < 100; j++)
	for (i=0; i<NITER; i++) {
		sum += addr[i*PAGE_SIZE];
	}
	Tend = microtime();

	printf("T(pagefault):\t%.1f\t%6.1f ns / page\t(%i)\n", Tend - Tstart, (Tend - Tstart) * 1E9 / NITER, sum);

	return 0;
}
---- 8< ----
