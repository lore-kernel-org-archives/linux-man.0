From: David Rientjes <rientjes@google.com>
Subject: Re: [patch] mmap.2: document the munmap exception for underlying
 page size
Date: Thu, 23 Jul 2015 13:52:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1507231349080.31024@chino.kir.corp.google.com>
References: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com> <55B027D3.4020608@oracle.com> <alpine.DEB.2.10.1507221646100.14953@chino.kir.corp.google.com> <55B0E900.8090207@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <55B0E900.8090207@gmail.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Hugh Dickins <hughd@google.com>, Davide Libenzi <davidel@xmailserver.org>, Eric B Munson <emunson@akamai.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Thu, 23 Jul 2015, Michael Kerrisk (man-pages) wrote:

> >> Should we also add a similar comment for the mmap offset?  Currently
> >> the man page says:
> >>
> >> "offset must be a multiple of the page size as returned by
> >>  sysconf(_SC_PAGE_SIZE)."
> >>
> >> For hugetlbfs, I beieve the offset must be a multiple of the
> >> hugetlb page size.  A similar comment/exception about using
> >> the "underlying page size" would apply here as well.
> >>
> > 
> > Yes, that makes sense, thanks.  We should also explicitly say that mmap(2) 
> > automatically aligns length to be hugepage aligned if backed by hugetlbfs.
> 
> And, surely, it also does something similar for mmap()'s 'addr'
> argument? 
> 
> I suggest we add a subsection to describe the HugeTLB differences. How 
> about something like:
> 
>    Huge page (Huge TLB) mappings
>        For  mappings  that  employ  huge pages, the requirements for the
>        arguments  of  mmap()  and  munmap()  differ  somewhat  from  the
>        requirements for mappings that use the native system page size.
> 
>        For mmap(), offset must be a multiple of the underlying huge page
>        size.  The system automatically aligns length to be a multiple of
>        the underlying huge page size.
> 
>        For  munmap(),  addr  and  length  must both be a multiple of the
>        underlying huge page size.
> ?
> 

Looks good, please add my acked-by.  The commit that expanded on the 
documentation of this behavior was 
80d6b94bd69a7a49b52bf503ef6a841f43cf5bbb.

Answering from your other email, no, this behavior in the kernel has not 
changed recently but we found it wasn't properly documented so we wanted 
to fix that both in the kernel tree and in the man-pages to make it 
explicit.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
