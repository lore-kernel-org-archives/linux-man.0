From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Tue, 6 May 2014 11:58:28 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1405061156290.2255@localhost.localdomain>
References: <1399291463-13683-1-git-send-email-lczerner@redhat.com> <536787C0.9070204@gmail.com> <alpine.LFD.2.00.1405051504210.2223@localhost.localdomain> <CAKgNAkg0-za69pesggjyEzSPEwQ60TtgEbhoUoZsg6F_9qsMbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-989582572-1399370311=:2255"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg0-za69pesggjyEzSPEwQ60TtgEbhoUoZsg6F_9qsMbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-989582572-1399370311=:2255
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 May 2014, Michael Kerrisk (man-pages) wrote:

> Date: Mon, 5 May 2014 21:46:22 +0200
> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: Lukáš Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Subject: Re: [PATCH v3] fallocate.2: Document FALLOC_FL_ZERO_RANGE
> 
> Hi Lukáš,
> 
> On Mon, May 5, 2014 at 3:06 PM, Lukáš Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On Mon, 5 May 2014, Michael Kerrisk (man-pages) wrote:
> >
> >> Date: Mon, 05 May 2014 14:44:48 +0200
> >> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: Re: [PATCH v3] fallocate.2: Document FALLOC_FL_ZERO_RANGE
> >>
> >>
> >> On 05/05/2014 02:04 PM, Lukas Czerner wrote:
> >> > FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
> >> > for zeroing ranges in the allocated space in a file.
> >> >
> >> > Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> > ---
> >> > v2: Rebase and update the description
> >> > v3: Ext4 zero range on extent based files
> >>
> >> Thank, Lukáš.
> >>
> >> In fact I'd already merged and tweaked your previous patch into
> >> a branch, and the only new piece from this patch that I needed
> >> was the piece about ext4 extent-based files.
> >>
> >> The text now reads:
> >>
> >>    Zeroing file space
> >>        Specifying the FALLOC_FL_ZERO_RANGE flag (available since Linux
> >>        3.14) in mode zeroes space in the byte range starting at offset
> >>        and  continuing  for  len  bytes.   Within the specified range,
> >>        blocks are preallocated for the regions that span the holes  in
> >>        the  file.  After a successful call, subsequent reads from this
> >>        range will return zeroes.
> >>
> >>        Zeroing is done within the filesystem preferably by  converting
> >>        the range into unwritten extents.  This approach means that the
> >>        specified range will  not  be  physically  zeroed  out  on  the
> >>        device, and I/O is required only to update file metadata.
> >
> > mostly for metadata as mentioned in my patch. Because we still need
> > to manually zero out partial blocks. But that's not really all that
> > important.
> 
> Thanks for checking. Now I understand the "mostly"! How about we make the text:
> 
> [[
> Zeroing is done within the filesystem preferably by converting the range into
> unwritten extents.
> This approach means that the specified range will not be physically zeroed
> out on the device (except for partial blocks at the either end of the range),
> and I/O is (otherwise) required only to update file metadata.
> ]]

Perfect. Just get rid of "file" in the "file metadata" and I think
it's ok. The reason is that those are also file system metadata in
the case you're actually allocating blocks.

Thanks!
-Lukas

> 
> ?
> 
> Cheers,
> 
> Michael
> 
> 
> >
> > Thanks!
> > -Lukas
> >
> >>
> >>        If  the  FALLOC_FL_KEEP_SIZE  flag is additionally specified in
> >>        mode, the behavior of the call is similar, but  the  file  size
> >>        will not be changed even if offset+len is greater than the file
> >>        size.  This behaviour is the same as when  preallocating  space
> >>        with FALLOC_FL_KEEP_SIZE specified.
> >>
> >>        Not all filesystems support FALLOC_FL_ZERO_RANGE; if a filesys‐
> >>        tem doesn't support the operation, an error is  returned.   The
> >>        operation is supported on at least the following filesystems:
> >>
> >>        *  XFS (since Linux 3.14)
> >>
> >>        *  ext4, for extent-based files (since Linux 3.14)
> >>    ...
> >>    ERRORS
> >>        EINVAL mode     is     FALLOC_FL_COLLAPSE_RANGE     or     FAL‐
> >>               LOC_FL_ZERO_RANGE, but the file referred to by fd is not
> >>               a regular file.
> >>
> >> Okay?
> >>
> >> Cheers,
> >>
> >> Michael
> >>
> 
> 
> 
> 
--8323328-989582572-1399370311=:2255--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
