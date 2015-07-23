From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] mmap.2: document the munmap exception for underlying
 page size
Date: Thu, 23 Jul 2015 15:05:20 +0200
Message-ID: <55B0E690.3040601@gmail.com>
References: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com> <55AFD009.6080706@gmail.com> <alpine.DEB.2.10.1507221457300.21468@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.10.1507221457300.21468@chino.kir.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: David Rientjes <rientjes@google.com>
Cc: mtk.manpages@gmail.com, Hugh Dickins <hughd@google.com>, Davide Libenzi <davidel@xmailserver.org>, Eric B Munson <emunson@akamai.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 07/23/2015 12:03 AM, David Rientjes wrote:
> On Wed, 22 Jul 2015, Michael Kerrisk (man-pages) wrote:
> 
>>> diff --git a/man2/mmap.2 b/man2/mmap.2
>>> --- a/man2/mmap.2
>>> +++ b/man2/mmap.2
>>> @@ -383,6 +383,10 @@ All pages containing a part
>>>  of the indicated range are unmapped, and subsequent references
>>>  to these pages will generate
>>>  .BR SIGSEGV .
>>> +An exception is when the underlying memory is not of the native page
>>> +size, such as hugetlb page sizes, whereas
>>> +.I length
>>> +must be a multiple of the underlying page size.
>>>  It is not an error if the
>>>  indicated range does not contain any mapped pages.
>>>  .SS Timestamps changes for file-backed mappings
>>
>> I'm struggling a bit to understand your text. Is the point this:
>>
>>     If we have a hugetlb area, then the munmap() length
>>     must be a multiple of the page size.
>>
>> ?
>>
> 
> Of the hugetlb page size, yes, which was meant by the "underlying page 
> size" since we have configurable hugetlb sizes.  This is different from 
> the native page size, whereas the length is rounded up to be page aligned 
> per POSIX.
> 
>> Are there any requirements about 'addr'? Must it also me huge-page-aligned?
>>
> 
> Yes, so it looks like we need to fix up the reference to "address addr 
> must be a multiple of the page size" to something like "address addr must 
> be a multiple of the underlying page size" but I think the distinction 
> isn't explicit enough as I'd like it.  I think it's better to explicitly 
> show the exception for hugetlb page sizes and compare the underlying page 
> size to the native page size to define how the behavior differs.
> 
> Would something like
> 
> 	An exception is when the underlying memory, such as hugetlb 
> 	memory, is not of the native page size: the address addr and
> 	the length must be a multiple of the underlying page size.

See my suggestion in another mail (in a few minutes).

> suffice?
> 
> Also, is it typical to reference the commit of the documentation change 
> in the kernel source that defines this?  I see this done with .\" blocks 
> for MAP_STACK in the same man page.

I find it handy to add such references, for later references.
By the way, are you saying that some piece of behavior has
changed in recent times for munmap() on HugeTLB?

Thanks,

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
