From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mmap.2: document the munmap exception for underlying page size
Date: Fri, 24 Jul 2015 08:57:34 +0200
Message-ID: <CAKgNAkj+FvuXh0sjx6A_RD9_0BaYm_xsyXS6Ym5svcmXtBVKmg@mail.gmail.com>
References: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com>
 <55B027D3.4020608@oracle.com> <alpine.DEB.2.10.1507221646100.14953@chino.kir.corp.google.com>
 <55B0E900.8090207@gmail.com> <alpine.DEB.2.10.1507231349080.31024@chino.kir.corp.google.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1507231349080.31024-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>, Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello David,

On 23 July 2015 at 22:52, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, 23 Jul 2015, Michael Kerrisk (man-pages) wrote:
>
>> >> Should we also add a similar comment for the mmap offset?  Currently
>> >> the man page says:
>> >>
>> >> "offset must be a multiple of the page size as returned by
>> >>  sysconf(_SC_PAGE_SIZE)."
>> >>
>> >> For hugetlbfs, I beieve the offset must be a multiple of the
>> >> hugetlb page size.  A similar comment/exception about using
>> >> the "underlying page size" would apply here as well.
>> >>
>> >
>> > Yes, that makes sense, thanks.  We should also explicitly say that mmap(2)
>> > automatically aligns length to be hugepage aligned if backed by hugetlbfs.
>>
>> And, surely, it also does something similar for mmap()'s 'addr'
>> argument?
>>
>> I suggest we add a subsection to describe the HugeTLB differences. How
>> about something like:
>>
>>    Huge page (Huge TLB) mappings
>>        For  mappings  that  employ  huge pages, the requirements for the
>>        arguments  of  mmap()  and  munmap()  differ  somewhat  from  the
>>        requirements for mappings that use the native system page size.
>>
>>        For mmap(), offset must be a multiple of the underlying huge page
>>        size.  The system automatically aligns length to be a multiple of
>>        the underlying huge page size.
>>
>>        For  munmap(),  addr  and  length  must both be a multiple of the
>>        underlying huge page size.
>> ?
>>
>
> Looks good, please add my acked-by.

Done. Thanks for checking the text.

> The commit that expanded on the
> documentation of this behavior was
> 80d6b94bd69a7a49b52bf503ef6a841f43cf5bbb.
>
> Answering from your other email, no, this behavior in the kernel has not
> changed recently but we found it wasn't properly documented so we wanted
> to fix that both in the kernel tree and in the man-pages to make it
> explicit.

Okay -- thanks for the clarification.

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
