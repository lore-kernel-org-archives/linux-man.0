From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Description of POLLHUP in poll(2)
Date: Sat, 02 May 2015 09:27:01 +0200
Message-ID: <55447C45.1070607@gmail.com>
References: <cone.1280020358.708902.17185.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1280020358.708902.17185.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sam,

On 07/25/2010 03:12 AM, Sam Varshavchik wrote:
> I'd like to propose adding the following to the current, somewhat terse, 
> description of POLLHUP:
> 
> ==
> 
> For stream sockets, this indicates that the peer closed its side of the 
> connection. This does not necessarily imply that there's no more data to be 
> read from the socket. POLLHUP may be set even if some unread data remains in 
> the socket. Applications that need to process all data sent from their 
> socket peer should use read(2) to check for unread data if POLLHUP is set.
> 
> ==
> 
> That's something I didn't know -- I still learn something new every day -- 
> When I get a POLLHUP I've assumed that it indicates an end-of-file 
> condition, but that's not apparently the case, and having this documented 
> would be helpful.

Long after the fact...

I added this text:

[[
Note that when reading from a channel such as a pipe or a stream socket,
this event merely indicates that the peer closed its end of the channel.
Subsequent reads from the channel will return 0 (end of file)
only after all outstanding data in the channel has been consumed.
]]

And also made a similar change in epoll_ctl(2).

Thanks for the report.

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
