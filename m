From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Subject: Re: [patch] mm, madvise: fail with ENOMEM when splitting vma will hit
 max_map_count
Date: Wed, 25 Jan 2017 16:00:13 +0530
Message-ID: <4c884355-0753-3b6e-a5a5-27b2a426c88b@linux.vnet.ibm.com>
References: <alpine.DEB.2.10.1701241431120.42507@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1701241431120.42507@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Johannes Weiner <hannes@cmpxchg.org>, mtk.manpages@gmail.com, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-man@vger.kernel.org

On 01/25/2017 04:02 AM, David Rientjes wrote:
> If madvise(2) advice will result in the underlying vma being split and
> the number of areas mapped by the process will exceed
> /proc/sys/vm/max_map_count as a result, return ENOMEM instead of EAGAIN.
> 
> EAGAIN is returned by madvise(2) when a kernel resource, such as slab,
> is temporarily unavailable.  It indicates that userspace should retry the
> advice in the near future.  This is important for advice such as
> MADV_DONTNEED which is often used by malloc implementations to free
> memory back to the system: we really do want to free memory back when
> madvise(2) returns EAGAIN because slab allocations (for vmas, anon_vmas,
> or mempolicies) cannot be allocated.
> 
> Encountering /proc/sys/vm/max_map_count is not a temporary failure,
> however, so return ENOMEM to indicate this is a more serious issue.  A
> followup patch to the man page will specify this behavior.

But in the due course there might be other changes in number of VMAs of
the process because of unmap() or merge() which could reduce the total
number of VMAs and hence this condition may not exist afterwards. In
that case EAGAIN still makes sense.
