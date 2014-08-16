From: Ville Ylenius <ville-xG8NWnMrmhjR7s880joybQ@public.gmane.org>
Subject: Typo in example code of process_vm_readv
Date: Sat, 16 Aug 2014 14:35:16 +0300
Message-ID: <53EF41F4.2030509@ylenius.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

there is a small typo in the example code of the man page of 
"process_vm_readv" 
(http://man7.org/linux/man-pages/man2/process_vm_readv.2.html):

        #include <sys/uio.h>

        int
        main(void)
        {
            struct iovec local[2];
            struct iovec remote[1];
            char buf1[10];
            char buf2[10];
            ssize_t nread;
            pid_t pid = 10;             /* PID of remote process */

            local[0].iov_base = buf1;
            local[0].iov_len = 10;
            local[1].iov_base = buf2;
            local[1].iov_len = 10;
            remote[0].iov_base = (void *) 0x10000;
            remote[1].iov_len = 20;                     /**** <---- TYPO: 1 --> 0 ****/

            nread = process_vm_readv(pid, local, 2, remote, 1, 0);
            if (nread != 20)
                return 1;
            else
                return 0;
        }


There is no two objects in "remote"-array so program corrupts other 
variables memory.

Please change

remote[1].iov_len = 20;

to

remote[0].iov_len = 20;

Thank you!

- Ville Ylenius
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
