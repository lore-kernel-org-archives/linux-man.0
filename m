From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ppoll with multiple threads
Date: Sat, 02 May 2015 09:01:21 +0200
Message-ID: <55447641.9090201@gmail.com>
References: <5244AF7E.1020500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5244AF7E.1020500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Pilcher <arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ian,

On 09/27/2013 12:04 AM, Ian Pilcher wrote:
> The select(2) man page was updated about a year ago to clarify the
> behavior of pselect in multi-threaded programs.
> 
> http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/man2/select.2?id=2e72e991695f745d6419feeb77598f61d8c86a52
> 
> Should a similar update be made to poll(2) for ppoll?

Yes. Done. And I made the same change in the description of epoll_pwait().

Thanks,

Michael


> If I'm reading the kernel source (fs/select.c) correctly, both syscalls
> (pselect6 and ppoll) use a (possibly unfortunately named) "sigprocmask"
> function to manipulate the signal mask, so their behavior should be the
> same in this regard.
> 
> Also, it might be nice to clarify that these changes are clarifications
> of existing behavior, rather than new behavior (i.e. clarify the
> clarification).  The current situation is pretty confusing:
> 
> http://stackoverflow.com/questions/17011460/ppoll-vs-pselect-with-multiple-threads
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
