From: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mkdir.2: Add EMLINK error
Date: Mon, 21 Jun 2010 21:18:31 +0530
Message-ID: <AANLkTilRbs4OTZxAdH_XDZB_EeQDXiKp2kflmO8djV8j@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Michael,

While executing the below given program in ext3 file system, I came
across the EMLINK error in mkdir(2) syscall.

# cat test_max_directories.c

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <errno.h>

int main()
{
    char dirname[50];
    int i;
    /* The max number of subdirectories in one directory for ext3 is 32000 */
    int limit = 32001;

    for (i = 0; i < limit; i++) {
        sprintf(dirname, "testdir%d", i);
        if ((mkdir(dirname, 00777)) == -1) {
            perror("Error in creating directory!");
            printf("errno = %d\n", errno);
            exit(1);
        }
    }
    return 0;
}


# ./a.out
Error in creating directory!: Too many links
errno = 29

An strace of this execution shows that the mkdir(2) call generates an
EMLINK error when it reaches the limit of  maximum number of sub
directories in one directory

#strace ./a.out
-----------------------------------
.....
mkdir("testdir31998", 0777)             = -1 EMLINK (Too many links)
dup(2)                                  = 3
fcntl64(3, F_GETFL)                     = 0x8002 (flags O_RDWR|O_LARGEFILE)
brk(0)                                  = 0x804a000
brk(0x806b000)                          = 0x806b000
fstat64(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 2), ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f71000
_llseek(3, 0, 0xbffc3078, SEEK_CUR)     = -1 ESPIPE (Illegal seek)
write(3, "Error in creating directory!: To"..., 45Error in creating
directory!: Too many links
) = 45
close(3)                                = 0
munmap(0xb7f71000, 4096)                = 0
fstat64(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 2), ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f71000
write(1, "errno = 29\n", 11errno = 29
)            = 11
exit_group(1)                           = ?
Process 16246 detached
-----------------------------------

However, reference to EMLINK is not present in the mkdir(2) man page.
The following patch adds the EMLINK error in the man page of mkdir(2).

Kindly let me know if there are any issues.

Best Regards,
Maxin B. John
www.maxinbjohn.info

Signed-off-by: Maxin B. John <maxinbjohn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-------

diff --git a/man2/mkdir.2 b/man2/mkdir.2
index e6cb28c..d01bafd 100644
--- a/man2/mkdir.2
+++ b/man2/mkdir.2
@@ -73,6 +73,10 @@ is a symbolic link, dangling or not.
 Too many symbolic links were encountered in resolving
 .IR pathname .
 .TP
+.B EMLINK
+The new directory cannot be created because the number of sub directories
+in a directory is limited to LINK_MAX defined by the file system.
+.TP
 .B ENAMETOOLONG
 .IR pathname " was too long."
 .TP

-------
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
