From: "Wangnan (F)" <wangnan0@huawei.com>
Subject: Re: [PATCH 2/2] perf_event_open.2: Document write_backward
Date: Mon, 24 Oct 2016 14:44:41 +0800
Message-ID: <580DADD9.8020807@huawei.com>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
 <1477049893-143199-2-git-send-email-wangnan0@huawei.com>
 <alpine.DEB.2.20.1610211716280.16183@macbook-air>
 <c805a296-8a65-9297-74fe-ee04926055c8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c805a296-8a65-9297-74fe-ee04926055c8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Vince Weaver <vincent.weaver@maine.edu>
Cc: pi3orama@163.com, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, lizefan@huawei.com
List-Id: linux-man@vger.kernel.org



On 2016/10/22 18:05, Michael Kerrisk (man-pages) wrote:
> On 10/21/2016 11:25 PM, Vince Weaver wrote:
>> On Fri, 21 Oct 2016, Wang Nan wrote:
>>
>>>             context_switch :  1,  /* context switch data */
>>> -
>>> -          __reserved_1   : 37;
>>> +          write_backward :  1,  /* Write ring buffer from end to beginning */
>>> +          __reserved_1   : 36;
>> This removes a blank line, not sure if intentional or not.
> Maybe it would be better to keep it. I don't feel too strongly about
> this though.
>
>>> +.IR "write_backward" " (since Linux 4.6)"
>> It didn't committed until Linux 4.7 from what I can tell?
> Yes, that's my recollection too.
>
>>> +This makes the resuling event use a backward ring-buffer, which
>> resulting
>>
>>> +writes samples from the end of the ring-buffer.
>>> +
>>> +It is not allowed to connect events with backward and forward
>>> +ring-buffer settings together using
>>> +.B PERF_EVENT_IOC_SET_OUTPUT.
>>> +
>>> +Backward ring-buffer is useful when the ring-buffer is overwritable
>>> +(created by readonly
>>> +.BR mmap (2)
>>> +).
>> A ring buffer is over-writable when it is mmapped readonly?
>> Is this a hard requirement?

I'd like to explain over-writable ring buffer in patch 1/1 like this:

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index fade28c..561331c 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1687,6 +1687,15 @@ the
  .I data_tail
  value should be written by user space to reflect the last read data.
  In this case, the kernel will not overwrite unread data.
+
+When the mapping is read only (without
+.BR PROT_WRITE ),
+setting .I data_tail is not allowed.
+In this case, the kernel will overwrite data when sample coming, unless
+the ring buffer is paused by a
+.BR PERF_EVENT_IOC_PAUSE_OUTPUT
+.BR ioctl (2)
+system call before reading.
  .TP
  .IR data_offset " (since Linux 4.1)"
  .\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f

The ring buffer become over-writable because there's no way to tell kernel
the positioin of the last read data when mmaped read only.

>> Can you set the read-backwards bit if not mapped readonly?

I don't understand why we need read-backwards.

Mapped with PROT_WRITE is the *default* setting. In this case user program
like perf is able to tell the reading position to kernel through writing to
'data_tail'. In this case kernel won't overwrite unread data, it reads
forwardly.

Or do you think the naming is confusing? The name of 'write_backward' is
kernel-centric, means adjust kernel behavior. kernel *write* data, so I
call it 'write_backward'. The name 'read-backwards' is user-centric,
because user 'read' data.

Thank you.
