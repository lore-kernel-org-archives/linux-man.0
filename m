From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Tue, 1 May 2012 11:34:04 -0400
Message-ID: <CAHGf_=rzcfo3OnwT-YsW2iZLchHs3eBKncobvbhTm7B5PE=L-w@mail.gmail.com>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
 <CAHGf_=qdE3yNw=htuRssfav2pECO1Q0+gWMRTuNROd_3tVrd6Q@mail.gmail.com>
 <CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com> <x49ehr4lyw1.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x49ehr4lyw1.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, mgorman-l3A5Bk7waGM@public.gmane.org, npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, May 1, 2012 at 11:11 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>>> Hello,
>>>
>>> Thank you revisit this. But as far as my remember is correct, this =
issue is NOT
>>> unaligned access issue. It's just get_user_pages(_fast) vs fork rac=
e issue. i.e.
>>> DIRECT_IO w/ multi thread process should not use fork().
>>
>> The problem is, fork (and its COW logic) assume new access makes cow=
 break,
>> But page table protection can't detect a DMA write. Therefore DIO ma=
y override
>> shared page data.
>
> Hm, I've only seen this with misaligned or multiple sub-page-sized re=
ads
> in the same page. =A0AFAIR, aligned, page-sized I/O does not get spli=
t.
> But, I could be wrong...

If my remember is correct, the reproducer of past thread is misleading.

dma_thread.c in
http://lkml.indiana.edu/hypermail/linux/kernel/0903.1/01498.html has
align parameter. But it doesn't only change align. Because of, every
worker thread read 4K (pagesize), then
 - when offset is page aligned
    -> every page is accessed from only one worker
 - when offset is not page aligned
    -> every page is accessed from two workers

But I don't remember why two threads are important things. hmm.. I'm
looking into the code a while.
Please don't 100% trust me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
