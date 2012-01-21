From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: aio_error query
Date: Sat, 21 Jan 2012 21:48:20 +0000
Message-ID: <4F1B32A4.1010809@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

http://www.kernel.org/doc/man-pages/online/pages/man3/aio_error.3.html

Is this really positive? errno is an int, and the values I think are not 
guaranteed to be positive (like with glibc). I work on a system where 
they are all negative.

        *  A positive error, if the asynchronous I/O operation failed. 
This is the
           same value that would have been stored in the errno variable 
in the case of
           a synchronous read(2), write(2), fsync(2), or fdatasync(2) call.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
