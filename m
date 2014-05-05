From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Mon, 5 May 2014 14:02:22 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1405051401560.2223@localhost.localdomain>
References: <CAKgNAkibmSZBD4ThhuGg7sJuGBVR+pfMe30b-HXQ0BhYr1Uy2w@mail.gmail.com> <1398866967-26887-1-git-send-email-lczerner@redhat.com> <53610D4A.3090506@gmail.com> <alpine.LFD.2.00.1404301651060.2100@localhost.localdomain> <5361533A.1080705@gmail.com>
 <53645D7C.4060701@gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1274292007-1399291345=:2223"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53645D7C.4060701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1274292007-1399291345=:2223
Content-Type: TEXT/PLAIN; charset=windows-1252
Content-Transfer-Encoding: 8BIT

On Sat, 3 May 2014, Michael Kerrisk (man-pages) wrote:

> Date: Sat, 03 May 2014 05:07:40 +0200
> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: Lukáš Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2] fallocate.2: Document FALLOC_FL_ZERO_RANGE
> 
> Hi Lukáš
> 
> Ping on the question below...
> 
> Cheers,
> 
> Michael
> 
> 
> On 04/30/2014 09:47 PM, Michael Kerrisk (man-pages) wrote:
> > Lukáš,
> > 
> > On 04/30/2014 04:54 PM, Lukáš Czerner wrote:
> >> On Wed, 30 Apr 2014, Michael Kerrisk (man-pages) wrote:
> >>
> >>> Date: Wed, 30 Apr 2014 16:48:42 +0200
> >>> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> >>> Subject: Re: [PATCH v2] fallocate.2: Document FALLOC_FL_ZERO_RANGE
> >>>
> >>> Hi Lukas
> >>>
> >>> On 04/30/2014 04:09 PM, Lukas Czerner wrote:
> >>>> FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
> >>>> for zeroing ranges in the allocated space in a file.
> >>>>
> >>>> Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>> v2: Rebase and update the description
> >>>>
> >>>>  man2/fallocate.2 | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> >>>>  1 file changed, 45 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> >>>> index 73c4f12..30f27c3 100644
> >>>> --- a/man2/fallocate.2
> >>>> +++ b/man2/fallocate.2
> >>>> @@ -180,6 +180,48 @@ ext4 (only for extent-based files)
> >>>>  .\" commit 9eb79482a97152930b113b51dff530aba9e28c8e
> >>>>  and XFS.
> >>>>  .\" commit e1d8fb88a64c1f8094b9f6c3b6d2d9e6719c970d
> >>>> +.SS Zeroing file space
> >>>> +Specifying
> >>>> +.BR FALLOC_FL_ZERO_RANGE
> >>>> +flag (available since Linux 3.14) in
> >>>> +.I mode
> >>>> +zeroes space in the byte range starting at
> >>>> +.I offset
> >>>> +and continuing for
> >>>> +.I len
> >>>> +bytes.
> >>>> +Within the specified range, blocks are preallocated for the regions
> >>>> +that span the holes in the file. After a successful call, subsequent
> >>>> +reads from this range will return zeroes.
> >>>> +
> >>>> +Zeroing is done within the file system preferably by converting range into
> >>>> +unwritten extents which requires very little IO to be issued mostly for
> >>>> +metadata. This means that the range will not be physically zeroed out
> >>>> +on the device.
> >>>
> >>> I just want to confirm my understanding of what's going on here.
> >>> FALLOC_FL_ZERO_RANGE is serving at least two purposes:
> >>> 1. Future reads from the specified range will return zero.
> >>> 2. Blocks (in the form of extents) will be preallocated for the holes 
> >>>    in the range, thus ensuring that the necessary storage space is 
> >>>    allocated for the file. However, those allocated blocks won't actually
> >>>    be written to. (Metadata trickery will ensure that reads from that
> >>>    region won't actually touch the blocks; the kernel will simply deliver
> >>>    back zeroes.)
> >>>
> >>> Right?
> >>
> >> Yes, that's exactly right.
> > 
> > Thanks.
> > 
> >>> And a question: does FALLOC_FL_ZERO_RANGE work for non-extent-based 
> >>> filesystems? If yes, how is FALLOC_FL_ZERO_RANGE implemented? Are the
> >>> blocks corresponding to a hole actually allocated and explicitly 
> >>> written with zeroes?
> >>
> >> As it is now, FALLOC_FL_ZERO_RANGE does not work on non-extent based
> >> files. This is also the case for collapse range and the regular
> >> preallocation at least in ext4 case.
> > 
> > Okay -- see my comment below..
> > 
> >>>> +
> >>>> +If the
> >>>> +.B FALLOC_FL_KEEP_SIZE
> >>>> +flag is specified in
> >>>> +.IR mode ,
> >>>> +the behavior of the call is similar,
> >>>> +but the file size will not be changed even if
> >>>> +.IR offset + len
> >>>> +is greater than the file size. This behaviour is the same as when
> >>>> +preallocating space with
> >>>> +.B FALLOC_FL_KEEP_SIZE
> >>>> +specified.
> >>>> +
> >>>> +Not all filesystems support
> >>>> +.BR FALLOC_FL_ZERO_RANGE ;
> >>>> +if a filesystem doesn't support the operation, an error is returned.
> >>>> +The operation is supported on at least the following filesystems
> >>>> +.IP * 3
> >>>> +XFS (since Linux 2.14)
> >>>> +.\" commit 376ba313147b4172f3e8cf620b9fb591f3e8cdfa
> >>>> +.IP *
> >>>> +ext4 (since Linux 3.14)
> >>>> +.\" commit b8a8684502a0fc852afa0056c6bb2a9273f6fcc0
> >>>> +
> > 
> > So for these two cases, XFS and ext4, should we perhaps better say 
> > 
> >      XFS, for extent based files (since Linux 3.14)

XFS does not have non-extent based files. I'll resend.

Thanks!
-Lukas

> >      ext4, for extent based files (since Linux 3.14)
> > ?
> > 
> > Cheers,
> > 
> > Michael
> > 
> > 
> >>>>  .SH RETURN VALUE
> >>>>  On success,
> >>>>  .BR fallocate ()
> >>>> @@ -243,7 +285,9 @@ no other flags are permitted with
> >>>>  .B EINVAL
> >>>>  .I mode
> >>>>  is
> >>>> -.BR FALLOC_FL_COLLAPSE_RANGE ,
> >>>> +.BR FALLOC_FL_COLLAPSE_RANGE
> >>>> +or
> >>>> +.BR FALLOC_FL_ZERO_RANGE,
> >>>>  but the file referred to by
> >>>>  .I fd
> >>>>  is not a regular file.
> >>>>
> >>>
> >>>
> >>>
> >>
> > 
> > 
> 
> 
> 
--8323328-1274292007-1399291345=:2223--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
