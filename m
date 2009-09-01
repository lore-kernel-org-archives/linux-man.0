From: Hugh Dickins <hugh.dickins-IWqWACnzNjwqdlJmJB21zg@public.gmane.org>
Subject: Re: [PATCH 2/3] Add MAP_HUGETLB for mmaping pseudo-anonymous huge
 page regions
Date: Tue, 1 Sep 2009 14:34:09 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0909011418490.8674@sister.anvils>
References: <cover.1251282769.git.ebmunson@us.ibm.com>
 <1c66a9e98a73d61c611e5cf09b276e954965046e.1251282769.git.ebmunson@us.ibm.com>
 <1721a3e8bdf8f311d2388951ec65a24d37b513b1.1251282769.git.ebmunson@us.ibm.com>
 <Pine.LNX.4.64.0908312036410.16402@sister.anvils> <20090901094635.GA7995@us.ibm.com>
 <Pine.LNX.4.64.0909011128530.16601@sister.anvils> <20090901130801.GB7995@us.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090901130801.GB7995-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergman <arnd-r2nGTMty4D4@public.gmane.org>, Mel Gorman <mel-wPRd99KPJ+uzQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 1 Sep 2009, Eric B Munson wrote:
> On Tue, 01 Sep 2009, Hugh Dickins wrote:
> > 
> > That is explained by you #defining MAP_HUGETLB in include/asm-generic/
> > mman-common.h to a number which is already being used for other MAP_s
> > on some architectures.  That's a separate bug which needs to be fixed
> > by distributing the MAP_HUGETLB definition across various asm*/mman.h.
> 
> Would it be okay to keep the define in include/asm-generic/mman.h
> if a value that is known free across all architectures is used?
> 0x080000 is not used by any arch and, AFAICT would work just as well.

That's a very sensible suggestion, but departs from how we have
assigned new numbers up until now: so include/asm-generic/mman-common.h
isn't actually where we'd expect to find a Linux-specific MAP_ define.

I'd say, yes, do that for now, so as not to hit this conflict while
testing in mmotm.  But whether it should stay that way, or later the
arch/*/include/asm/mman.h's be updated as I'd imagined, I don't know.

Arnd, Michael, do you have any views on this?

Thanks,
Hugh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
