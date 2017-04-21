From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Review request: draft userfaultfd(2) manual page
Date: Fri, 21 Apr 2017 13:30:54 +0200
Message-ID: <50386372-ba0b-b618-e208-3219cb8c6332@gmail.com>
References: <487b2c79-f99b-6d0f-2412-aa75cde65569@gmail.com>
 <20170321140118.GA6471@rapoport-lnx>
 <8269f5a9-a30e-f6dd-edc7-8da9a087bebe@gmail.com>
 <20170421110657.GB20569@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20170421110657.GB20569@rapoport-lnx>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, lkml <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 04/21/2017 01:06 PM, Mike Rapoport wrote:
> On Fri, Apr 21, 2017 at 08:30:55AM +0200, Michael Kerrisk (man-pages) wrote:
>> Hello Mike,
>>
>> On 03/21/2017 03:01 PM, Mike Rapoport wrote:
>>> Hello Michael,
>>>
>>> On Mon, Mar 20, 2017 at 09:08:05PM +0100, Michael Kerrisk (man-pages) wrote:
>>>> Hello Andrea, Mike, and all,
>>>>
>>>> Mike: thanks for the page that you sent. I've reworked it
>>>> a bit, and also added a lot of further information,
>>>> and an example program. In the process, I split the page
>>>> into two pieces, with one piece describing the userfaultfd()
>>>> system call and the other describing the ioctl() operations.
>>>>
>>>> I'd like to get review input, especially from you and
>>>> Andrea, but also anyone else, for the current version
>>>> of this page, which includes a few FIXMEs to be sorted.
>>>
>>> Thanks for the update. I'm adressing the FIXME points you've mentioned
>>> below.
>>
>> Thanks!
>>
>>> Otherwise, everything seems the right description of the current upstream.
>>> 4.11 will have quite a few updates to userfault and we'll need to udpate
>>> this page and ioctl_userfaultfd(2) to address those updates. I am planning
>>> to work on the man update in the next few weeks. 
>>>  
>>>> I've shown the rendered version of the page below. 
>>>> The groff source is attached, and can also be found
>>>> at the branch here:
>>>  
>>>> https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/log/?h=draft_userfaultfd
>>>>
>>>> The new ioctl_userfaultfd(2) page follows this mail.
>>>>
>>>> Cheers,
>>>>
>>>> Michael
>>>  
>>> --
>>> Sincerely yours,
>>> Mike. 
>>>  
>>>
>>>> USERFAULTFD(2)         Linux Programmer's Manual        USERFAULTFD(2)
>>>>
>>>> ┌─────────────────────────────────────────────────────┐
>>>> │FIXME                                                │
>>>> ├─────────────────────────────────────────────────────┤
>>>> │Need  to  describe close(2) semantics for userfaulfd │
>>>> │file descriptor: what happens when  the  userfaultfd │
>>>> │FD is closed?                                        │
>>>> │                                                     │
>>>> └─────────────────────────────────────────────────────┘
>>>  
>>> When userfaultfd is closed, it unregisters all memory ranges that were
>>> previously registered with it and flushes the outstanding page fault
>>> events.
>>
>> Presumably, this is more precisely stated as, "when the last
>> file descriptor referring to a userfaultfd object is closed..."?
> 
> You are right.

Thanks for the confirmation.

>> I've made the text:
>>
>>        When the last file descriptor referring to a userfaultfd object
>>        is  closed,  all  memory  ranges  that were registered with the
>>        object  are  unregistered  and  unread  page-fault  events  are
>>        flushed.
>>
>> [...]
> 
> Perfect.
>  

[...]

>>>>        Each read(2) from the userfaultfd file descriptor  returns  one
>>>>        or  more  uffd_msg  structures, each of which describes a page-
>>>>        fault event:
>>>>
>>>>            struct uffd_msg {
>>>>                __u8  event;                /* Type of event */
>>>>                ...
>>>>                union {
>>>>                    struct {
>>>>                        __u64 flags;        /* Flags describing fault */
>>>>                        __u64 address;      /* Faulting address */
>>>>                    } pagefault;
>>>>                    ...
>>>>                } arg;
>>>>
>>>>                /* Padding fields omitted */
>>>>            } __packed;
>>>>
>>>>        If multiple events are available and  the  supplied  buffer  is
>>>>        large enough, read(2) returns as many events as will fit in the
>>>>        supplied buffer.  If the buffer supplied to read(2) is  smaller
>>>>        than the size of the uffd_msg structure, the read(2) fails with
>>>>        the error EINVAL.
>>>>
>>>>        The fields set in the uffd_msg structure are as follows:
>>>>
>>>>        event  The type of event.  Currently, only one value can appear
>>>>               in  this  field: UFFD_EVENT_PAGEFAULT, which indicates a
>>>>               page-fault event.
>>>>
>>>>        address
>>>>               The address that triggered the page fault.
>>>>
>>>>        flags  A bit mask  of  flags  that  describe  the  event.   For
>>>>               UFFD_EVENT_PAGEFAULT, the following flag may appear:
>>>>
>>>>               UFFD_PAGEFAULT_FLAG_WRITE
>>>>                      If  the address is in a range that was registered
>>>>                      with the UFFDIO_REGISTER_MODE_MISSING  flag  (see
>>>>                      ioctl_userfaultfd(2))  and this flag is set, this
>>>>                      a write fault; otherwise it is a read fault.
>>>>
>>>>        A read(2) on a userfaultfd file descriptor can  fail  with  the
>>>>        following errors:
>>>>
>>>>        EINVAL The  userfaultfd  object  has not yet been enabled using
>>>>               the UFFDIO_API ioctl(2) operation
>>>>
>>>>        The userfaultfd file descriptor can be monitored with  poll(2),
>>>>        select(2),  and  epoll(7).  When events are available, the file
>>>>        descriptor indicates as readable.
>>>>
>>>>
>>>>        ┌─────────────────────────────────────────────────────┐
>>>>        │FIXME                                                │
>>>>        ├─────────────────────────────────────────────────────┤
>>>>        │But, it seems,  the  object  must  be  created  with │
>>>>        │O_NONBLOCK.  What is the rationale for this require‐ │
>>>>        │ment? Something needs to  be  said  in  this  manual │
>>>>        │page.                                                │
>>>>        └─────────────────────────────────────────────────────┘
>>>
>>> The object can be created without O_NONBLOCK, so probably the above
>>> sentence can be rephrased as:
>>>
>>> When the userfaultfd file descriptor is opened in non-blocking mode, it can
>>> be monitored with ...
>>
>> Yes, but why is there this requirement for poll() etc. with the
>> O_NONBLOCK flag? I think something about that needs to be said in the 
>> man page. Sorry, my FIXME was not clear enough. I've reworded the text 
>> and the FIXME:
>>
>>        If the O_NONBLOCK flag is enabled in the associated  open  file
>>        description,  the  userfaultfd file descriptor can be monitored
>>        with poll(2), select(2), and epoll(7).  When events are  avail‐
>>        able, the file descriptor indicates as readable.  If the O_NON‐
>>        BLOCK flag is not enabled, then poll(2) (always) indicates  the
>>        file as having a POLLERR condition, and select(2) indicates the
>>        file descriptor as both readable and writable.
>>
>>        ┌─────────────────────────────────────────────────────┐
>>        │FIXME                                                │
>>        ├─────────────────────────────────────────────────────┤
>>        │What is the reason for this seemingly  odd  behavior │
>>        │with  respect  to  the  O_NONBLOCK  flag? (see user‐ │
>>        │faultfd_poll()  in   fs/userfaultfd.c).    Something │
>>        │needs to be said about this.                         │
>>        └─────────────────────────────────────────────────────┘
> 
> Andrea, can you please help with this one as well?

Let's see what Andrea has to say.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
