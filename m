From: Samuel Bronson <naesten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fexecve.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 27 May 2015 11:42:45 -0400
Message-ID: <CAJYzjmf22=VTKOd1Fk-o_vAATp4RRZSoohh-uDdpQHh9UWBdXA@mail.gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 27, 2015 at 6:12 AM, Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> After research, We think fexecve() is thread-safe. But, there
> is not marking of fexecve() in glibc document.

Um, fexecve() is just like execve(), only on a file descriptor.  (In
fact, it appears to be implemented using execve() on
/proc/self/fd/$FD.)

As such, the following point from execve(2) applies:

       *  All threads other than the calling thread are  destroyed  during  an
          execve().   Mutexes, condition variables, and other pthreads objects
          are not preserved.

This does not seem to correspond with the usual notion of "thread
safe", though I guess it would be technically safe to, say, have
several threads racing to run fexecve(). Further text is probably
warranted here.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
