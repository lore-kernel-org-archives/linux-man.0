From: Nick Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Wed, 2 May 2012 01:50:46 +1000
Message-ID: <CAPa8GCCgLUt1EDAy7-O-mo0qir6Bf5Pi3Va1EsQ3ZW5UU=+37g@mail.gmail.com>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
	<CAHGf_=qdE3yNw=htuRssfav2pECO1Q0+gWMRTuNROd_3tVrd6Q@mail.gmail.com>
	<CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com>
	<x49ehr4lyw1.fsf@segfault.boston.devel.redhat.com>
	<CAHGf_=rzcfo3OnwT-YsW2iZLchHs3eBKncobvbhTm7B5PE=L-w@mail.gmail.com>
	<x491un3nc7a.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x491un3nc7a.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, mgorman-l3A5Bk7waGM@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Woodman <lwoodman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2 May 2012 01:38, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Tue, May 1, 2012 at 11:11 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrot=
e:
>>> KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>
>>>>> Hello,
>>>>>
>>>>> Thank you revisit this. But as far as my remember is correct, thi=
s issue is NOT
>>>>> unaligned access issue. It's just get_user_pages(_fast) vs fork r=
ace issue. i.e.
>>>>> DIRECT_IO w/ multi thread process should not use fork().
>>>>
>>>> The problem is, fork (and its COW logic) assume new access makes c=
ow break,
>>>> But page table protection can't detect a DMA write. Therefore DIO =
may override
>>>> shared page data.
>>>
>>> Hm, I've only seen this with misaligned or multiple sub-page-sized =
reads
>>> in the same page. =C2=A0AFAIR, aligned, page-sized I/O does not get=
 split.
>>> But, I could be wrong...
>>
>> If my remember is correct, the reproducer of past thread is misleadi=
ng.
>>
>> dma_thread.c in
>> http://lkml.indiana.edu/hypermail/linux/kernel/0903.1/01498.html has
>> align parameter. But it doesn't only change align. Because of, every
>> worker thread read 4K (pagesize), then
>> =C2=A0- when offset is page aligned
>> =C2=A0 =C2=A0 -> every page is accessed from only one worker
>> =C2=A0- when offset is not page aligned
>> =C2=A0 =C2=A0 -> every page is accessed from two workers
>>
>> But I don't remember why two threads are important things. hmm.. I'm
>> looking into the code a while.
>> Please don't 100% trust me.
>
> I bet Andrea or Larry would remember the details.

KOSAKI-san is correct, I think.

The race is something like this:

DIO-read
    page =3D get_user_pages()
                                                        fork()
                                                            COW(page)
                                                         touch(page)
    DMA(page)
    page_cache_release(page);

So whether parent or child touches the page, determines who gets the
actual DMA target, and who gets the copy.

2 threads are not required, but it makes the race easier to code and a
larger window, I suspect.

It can also be hit with a single thread, using AIO.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
