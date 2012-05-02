From: Nick Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Wed, 2 May 2012 13:10:04 +1000
Message-ID: <CAPa8GCB7UGe0xr_pagbAJQAXn1t03m_8sraYxpkdbY1F3o7GRw@mail.gmail.com>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
	<CAHGf_=qqiast+6XzGnq+LRdFXoWG9h2MkofmjS1h5OeNPRyWfw@mail.gmail.com>
	<CAKgNAkjAOGM+mZLkXGiDFYsnMCpJsxx=Nd5pZfx-_f4B1jvh+A@mail.gmail.com>
	<CAPa8GCC7tHm_8Ks_=tM4x544+SEtkVk6TMAF3KPsVqzNOi-naA@mail.gmail.com>
	<alpine.LSU.2.00.1205011952040.1293@eggly.anvils>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.1205011952040.1293-fupSdm12i1nKWymIFiNcPA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, mgorman-l3A5Bk7waGM@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2 May 2012 13:04, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, 2 May 2012, Nick Piggin wrote:
>> On 2 May 2012 03:56, Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> > In the light of all of the comments, can someone revise the man-pages
>> > patch that Jan sent?
>>
>> This does not quite describe the entire situation, but something understandable
>> to developers:
>>
>> O_DIRECT IOs should never be run concurrently with fork(2) system call,
>> when the memory buffer is anonymous memory, or comes from mmap(2)
>> with MAP_PRIVATE.
>>
>> Any such IOs, whether submitted with asynchronous IO interface or from
>> another thread in the process, should be quiesced before fork(2) is called.
>> Failure to do so can result in data corruption and undefined behavior in
>> parent and child processes.
>>
>> This restriction does not apply when the memory buffer for the O_DIRECT
>> IOs comes from mmap(2) with MAP_SHARED or from shmat(2).
>
> Nor does this restriction apply when the memory buffer has been advised
> as MADV_DONTFORK with madvise(2), ensuring that it will not be available
> to the child after fork(2).

Yes of course, I forgot that was exported too.

>
>>
>>
>>
>> Is that on the right track? I feel it might be necessary to describe this
>> allowance for MAP_SHARED, because some databases may be doing
>> such things, and anyway it gives apps a potential way to make this work
>> if concurrent fork + DIO is very important.
>
> Looks good, but we do need a reference to MADV_DONTFORK, perhaps as above.

Yep, thanks Hugh.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
