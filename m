From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Sat, 03 May 2014 05:07:40 +0200
Message-ID: <53645D7C.4060701@gmail.com>
References: <CAKgNAkibmSZBD4ThhuGg7sJuGBVR+pfMe30b-HXQ0BhYr1Uy2w@mail.gmail.com> <1398866967-26887-1-git-send-email-lczerner@redhat.com> <53610D4A.3090506@gmail.com> <alpine.LFD.2.00.1404301651060.2100@localhost.localdomain> <5361533A.1080705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5361533A.1080705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Luk=E1=9A_Czerner?= <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Luk=E1=9A

Ping on the question below...

Cheers,

Michael


On 04/30/2014 09:47 PM, Michael Kerrisk (man-pages) wrote:
> Luk=E1=9A,
>=20
> On 04/30/2014 04:54 PM, Luk=E1=9A Czerner wrote:
>> On Wed, 30 Apr 2014, Michael Kerrisk (man-pages) wrote:
>>
>>> Date: Wed, 30 Apr 2014 16:48:42 +0200
>>> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>>> Subject: Re: [PATCH v2] fallocate.2: Document FALLOC_FL_ZERO_RANGE
>>>
>>> Hi Lukas
>>>
>>> On 04/30/2014 04:09 PM, Lukas Czerner wrote:
>>>> FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
>>>> for zeroing ranges in the allocated space in a file.
>>>>
>>>> Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> v2: Rebase and update the description
>>>>
>>>>  man2/fallocate.2 | 46 +++++++++++++++++++++++++++++++++++++++++++=
++-
>>>>  1 file changed, 45 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/man2/fallocate.2 b/man2/fallocate.2
>>>> index 73c4f12..30f27c3 100644
>>>> --- a/man2/fallocate.2
>>>> +++ b/man2/fallocate.2
>>>> @@ -180,6 +180,48 @@ ext4 (only for extent-based files)
>>>>  .\" commit 9eb79482a97152930b113b51dff530aba9e28c8e
>>>>  and XFS.
>>>>  .\" commit e1d8fb88a64c1f8094b9f6c3b6d2d9e6719c970d
>>>> +.SS Zeroing file space
>>>> +Specifying
>>>> +.BR FALLOC_FL_ZERO_RANGE
>>>> +flag (available since Linux 3.14) in
>>>> +.I mode
>>>> +zeroes space in the byte range starting at
>>>> +.I offset
>>>> +and continuing for
>>>> +.I len
>>>> +bytes.
>>>> +Within the specified range, blocks are preallocated for the regio=
ns
>>>> +that span the holes in the file. After a successful call, subsequ=
ent
>>>> +reads from this range will return zeroes.
>>>> +
>>>> +Zeroing is done within the file system preferably by converting r=
ange into
>>>> +unwritten extents which requires very little IO to be issued most=
ly for
>>>> +metadata. This means that the range will not be physically zeroed=
 out
>>>> +on the device.
>>>
>>> I just want to confirm my understanding of what's going on here.
>>> FALLOC_FL_ZERO_RANGE is serving at least two purposes:
>>> 1. Future reads from the specified range will return zero.
>>> 2. Blocks (in the form of extents) will be preallocated for the hol=
es=20
>>>    in the range, thus ensuring that the necessary storage space is=20
>>>    allocated for the file. However, those allocated blocks won't ac=
tually
>>>    be written to. (Metadata trickery will ensure that reads from th=
at
>>>    region won't actually touch the blocks; the kernel will simply d=
eliver
>>>    back zeroes.)
>>>
>>> Right?
>>
>> Yes, that's exactly right.
>=20
> Thanks.
>=20
>>> And a question: does FALLOC_FL_ZERO_RANGE work for non-extent-based=
=20
>>> filesystems? If yes, how is FALLOC_FL_ZERO_RANGE implemented? Are t=
he
>>> blocks corresponding to a hole actually allocated and explicitly=20
>>> written with zeroes?
>>
>> As it is now, FALLOC_FL_ZERO_RANGE does not work on non-extent based
>> files. This is also the case for collapse range and the regular
>> preallocation at least in ext4 case.
>=20
> Okay -- see my comment below..
>=20
>>>> +
>>>> +If the
>>>> +.B FALLOC_FL_KEEP_SIZE
>>>> +flag is specified in
>>>> +.IR mode ,
>>>> +the behavior of the call is similar,
>>>> +but the file size will not be changed even if
>>>> +.IR offset + len
>>>> +is greater than the file size. This behaviour is the same as when
>>>> +preallocating space with
>>>> +.B FALLOC_FL_KEEP_SIZE
>>>> +specified.
>>>> +
>>>> +Not all filesystems support
>>>> +.BR FALLOC_FL_ZERO_RANGE ;
>>>> +if a filesystem doesn't support the operation, an error is return=
ed.
>>>> +The operation is supported on at least the following filesystems
>>>> +.IP * 3
>>>> +XFS (since Linux 2.14)
>>>> +.\" commit 376ba313147b4172f3e8cf620b9fb591f3e8cdfa
>>>> +.IP *
>>>> +ext4 (since Linux 3.14)
>>>> +.\" commit b8a8684502a0fc852afa0056c6bb2a9273f6fcc0
>>>> +
>=20
> So for these two cases, XFS and ext4, should we perhaps better say=20
>=20
>      XFS, for extent based files (since Linux 3.14)
>      ext4, for extent based files (since Linux 3.14)
> ?
>=20
> Cheers,
>=20
> Michael
>=20
>=20
>>>>  .SH RETURN VALUE
>>>>  On success,
>>>>  .BR fallocate ()
>>>> @@ -243,7 +285,9 @@ no other flags are permitted with
>>>>  .B EINVAL
>>>>  .I mode
>>>>  is
>>>> -.BR FALLOC_FL_COLLAPSE_RANGE ,
>>>> +.BR FALLOC_FL_COLLAPSE_RANGE
>>>> +or
>>>> +.BR FALLOC_FL_ZERO_RANGE,
>>>>  but the file referred to by
>>>>  .I fd
>>>>  is not a regular file.
>>>>
>>>
>>>
>>>
>>
>=20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
