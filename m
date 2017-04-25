From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Review request: draft ioctl_userfaultfd(2) manual page
Date: Tue, 25 Apr 2017 12:59:11 +0200
Message-ID: <CAKgNAkjWPgBtSay0B9V8dD1cEax=0Yk+vZjRrGyfgB-BgQpbvQ@mail.gmail.com>
References: <487b2c79-f99b-6d0f-2412-aa75cde65569@gmail.com>
 <9af29fc6-dce2-f729-0f07-a0bfcc6c3587@gmail.com> <20170322135423.GB27789@rapoport-lnx>
 <e8c5ca4a-0710-7206-b96e-10d171bda218@gmail.com> <20170421110714.GC20569@rapoport-lnx>
 <4c05c2bb-af77-d706-9455-8ceaa5510580@gmail.com> <20170425080047.GA16770@rapoport-lnx>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170425080047.GA16770@rapoport-lnx>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 25 April 2017 at 10:00, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> Hello Michael,
>
> On Fri, Apr 21, 2017 at 01:41:18PM +0200, Michael Kerrisk (man-pages) wrote:
>> Hi Mike,
>>
>
> [...]
>
>> >
>> > Yes.
>> > Just the future is only a week or two from today as we are at 4.11-rc7 :)
>>
>> Yes, I understand :-). So of course there's a *lot* more
>> new stuff to document, right?
>
> I've started to add the description of the new functionality to both
> userfaultfd.2 and ioctl_userfaultfd.2

Thanks for doing this!

> and it's somewhat difficult for me to
> decide how it would be better to split the information between these two
> pages and what should be the pages internal structure.
>
> I even thought about possibility of adding relatively comprehensive
> description of userfaultfd as man7/userfaultfd.7 and then keeping the pages
> in man2 relatively small, just with brief description of APIs and SEE ALSO
> pointing to man7.
>
> Any advise is highly appreciated.

I'm not averse to the notion of a userfaultfd.7 page, but it's a
little hard to advise because I'm not sure of the size and scope of
your planned changes.

In the meantime, I've merged the userfaultfd pages into master,
dropped the "draft" branch, and pushed the updates in master to Git.

Can you write your changes as a series of patches, and perhaps first
give a brief oultine of the proposed changes before getting too far
into the work? Then we could tweak the direction if needed.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
