From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] mm, madvise: fail with ENOMEM when splitting vma will
 hit max_map_count
Date: Wed, 25 Jan 2017 14:14:55 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1701251407290.118946@chino.kir.corp.google.com>
References: <alpine.DEB.2.10.1701241431120.42507@chino.kir.corp.google.com> <4c884355-0753-3b6e-a5a5-27b2a426c88b@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4c884355-0753-3b6e-a5a5-27b2a426c88b-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anshuman Khandual <khandual-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jerome Marchand <jmarchan-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 25 Jan 2017, Anshuman Khandual wrote:

> But in the due course there might be other changes in number of VMAs of
> the process because of unmap() or merge() which could reduce the total
> number of VMAs and hence this condition may not exist afterwards. In
> that case EAGAIN still makes sense.
> 

Imagine a singlethreaded process that is operating on its own privately 
mapped memory.  Attempting to split an existing vma and meeting 
vm.max_map_count is not something that will be fixed by trying again, i.e. 
it is not helpful to loop when madvise() returns -1 with errno EAGAIN if 
vm.max_map_count will always be encountered.  The other cases where ENOMEM 
is blindly converted to EAGAIN is when slab allocation fails which can 
encounter external freeing, the meaning of "kernel resource is temporarily 
unavailable."  There is no such guarantee for vm.max_map_count, so ENOMEM 
clearly indicates the failure.

After this, it makes sense for userspace to loop for advice such as 
MADV_DONTNEED because we are actively freeing memory when EAGAIN is 
returned.  If we are meeting vm.max_map_count, this will infinitely loop.  
This is the case in tcmalloc and this patch addresses the issue when 
vm.max_map_count is low.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
