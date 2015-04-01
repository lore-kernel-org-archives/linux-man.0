From: Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man 2 getdents64 struct linux_dirent incorrect.
Date: Wed, 1 Apr 2015 12:47:14 +0200
Message-ID: <CAGGBzXKT2jtrSBS_Oa56if6pvw5zsnBq-1_65LbxBDZAiDHZdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Per current man page (shared between getdents and getdents64):

           struct linux_dirent {
               unsigned long  d_ino;     /* Inode number */
               unsigned long  d_off;     /* Offset to next linux_dirent */
               unsigned short d_reclen;  /* Length of this linux_dirent */
               char           d_name[];  /* Filename (null-terminated) */
                                   /* length is actually (d_reclen - 2 -
                                      offsetof(struct linux_dirent, d_name) */
               /*
               char           pad;       // Zero padding byte
               char           d_type;    // File type (only since Linux 2.6.4;
                                         // offset is (d_reclen - 1))
               */

           }

However, when I issue this system call, the data seems to be:

           struct linux_dirent {
               unsigned long  d_ino;  // 8 bytes
               unsigned long  d_off;  // 8 bytes
               unsigned short d_reclen;  // 2 bytes
               char d_type;  // 1 byte
               char           d_name[];  // null-terminated
               char           pad[];  // 0..7 bytes
           }

Most important is that `d_type` is before `d_name`, not after.

Tested on ext4 and virtual like tmpfs, devpts, cgroup, etc.


d.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
