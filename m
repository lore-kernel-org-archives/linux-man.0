From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] mmap.2: document the munmap exception for underlying
 page size
Date: Wed, 22 Jul 2015 16:49:23 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1507221646100.14953@chino.kir.corp.google.com>
References: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com> <55B027D3.4020608@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B027D3.4020608-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>, Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 22 Jul 2015, Mike Kravetz wrote:

> On 07/21/2015 05:41 PM, David Rientjes wrote:
> > munmap(2) will fail with an errno of EINVAL for hugetlb memory if the
> > length is not a multiple of the underlying page size.
> > 
> > Documentation/vm/hugetlbpage.txt was updated to specify this behavior
> > since Linux 4.1 in commit 80d6b94bd69a ("mm, doc: cleanup and clarify
> > munmap behavior for hugetlb memory").
> > 
> > Signed-off-by: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > ---
> >   man2/mmap.2 | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/man2/mmap.2 b/man2/mmap.2
> > --- a/man2/mmap.2
> > +++ b/man2/mmap.2
> > @@ -383,6 +383,10 @@ All pages containing a part
> >   of the indicated range are unmapped, and subsequent references
> >   to these pages will generate
> >   .BR SIGSEGV .
> > +An exception is when the underlying memory is not of the native page
> > +size, such as hugetlb page sizes, whereas
> > +.I length
> > +must be a multiple of the underlying page size.
> >   It is not an error if the
> >   indicated range does not contain any mapped pages.
> >   .SS Timestamps changes for file-backed mappings
> > 
> > --
> 
> Should we also add a similar comment for the mmap offset?  Currently
> the man page says:
> 
> "offset must be a multiple of the page size as returned by
>  sysconf(_SC_PAGE_SIZE)."
> 
> For hugetlbfs, I beieve the offset must be a multiple of the
> hugetlb page size.  A similar comment/exception about using
> the "underlying page size" would apply here as well.
> 

Yes, that makes sense, thanks.  We should also explicitly say that mmap(2) 
automatically aligns length to be hugepage aligned if backed by hugetlbfs.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
