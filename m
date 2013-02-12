From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing socket
Date: Tue, 12 Feb 2013 19:41:40 +0100
Message-ID: <511A8CE4.1090603@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

ping Michael

On Fri, 7 Oct 2011, Michael Kerrisk wrote:
 > Hi Lukas
 >
 > On Fri, Oct 7, 2011 at 9:09 AM, Lukas Czerner <lczerner@> wrote:
 >> On Fri, 7 Oct 2011, Michael Kerrisk wrote:
 >>
 >>> Lukas,
 >>>
 >>> On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner@...> wrote:
 >>>> When dealing with sockets, we have to be sure that there is no recv
 >>>> still blocking on it on another thread, otherwise it might block
 >>>> forever, since no more messages will be send via the socket. We
 >>>> should advice to use shutdown before closing socket.
 >>>
 >>> I'm looking into this now. The picture may be more complex than
 >>> this. Tell me, so you have a Solaris system available for testing?
 >>>
 >>> Thanks,
 >>
 >> Hi Michael,
 >>
 >> Thanks for looking into this. Unfortunately I do not have any
 >> Solaris system for testing, that was a customer report. His
 >> complaint was mainly not because the behaviour on Linux differs, but
 >> because this was not documented anywhere.
 >
 > Okay. I will see if I can find a test system somewhere. (The system I
 > used to use seems to have gone away.)
 >
 > Just FYI: I confirmed what you are seeing, but the issue seems more
 > general: basically, closing a file descriptor in one thread while
 > reading in another thread does not cause the read operation to
 > terminate (it will still read data if/when it becomes available).
 >
 > By the way, I'm wondering about creating a small repo of test
 > programs. I might like to add a modified version of your test program
 > to that repo. Can you put that code under a Free License and supply a
 > copyright?
 >
 > Thanks,
 >
 > Michael

Hi Michael,

no problem, here is the program, feel free to update it as you like.
Thanks for looking into this.

-Lukas
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
