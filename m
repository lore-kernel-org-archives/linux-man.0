From: "John H. DuBois III" <spcecdt-E0iVtVOWpgTQT0dZR+AlfA@public.gmane.org>
Subject: Bug in console_ioctl(4)
Date: Tue, 16 Nov 2010 13:43:48 -0800
Message-ID: <20101116214348.GA12414@armory.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Using Ubuntu 10.04 64-bit, but I see that this problem is present in the online
man pages as well.

The argp for various of the console keyboard "get" ioctls - KDGETMODE,
KDGKBMODE, KDGKBMETA - is described as "argp points to a long".

This is not correct; in the kernel it's

put_user(ucval, (int __user *)arg)

This will work with a 32-bit binary, but will leave the upper part of the word
unset with a 64-bit (LP64) binary.

	John
-- 
John DuBois  spcecdt-E0iVtVOWpgTQT0dZR+AlfA@public.gmane.org  KC6QKZ/AE  http://www.armory.com/~spcecdt/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
