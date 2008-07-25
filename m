From: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: Report bugs for variations in error handling in math functions?
Date: Fri, 25 Jul 2008 17:06:17 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0807251701570.7701@digraph.polyomino.org.uk>
References: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com>
 <Pine.LNX.4.64.0807251535040.7701@digraph.polyomino.org.uk>
 <cfd18e0f0807250853q636b8d2dx8cefd53bc672b7a9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807250853q636b8d2dx8cefd53bc672b7a9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 25 Jul 2008, Michael Kerrisk wrote:

> Not even one approach is consistent.  Many functions don't set errno.
> But there are one or two that don't raise exceptions: the Bessel
> functions (j0(), y0 etc), for example.  It's all a bit of a mess,
> unfortunately.

Those functions aren't in C99.  They are however in POSIX, which defines 
C99-like error handling requirements, though a lot of errors are "may 
occur" just as a lot of C99 ones are.  (But if a "may occur" error is 
indicated by one of errno and exceptions, it must be indicated by both if 
math_errhandling says both forms of error handling are supported.)

(Bessel functions under different names and a lot of other functions are 
in DIS 24747, which passed its ballot for approval as an International 
Standard.  But I don't expect it to be integrated in the next revision of 
the C standard; my understanding is also that all of C++ TR1 *apart* from 
special mathematical functions (much the same set) is being integrated in 
C++0x.)

-- 
Joseph S. Myers
joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
