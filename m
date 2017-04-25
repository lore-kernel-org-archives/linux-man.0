From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: Review request: draft ioctl_userfaultfd(2) manual page
Date: Tue, 25 Apr 2017 11:00:48 +0300
Message-ID: <20170425080047.GA16770@rapoport-lnx>
References: <487b2c79-f99b-6d0f-2412-aa75cde65569@gmail.com>
 <9af29fc6-dce2-f729-0f07-a0bfcc6c3587@gmail.com>
 <20170322135423.GB27789@rapoport-lnx>
 <e8c5ca4a-0710-7206-b96e-10d171bda218@gmail.com>
 <20170421110714.GC20569@rapoport-lnx>
 <4c05c2bb-af77-d706-9455-8ceaa5510580@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <4c05c2bb-af77-d706-9455-8ceaa5510580@gmail.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, lkml <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

On Fri, Apr 21, 2017 at 01:41:18PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 

[...]

> > 
> > Yes.
> > Just the future is only a week or two from today as we are at 4.11-rc7 :)
> 
> Yes, I understand :-). So of course there's a *lot* more
> new stuff to document, right?

I've started to add the description of the new functionality to both
userfaultfd.2 and ioctl_userfaultfd.2 and it's somewhat difficult for me to
decide how it would be better to split the information between these two
pages and what should be the pages internal structure.

I even thought about possibility of adding relatively comprehensive
description of userfaultfd as man7/userfaultfd.7 and then keeping the pages
in man2 relatively small, just with brief description of APIs and SEE ALSO
pointing to man7.

Any advise is highly appreciated.
 
> [...]

--
Sincerely yours,
Mike.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
