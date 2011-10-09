From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: alphabetic index feedback
Date: Sun, 09 Oct 2011 23:59:05 +0100
Message-ID: <4E922739.8050900@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

Just looking at this page:

http://www.man7.org/linux/man-pages/online/dir_all_alphabetic.html


I propose to clarify a few entries:
"accept4(2) - accept a connection on a socket"

Changed to:
"accept4(2) - accept a connection on a socket with flags"


current:
     acos(3) - arc cosine function
     acosf(3) - arc cosine function

Propose to change to:
     acos(3) - double precision arc cosine function
     acosf(3) - float precision arc cosine function
     acosl(3) - long double precision arc cosine function

^ Note, the last one is missing from current alphabetic index currently.

There are other similar variations in function returns, float, double, 
so could be good to update those as well.


" aio_init(3) - POSIX asynchronous I/O initialization"

All the other aio functions don't mention "POSIX", so thinking of 
consistency, could be removed from this one. Or perhaps added to all the 
others.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
