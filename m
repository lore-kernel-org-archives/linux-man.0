From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: sync man page in coreutils and man-pages
Date: Mon, 10 Mar 2014 05:10:10 -0700
Message-ID: <20140310121010.GA31927@infradead.org>
References: <531DAA1D.6060705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <531DAA1D.6060705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: coreutils-mXXj517/zsQ@public.gmane.org, Jim Meyering <jim-Oxw1nKZkIVjk1uMJSBkQmQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 10, 2014 at 01:03:41PM +0100, Michael Kerrisk (man-pages) wrote:
>        The  kernel  keeps  data  in  memory to avoid doing (relatively
>        slow) disk reads and writes.  This improves performance, but if
>        the  computer crashes, data may be lost or the file system cor???
>        rupted as a result.  sync ensures that everything in memory  is
>        written to disk.

This part looks correct.

>        sync  should  be  called  before  the processor is halted in an
>        unusual manner (e.g., before causing a kernel panic when debug???
>        ging  new  kernel  code).   In general, the processor should be
>        halted using the shutdown(8) or reboot(8) or halt(8)  commands,
>        which  will  attempt  to  put  the  system in a quiescent state
>        before calling sync(2).  (Various implementations of these com???
>        mands  exist;  consult  your documentation; on some systems one
>        should not call reboot(8) and halt(8) directly.)

This kind of information does not seem useful for a user of a command
line utility, and the last bit seems incorrect at least for Linux.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
