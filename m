From: Ursache Vladimir <f35f22fan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: readlink() example sometimes fails
Date: Thu, 18 Aug 2016 08:30:49 +0300
Message-ID: <CAJbVpmwRAi1dEJw=zUtsJLE2RRMGtsjqBJk4x+_KsJGWnoRsMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 Hi,
the readlink() example from:

http://man7.org/linux/man-pages/man2/readlink.2.html

relies on lstat()'s st_size, but that doesn't work for files contents
created dynamically by the Linux kernel which often report a zero
size, for example the link at:
/sys/block/sda

the example code will fail because stat.st_size reports zero and you
try to read (stat.st_size + 1) which will succeed, which will generate
the error : "symlink increased in size between lstat() and
readlink()".

Somewhat related, the same issue is true for reading regular text
files, e.g: "/proc/filesystems" which will report stat.st_size = 0.

My quick workaround:

if (stat.st_size != 0)
    // work as usual
else if (file_is_a_link)
    // malloc 4K of ram and try to readlink() into it
else if (is_regular_file)
    // read() into a byte array that grows accordingly

In case it matters, I'm using Ubuntu 16.04 amd64.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
