From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Rewording language in mbind(2) to "threads" not "processes"
Date: Sat, 22 Oct 2016 12:08:51 +0200
Message-ID: <f3172238-1601-22c8-e840-b012927866ac@gmail.com>
References: <f3c4ca9d-a880-5244-e06e-db4725e4d945@gmail.com>
 <alpine.DEB.2.20.1610131314020.3176@east.gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.20.1610131314020.3176@east.gentwo.org>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>
Cc: mtk.manpages@gmail.com, Piotr Kwapulinski <kwapulinski.piotr@gmail.com>, mhocko@kernel.org, mgorman@techsingularity.net, a.p.zijlstra@chello.nl, riel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, Brice Goglin <Brice.Goglin@inria.fr>
List-Id: linux-man@vger.kernel.org

On 10/13/2016 08:16 PM, Christoph Lameter wrote:
> On Thu, 13 Oct 2016, Michael Kerrisk (man-pages) wrote:
> 
>> @@ -100,7 +100,10 @@ If, however, the shared memory region was created with the
>>  .B SHM_HUGETLB
>>  flag,
>>  the huge pages will be allocated according to the policy specified
>> -only if the page allocation is caused by the process that calls
>> +only if the page allocation is caused by the thread that calls
>> +.\"
>> +.\" ??? Is it correct to change "process" to "thread" in the preceding line?
> 
> No leave it as process. Pages get one map refcount per page table
> that references them (meaning a process). More than one map refcount means
> that multiple processes have mapped the page.
> 
>> @@ -300,7 +303,10 @@ is specified in
>>  .IR flags ,
>>  then the kernel will attempt to move all the existing pages
>>  in the memory range so that they follow the policy.
>> -Pages that are shared with other processes will not be moved.
>> +Pages that are shared with other threads will not be moved.
>> +.\"
>> +.\" ??? Is it correct to change "processes" to "threads" in the preceding line?
>> +.\"
> 
> Leave it. Same as before.
> 
>>  If
>>  then the kernel will attempt to move all existing pages in the memory range
>> -regardless of whether other processes use the pages.
>> -The calling process must be privileged
>> +regardless of whether other threads use the pages.
>> +.\"
>> +.\" ??? Is it correct to change "processes" to "threads" in the preceding line?
>> +.\"
> 
> Leave as process.

Thanks. I've reverted these changes.

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
