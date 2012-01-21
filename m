From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aio_return man page different from aio_read
Date: Sat, 21 Jan 2012 21:44:46 +0000
Message-ID: <4F1B31CE.2010404@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

aio_read also describes aio_return will return -1 on error:

http://www.kernel.org/doc/man-pages/online/pages/man3/aio_read.3.html

However, aio_return man page does not explain this, it says the error 
code returned directly:

"If the asynchronous I/O operation has completed, this function returns the
        value that would have been returned in case of a synchronous 
read(2),
        write(2), fsync(2) or fdatasync(2), call."

http://www.kernel.org/doc/man-pages/online/pages/man3/aio_return.3.html


I don't know which is correct.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
