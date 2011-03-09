From: Mikel Ward <mikel-pSK+WyAkGS32eFz/2MeuCQ@public.gmane.org>
Subject: lockf - EBADF also if fd is open for reading
Date: Wed, 9 Mar 2011 21:43:44 +1100
Message-ID: <AANLkTimcFNgz1Bv1H1Q1JJAUZE3c+0O5zTWzNZL2kbFG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

http://www.kernel.org/doc/man-pages/online/pages/man3/lockf.3.html
says:

       EBADF  fd is not an open file descriptor.

However it can also happen if the file descriptor is open, but not for writing.

The POSIX docs say this
http://pubs.opengroup.org/onlinepubs/009695399/functions/lockf.html

and a simple test program confirms it is the case.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
