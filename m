From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man page update (fcntl(2) new set/get write hints)
Date: Mon, 28 Aug 2017 21:19:51 +0200
Message-ID: <68b812bd-a861-2ed0-e207-fb0a9bbce923@gmail.com>
References: <25b8e025-d49b-e033-5ba3-f6967a6a970f@kernel.dk>
 <feffa54b-d1b4-02e3-5a24-0a8e51f96762@gmail.com>
 <39f20b08-9a35-652e-4ae9-96f3cb8e5679@kernel.dk>
 <CAKgNAkizCBiky9QM0-oyP3taGKCDTjAP--SCgqZ3pC8Kz=PnPw@mail.gmail.com>
 <580f238c-4c3d-eddc-5330-19f8a971bce1@kernel.dk>
 <CAKgNAkhJysMFycC8xxjQ8s=+ABryEmWTFUopTWoan04icGibAw@mail.gmail.com>
 <6d17003b-87a1-43c8-87bf-80842b4fabf7@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6d17003b-87a1-43c8-87bf-80842b4fabf7-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jens,

On 08/25/2017 10:55 PM, Jens Axboe wrote:
> On 08/25/2017 02:51 PM, Michael Kerrisk (man-pages) wrote:
>>>>>> Do you mean here "file descriptor" or "file description (i.e., the
>>>>>> open file handle)? Maybe you mean the former, but I want to confirm.
>>>>>
>>>>> I do mean file descriptor.
>>>>
>>>> So, what are the semantics if a file descriptor is duplicated using
>>>> dup(2) or similar? If I understand correctly, then the write lifetime
>>>> hint has no effect for the new file descriptor, right?
>>>
>>> If it's dup(2)'ed, then the new file descriptor will refer to the same
>>> hints as the previous. See attached test file.
>>
>> But then isn't this exactly the point I asked about: are the hints
>> private to a file descriptor or are they associated with the open file
>> description (open file table entry, "struct file")? You said "I do
>> mean file descriptor", but actually I understand what you just said
>> now as "hints are associated with the open file description, which may
>> be referred to by multiple duplicated file descriptors". Can you
>> clarify?
> 
> You are right, I misunderstood your original question. They do follow
> the file description. So the dup'ed one will return the same as the
> original, even if the hints on the original fd get modified. That is the
> expected behavior.

So, I am still confused. I was wondering whether the hints are 
associated with the open file description (OFD), rather than the 
file descriptor. You said yes, then say that the dup'ed file 
descriptor will have the same hints even if the hints on the
original file descriptor are modified. To me that sounds like:
the hints are associated with the file descriptor, and not the
OFD, and during dup(2) the hints are *copied* to the the new
file descriptor, with the result that after the dup(2) the hints
can be modified independently for the two file descriptors.

Can you clarify please?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
