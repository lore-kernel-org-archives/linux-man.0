From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] readv.2: document RWF_NOWAIT
Date: Thu, 9 Nov 2017 14:40:38 +0100
Message-ID: <CAKgNAkhbNxpKLcO8aGS0rid2iZSUi76NY7e5WTh1BmY7NNcKWA@mail.gmail.com>
References: <20171029084023.8463-1-hch@lst.de> <20171029094106.GA15945@bombadil.infradead.org>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20171029094106.GA15945@bombadil.infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-man <linux-man@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Milosz Tanski <milosz@adfin.com>
List-Id: linux-man@vger.kernel.org

Hi Christoph,


On 29 October 2017 at 10:41, Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, Oct 29, 2017 at 10:40:23AM +0200, Christoph Hellwig wrote:
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  man2/readv.2 | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/man2/readv.2 b/man2/readv.2
>> index 831cf6260..21d82849e 100644
>> --- a/man2/readv.2
>> +++ b/man2/readv.2
>> @@ -232,6 +232,25 @@ This flag is meaningful only for
>>  .BR pwritev2 (),
>>  and its effect applies only to the data range written by the system call.
>>  .\" commit e864f39569f4092c2b2bc72c773b6e486c7e3bd9
>> +.TP
>> +.BR RWF_NOWAIT " (since Linux 4.14)"
>> +Dot not wait for data when it cannot be instantly retreived.  If this flag
>> +is specified the
>> +.BR preadv2 ()
>> +system call will return instantly when it would have to read data from
>> +the backing storage or wait for a lock.  Instead it will return -1 and set
>> +.I errno
>> +to
>> +.BR EAGAIN
>> +if no data could be read, or return less bytes than requested if some data
>> +could be read.
>> +This flag is meaningful only for
>> +.BR preadv2 ()
>> +at the moment.
>> +.\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
>> +.\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571
>
> The phrasing is a bit tortured ... try this:
>
> .TP
> .BR RWF_NOWAIT " (since Linux 4.14)"
> Do not wait for data which is not immediately available.
> If this flag is specified the
> .BR preadv2 ()
> system call will return instantly if it would have to read data from
> the backing storage or wait for a lock.
> If some data was successfully read, it will return the number of bytes read.
> If no bytes were read, it will return -1 and set
> .IR errno to
> .BR EAGAIN .
> This flag is meaningful only for
> .BR preadv2 ()
> at the moment.
> .\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
> .\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571

What are your thoughts on Matthew's proposed rewording?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
