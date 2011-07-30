From: Joey Adams <joeyadams3.14159-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Minor typo in man 7 unix: says tcp_socket, but should say unix_socket
Date: Sat, 30 Jul 2011 18:02:35 -0400
Message-ID: <CAARyMpAY7yeKjFxwsKkhKSxhHjvz30pO8Qwuq1LTKxzxrZj=kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Under man 7 unix, it says:

Ioctls
       The following ioctl(2) calls return information in value.  The
correct syntax is:

              int value;
              error = ioctl(tcp_socket, ioctl_type, &value);

The last line should read:

              error = ioctl(unix_socket, ioctl_type, &value);

I'm on Fedora 15, with Linux man-pages version 3.32.  The date at the
bottom of this page is 2010-11-15.

Thanks,
- Joey
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
