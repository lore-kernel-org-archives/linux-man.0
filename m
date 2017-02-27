From: Marcus Geiger <geiger.marcus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man 1 getopts example code - wrong dash
Date: Mon, 27 Feb 2017 15:16:36 +0100
Message-ID: <CADOJ=xsjhuZ7_r8JXgfcgXVRi-bf1gN9irBnOePra+i-xv9HuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

in the examples section of `man 1 getopts`, every dash/minus used in the
example code cannot be parsed by bash. vi claims it's 0x2212 instead of 0x2d.

I'm on Ubuntu 16.04 with bash 4.3.46(1)-release. Unfortunately I couldn't find
the source code for this man page, but the current online pages entry also has
this problem: http://man7.org/linux/man-pages/man1/getopts.1p.html

The containing package is:

   $ dpkg -S $(man -w 1 getopts)
   manpages-posix: /usr/share/man/man1/getopts.1posix.gz

Kind regards

Marcus Geiger
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
