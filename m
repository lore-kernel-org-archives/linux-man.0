From: Sunil Mushran <sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Tue, 20 Sep 2011 08:59:26 -0700
Message-ID: <4E78B85E.3060409@oracle.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com> <4E778434.6040905@oracle.com> <CAKgNAkgeNBgWEx0-BbSbf83Jtk-AXd+W-YHL-4gTwA6Y_nbR0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgeNBgWEx0-BbSbf83Jtk-AXd+W-YHL-4gTwA6Y_nbR0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/19/2011 10:32 PM, Michael Kerrisk wrote:
> Hi Sunil,
>
> On Mon, Sep 19, 2011 at 8:04 PM, Sunil Mushran<sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>  wrote:
>> On 09/18/2011 12:07 AM, Michael Kerrisk wrote:
>>> Hello Josef,
>>>
>>> For Linux 3.1, you've added SEEK_HOLE + SEEK_DATA. I've attempted to
>>> document these as below for the lseek.2 man page. Could you please
>>> review?
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>>
>>> diff --git a/man2/lseek.2 b/man2/lseek.2
>>> index 26943e2..941ea08 100644
>>> --- a/man2/lseek.2
>>> +++ b/man2/lseek.2
>>> @@ -85,6 +85,69 @@ of the file (but this does not change the size of the
>>> file).
>>>   If data is later written at this point, subsequent reads of the data
>>>   in the gap (a "hole") return null bytes (\(aq\\0\(aq) until
>>>   data is actually written into the gap.
>>> +.SS Seeking file data and holes
>>> +Since version 3.1, Linux supports the following additional values for
>>> +.IR whence :
>>> +.TP
>>> +.B SEEK_DATA
>>> +Adjust the file offset to the next region
>>> +in the file greater than or equal to
>>> +.I offset
>> I would recommend dropping the word next as it is confusing considering the
>> offset returned could be the offset passed in.
> I changed "region" to "location", but otherwise left this unchanged. I
> couldn't see a good alternative formulation, and also the next
> sentence of the page makes your point clear.

Fine by me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
