From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 57181] man pages for C structs
Date: Sat, 15 Mar 2014 13:28:12 +0000
Message-ID: <bug-57181-11311-4EEooUkWsf@https.bugzilla.kernel.org/>
References: <bug-57181-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-57181-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57181

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Serge van den Boom from comment #2)
> Ok, how is this for a start:
> 
> timeval -> ctime(3)
> timespec -> nanosleep(2)

So here's an example of ptroblem. 'struct timespec' is in 15 pages. Why point
to this one in particular. I can see it's not a bad page to point to. But, if
you are using one of the other APIs, then laning on nanosleep(2) would be
confusing.


> sockaddr -> bind(2)
> sockaddr_in -> ip(7)
> in_addr -> inet(3)
> in_addr -> ip(7)  
> in_addr_t -> inet(3)
> sockaddr_in6 -> ipv6(7)
> in6_addr -> ipv6(7)
> addrinfo -> getaddrinfo(3)
> iovec -> recv(2)
> msghdr -> send(2) / recv(2)
> cmsghd -> cmsg(3)
> dirent -> readdir(3)
> pollfd -> poll(2)
> epoll_event -> epoll_ctl(2)
> rlimit -> getrlimit(2)
> 
> To further illustrate why this would be useful, consider the following
> situation: you are coding in C and want to use sendmsg(). Before you write
> that line, you would define a struct msghdr, and fill its fields. But you
> don't recall what exactly the fields of struct msghdr should contain.
> Right now, you'd go through the following steps:
> 1. Where would I find the definition of msghdr? I want to use it in
> 'sendmesg', so that's probably where it is.
> 2. 'man sendmesg'
> 3. search for msghdr
> With separate pages per struct, you would be able to skip steps 1 and 2. In
> fact, if you use Vim, you would just enter 'K' when the cursor is on
> 'msghdr'.
> With redirects, you'd still have step 3, but you wouldn't have the
> (distracting) step of deciding where you'd expect to find it.
> 
> (Also, 'struct mesghdr' includes a field of type 'struct iovec', which is
> not defined in send(2). This is probably a separate issue though.)
> 
> For structures like sockaddr_in, step 1 is even harder, as there is no clue
> to where to find a page on its definition. You would have to know somehow
> that it can be found in ip(7).

I don't really buy this reasoning. If I'm using sendmsg(), then I'm probably on
that page already before step 1.

So, I don't think this approach (llinks as described above) is really helpful.

Now, whether there should be separate pages for a few structures is something
to think about more, but I'd need to see a good reason in each case.
(sigevent(7) had a good reason, for example.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
