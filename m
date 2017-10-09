From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] shmat(2) returns page size aligned memory address
Date: Mon, 9 Oct 2017 10:28:24 +0200
Message-ID: <3f1e2110-e736-0f53-c8a6-12bfcda433f7@gmail.com>
References: <CAJYFCiPhNVCMRVD-QpwsZk0wAKRXzFWcwVZDqLXxsxYfhFcVpg@mail.gmail.com>
 <20171009092251.GC5758@HP>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171009092251.GC5758@HP>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yubin. Patch applied.

Cheers,

Michael


On 10/09/2017 04:27 PM, Yubin Ruan wrote:
> On Sun, Oct 08, 2017 at 11:37:05PM +0800, Yubin Ruan wrote:
>> Hi Michael,
>> At the current man page for shmat(2)[1], there is no mentioning
>> whether the returned memory address of shmat(2) will be page size
>> aligned or not. As that is quite important to many applications(e.g.,
>> those that use locks heavily and would like to avoid some locks by
>> some atomic guarantees provided by the CPU), it would be great to
>> specify that for Linux.
>>
>> I walked down the current implementation of shmat(2) in the latest
>> kernel src and found that shmat(2) does return a page size aligned
>> memory address:
>>
>> SYSCALL_DEFINE3(shmat, int, shmid, char __user *, shmaddr, int, shmflg)
>>   -> do_shmat(...)
>>   -> do_mmap_pgoff(...)
>>   -> do_mmap(...)
>>   -> get_unmapped_area(...)
>>   -> get_area(...) -> offset_in_page(addr)
>>
>> there is a `offset_in_page(addr)' assertion at the end and if that is
>> true a -EINVAL would be returned, by which we can be sure that
>> shmat(2) will return a page size aligned memory address on success[2].
>>
>> I will create a patch later if that is acceptable.
>>
>> Thanks,
>> Yubin
>>
>> [1]: http://man7.org/linux/man-pages/man2/shmat.2.html
>> [2]: there is also a `offset_in_page(2)' in get_unmapped_area(...),
>> but that doesn't lead to -EINVAL...I am not sure whether the logic of
>> that code is right.
> 
> add the page-alignment attribute of the return address of shmat(2)
> ---
> 
> diff --git a/man2/shmop.2 b/man2/shmop.2
> index 849529f..b8d7595 100644
> --- a/man2/shmop.2
> +++ b/man2/shmop.2
> @@ -63,7 +63,7 @@ with one of the following criteria:
>   If
>   .I shmaddr
>   is NULL,
> -the system chooses a suitable (unused) address at which to attach
> +the system chooses a suitable (unused) page-aligned address to attach
>   the segment.
>   .IP *
>   If
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
