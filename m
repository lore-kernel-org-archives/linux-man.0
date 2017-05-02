From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-pages 0/5] {ioctl_}userfaultfd.2: yet another update
Date: Tue, 2 May 2017 22:28:56 +0200
Message-ID: <2bd667b5-35d1-6e7f-3f8f-5b4e163618a7@gmail.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <352eee49-d6d1-3e82-a558-2341484c81f3@gmail.com>
 <20170502094836.GD5910@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170502094836.GD5910@rapoport-lnx>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/02/2017 11:48 AM, Mike Rapoport wrote:
> On Mon, May 01, 2017 at 08:34:07PM +0200, Michael Kerrisk (man-pages) wrote:
>> Hi Mike,
>>
>> On 05/01/2017 07:43 AM, Mike Rapoport wrote:
>>> Hi Michael,
>>>
>>> These updates pretty much complete the coverage of 4.11 additions, IMHO.
>>
>> Thanks for this, but we still await input from Andrea
>> on various points.
>>
>>> Mike Rapoport (5):
>>>   ioctl_userfaultfd.2: update description of shared memory areas
>>>   ioctl_userfaultfd.2: UFFDIO_COPY: add ENOENT and ENOSPC description
>>>   ioctl_userfaultfd.2: add BUGS section
>>>   userfaultfd.2: add note about asynchronios events delivery
>>>   userfaultfd.2: update VERSIONS section with 4.11 chanegs
>>>
>>>  man2/ioctl_userfaultfd.2 | 35 +++++++++++++++++++++++++++++++++--
>>>  man2/userfaultfd.2       | 15 +++++++++++++++
>>>  2 files changed, 48 insertions(+), 2 deletions(-)
>>
>> I've applied all of the above, and done some light editing.
>>
>> Could you please check my changes in the following commits:
>>
>> 5191c68806c8ac73fdc89586cde434d2766abb5c
>> 265225c1e2311ae26ead116e6c8d2cedd46144fa
> 
> Both are Ok
> Reviewed-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Thanks for checking, Mike.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
