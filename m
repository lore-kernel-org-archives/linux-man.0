From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: io_submit
Date: Thu, 17 Oct 2013 13:18:56 +0100
Message-ID: <CAGc9EvexR6PGkC+AprPhpU38XVsyDcuE2rNTHVv-_mHVE4W3jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I saw that all these pages (list below) have "/* Defines needed types
*/" after the aio_abi.h include in the SYNOPSIS. I don't think this is
needed, as other man pages don't state this.

Also, as aio_abi.h does not declare these functions, would it be
better to specify the necessary include <libaio.h>?
-- NB. Possibly I am not understanding something, as it may be
different as they are kernel function interfaces.

http://man7.org/linux/man-pages/man2/io_submit.2.html
http://man7.org/linux/man-pages/man2/io_cancel.2.html
http://man7.org/linux/man-pages/man2/io_destroy.2.html
http://man7.org/linux/man-pages/man2/io_getevents.2.html

http://man7.org/linux/man-pages/man2/io_setup.2.html

Other feedback:

A) io_getevents page says <linux/time.h>  is needed, however does it
need this if <libaio.h> is wrriten? libaio.h forward declares on line
33 struct timespec

B) io_setup in NOTES section starts with:

"Glibc does not provide a wrapper function for this system call.  You
could invoke it using syscall(2).  But instead, you probably want to
use the io_setup() wrapper function provided by libaio."

Normally sentences don't start with But in this way, also could it say
the io_setup wrapper function name? I looked, but could not find what
it was called. http://www.kernel.org/pub/linux/libs/aio/ is empty! Not
sure what is wrong with io_setup though, as developers can call the
other functions still which are all part of the same kernel interface
<linux/aio_abi.h>


I propose:

"Glibc does not provide a wrapper function for this system call.  You
could invoke it using syscall(2). However, better to
use the io_setup() wrapper function provided by libaio io_setup_XYZ_WRAPPER."

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
