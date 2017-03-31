From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: statx manpage
Date: Fri, 31 Mar 2017 17:43:23 +0100
Message-ID: <29845.1490978603@warthog.procyon.org.uk>
References: <20170331155653.GA27655@infradead.org> <20170307050140.GA12946@infradead.org> <20170307000609.GG5280@birch.djwong.org> <10435.1488907375@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331155653.GA27655-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Content-ID: <29844.1490978603.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Darrick J. Wong" <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xfs <linux-xfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> Quoting the rendered page below:
> 
> >   Invoking statx():
>  
>  This is an odd header for a man page.  Usually this would start as
> 
> DESCRIPTION
> 
> (in bold).

Yes, I know.  But it seems to make more sense this way round.  Putting the
struct definition before the description of how to access it means that I can
refer to it in the definitions of the flags that you OR into the mask and
means you get to the struct much faster.  Maybe I should put it under the
SYNOPSIS section?

> >       [*] By absolute path.
> 
> Odd way to enumerate in a man page - I'll leave it to the linux-man regulars
> to point out the right way, because I don't know it off-hand.

Me neither.

> >       AT_EMPTY_PATH (since Linux 2.6.39)
> 
> All these have been there since statx was added, so we can remove the
> annotation.

You're not the first to note this.  I've already taken that out.

> >           STATX_BASIC_STATS   [The stuff in the normal stat struct]
> 
> Please enumerate the actual fields.

They're enumerated immediately prior.  I've changed it to:

	STATX_BASIC_STATS   [All of the above]

> >           STATX_ALL           [All currently available stuff]
> 
> How about "All currently available fields"

Sure.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
