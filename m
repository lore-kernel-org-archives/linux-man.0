From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95191] document behavior of open(2) when path names a  fifo
 with no readers
Date: Sun, 22 Mar 2015 15:10:37 +0000
Message-ID: <bug-95191-11311-v83lI7iQe7@https.bugzilla.kernel.org/>
References: <bug-95191-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-95191-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95191

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #8 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello Jason,

(In reply to Jason Vas Dias from comment #0)
> linux 3.13 open() , if the path refers to a fifo, and O_WRONLY is set in
> its flags , but not O_NONBLOCK, then it does not return until a reader has
> connected to the output end of the pipe.
> 
> This fact is not documented anywhere in the open(2) manual page

[...]

> Please add words to the effect :
> 
>   "If the path refers to a named pipe (FIFO), and O_NONBLOCK is not set,
>    open() will block until a reader is connected to the write end of the
> pipe.
>   "
> to the open(2) manual page.

Well, there is already this text in the man page:

    O_NONBLOCK or O_NDELAY
        .... For the handling of FIFOs (named pipes), see also fifo(7).

(Were you aware of the fifo(7) page?)

But it's true that something could be said more prominently in 
open(2), I think. I added the following under NOTES:

   FIFOs
       Opening  the read or write end of a FIFO blocks until the other
       end is also opened (by another process or thread).  See fifo(7)
       for further details.

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
