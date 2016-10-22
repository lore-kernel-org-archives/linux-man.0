From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 2/2] perf_event_open.2: Document write_backward
Date: Sat, 22 Oct 2016 12:05:55 +0200
Message-ID: <c805a296-8a65-9297-74fe-ee04926055c8@gmail.com>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
 <1477049893-143199-2-git-send-email-wangnan0@huawei.com>
 <alpine.DEB.2.20.1610211716280.16183@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610211716280.16183@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>, Wang Nan <wangnan0@huawei.com>
Cc: mtk.manpages@gmail.com, pi3orama@163.com, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, lizefan@huawei.com
List-Id: linux-man@vger.kernel.org

On 10/21/2016 11:25 PM, Vince Weaver wrote:
> On Fri, 21 Oct 2016, Wang Nan wrote:
> 
>>            context_switch :  1,  /* context switch data */
>> -
>> -          __reserved_1   : 37;
>> +          write_backward :  1,  /* Write ring buffer from end to beginning */
>> +          __reserved_1   : 36;
> 
> This removes a blank line, not sure if intentional or not.

Maybe it would be better to keep it. I don't feel too strongly about 
this though.

>> +.IR "write_backward" " (since Linux 4.6)"
> 
> It didn't committed until Linux 4.7 from what I can tell?

Yes, that's my recollection too.

> 
>> +This makes the resuling event use a backward ring-buffer, which
> resulting
> 
>> +writes samples from the end of the ring-buffer.
>> +
>> +It is not allowed to connect events with backward and forward
>> +ring-buffer settings together using
>> +.B PERF_EVENT_IOC_SET_OUTPUT.
>> +
>> +Backward ring-buffer is useful when the ring-buffer is overwritable
>> +(created by readonly
>> +.BR mmap (2)
>> +). 
> 
> A ring buffer is over-writable when it is mmapped readonly?
> Is this a hard requirement?
> Can you set the read-backwards bit if not mapped readonly?

Wang Nan, could you perhaps clarify this in the next version of the patch?

> 
> Otherwise the documentation seems reasonable.
> 
> Reviewed-by: Vince Weaver <vincent.weaver@maine.edu>

Thanks for reviewing both patches, Vince. Wang Nan, please include the
Reviewed-by: in the next patch iteration.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
