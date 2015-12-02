From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: include error in example code
Date: Wed, 02 Dec 2015 20:56:07 +0100
Message-ID: <565F4CD7.2080403@gmail.com>
References: <F1C54C2B29AD45429DFA1538CDE11207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F1C54C2B29AD45429DFA1538CDE11207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alikewmk <alikewmk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/2015 02:05 AM, alikewmk wrote:
> Hello, 
> 
> The example code under
> http://man7.org/linux/man-pages/man7/aio.7.html lacks a include file
> `fcntl.h`, since the code is using `O_RDONLY` in `open()` function,
> according to the GNU document here
> (http://www.gnu.org/software/libc/manual/html_node/Opening-and-Closing-Files.html),
> it needs to be included.
> 
> I tested the code after including the `fcntl.h` file and it worked.> 
> Thanks. :) 

Thanks, Meikun. I added that header file to the example code.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
