From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: Incorrect documentation for tgkill syscall when tgid==-1
Date: Tue, 23 Dec 2014 12:14:21 -0500
Message-ID: <20141223171421.GZ4574@brightrain.aerifal.cx>
References: <20141219020553.GA23392@brightrain.aerifal.cx>
 <54998AC2.70202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54998AC2.70202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 23, 2014 at 04:31:14PM +0100, Michael Kerrisk (man-pages) wrote:
> > Since there's therefore no way to achieve the same behavior as tkill
> > using the tgkill syscall, I'd also like to request a removal of the
> > text claiming tkill is obsolete. tgkill does not solve the race
> > condition it claims to solve (this is documented to some extent in the
> > relevant git commits to musl libc, and I intend to write more on the
> > issue later) nor is it needed to solve the race (tkill works just as
> > well if used correctly).
> 
> I guess the relevant bug here is
> 
>     http://sourceware.org/bugzilla/show_bug.cgi?id=12889
> 
> right?
> 
> I'm a little puzzled. In that bug report, you say:
> 
>      (The tgkill syscall was designed to eliminate a similar race
>      condition in tkill, but it only succeeded in eliminating races
>      where the tid gets reused in a different process, and does not
>      help if the same tid gets assigned to a new thread in the
>      same process.)
> 
> Is it not the case that tgkill() solves *some* of the race conditions
> that tkill() is vulnerable to (i.e., TID recycled in a different 
> process), and therefore is an improvement on tkill() (i.e., renders
> it obsolete)?

Yes, I should have been more precise in my statement. It does solve
that special case, but it's neither necessary nor sufficient to solve
the problem in general. tkill is perfectly usable for solving the
problem in general (it just requires locking local to the process, and
solving the problem using tgkill would require the same locking), and
there are some reasons to prefer it.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
