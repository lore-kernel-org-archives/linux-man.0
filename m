From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Tue, 20 Sep 2011 07:32:46 +0200
Message-ID: <CAKgNAkgeNBgWEx0-BbSbf83Jtk-AXd+W-YHL-4gTwA6Y_nbR0g@mail.gmail.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com>
 <4E778434.6040905@oracle.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E778434.6040905-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sunil Mushran <sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Sunil,

On Mon, Sep 19, 2011 at 8:04 PM, Sunil Mushran <sunil.mushran-QHcLZuEGTsthl2p70BpVqQ@public.gmane.org=
m> wrote:
> On 09/18/2011 12:07 AM, Michael Kerrisk wrote:
>>
>> Hello Josef,
>>
>> For Linux 3.1, you've added SEEK_HOLE + SEEK_DATA. I've attempted to
>> document these as below for the lseek.2 man page. Could you please
>> review?
>>
>> Thanks,
>>
>> Michael
>>
>>
>> diff --git a/man2/lseek.2 b/man2/lseek.2
>> index 26943e2..941ea08 100644
>> --- a/man2/lseek.2
>> +++ b/man2/lseek.2
>> @@ -85,6 +85,69 @@ of the file (but this does not change the size of=
 the
>> file).
>> =A0If data is later written at this point, subsequent reads of the d=
ata
>> =A0in the gap (a "hole") return null bytes (\(aq\\0\(aq) until
>> =A0data is actually written into the gap.
>> +.SS Seeking file data and holes
>> +Since version 3.1, Linux supports the following additional values f=
or
>> +.IR whence :
>> +.TP
>> +.B SEEK_DATA
>> +Adjust the file offset to the next region
>> +in the file greater than or equal to
>> +.I offset
>
> I would recommend dropping the word next as it is confusing consideri=
ng the
> offset returned could be the offset passed in.

I changed "region" to "location", but otherwise left this unchanged. I
couldn't see a good alternative formulation, and also the next
sentence of the page makes your point clear.

>> +containing data.
>> +If
>> +.I offset
>> +points to data,
>> +then the file offset is set to
>> +.IR offset .
>> +.TP
>> +.B SEEK_HOLE
>> +Adjust the file offset to the next hole in the file
>> +greater than or equal to
>> +.IR offset .
>
> Same here.

See above; no change.

>> +If
>> +.I offset
>> +points into the middle of a hole,
>> +then the file offset is set to
>> +.IR offset .
>> +If there is no hole past
>> +.IR offset ,
>> +then the file offset is adjusted to the end of the file
>> +(i.e., there is an implicit hole at the end of any file).
>> +.PP
>> +In both of the above cases,
>> +.BR lseek ()
>> +fails if
>> +.I offset
>> +points past the end of the file.
>> +
>> +These operations allow applications to map holes in a sparsely
>> +allocated file.
>> +This can be useful for applications such as file backup tools,
>> +which can save space when creating backups and preserve holes,
>> +if they have a mechanism for discovering holes.
>> +
>> +For the purposes of these operations, a hole is a sequence of zeroe=
s that
>> +(normally) has not been allocated in the underlying file storage.
>> +However, a file system is not obliged to report holes,
>> +so these operations are not a guaranteed mechanism for
>> +mapping the storage space actually allocated to a file.
>> +(Furthermore, a sequence of zeroes that actually has been written
>> +to the underlying storage normally won't be reported as a hole.)
>
> Instead of "won't be", make it "may not be". The interface should not=
 limit
> the file system/block device.

Yes, better. Changed.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
