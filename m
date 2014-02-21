From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: *at.2 man pages?
Date: Fri, 21 Feb 2014 13:40:23 +0100
Message-ID: <CAKgNAkiptFYeop4wnXRkiPQv_PoG3OF_spwptzsJDy3gReaCNg@mail.gmail.com>
References: <20140221014855.GA29290@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221014855.GA29290-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Christoph,

On Fri, Feb 21, 2014 at 2:48 AM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> Is there a good reason we have all these separate *at manpages?  To me
> it would seem cleaner to have those documented as minor variant in the
> same man page as the older version of the call.

Thanks for the note.

I had been pondering that same point myself lately. At the time that I
wrote those pages, the APIs were not part of POSIX and (in most cases)
were not available on other systems. So, back in 2006, it made some
sense to wall them off into their own separate pages. Eight years
later, with the APIs now all in POSIX (except scandirat()), less so.

So, your comment was enough to prompt me to make the change I'd been
considering for a while. I've done the merging for the following
pages:

faccessat(2)
fchmodat(2)
fchownat(2)
fstatat(2)
linkat(2)
mkdirat(2)
mknodat(2)
openat(2)
readlinkat(2)
renameat(2)
symlinkat(2)
unlinkat(2)
mkfifoat(3)
scandirat(3)

Each of those pages has been merged into its traditional counterpart.

I didn't make such a change for utimensat(2), which is different
enough from utime(2) that it warrants a separate page, IMO. Unlike the
other *at() pages, the utimensat(2) was also already self-contained,
rather than defining itself in terms of differences from utime(2) as
the other *at() pages did. I did however add a note to utime() to make
it clearer that modern application may want to use utimensat(2).

Simon, David: in most cases I've tried to break the changes to the
pages into certain steps that *may* help you unpick what has changed
as you come to do the translations. (There are a few minor content
changes in addition to the merging.) I believe that nothing got lost
in merging the pages, but I'd appreciate it if you kept an eye out to
make sure that I didn't mess up anywhere.

The changes have been published to Git.

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
