From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 14:52:00 +0100
Message-ID: <a5615075-dd39-e206-cbce-385bed72473f@gmail.com>
References: <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw@mail.gmail.com>
 <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <25262.1481628931@warthog.procyon.org.uk>
 <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
 <26913.1481636296@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <26913.1481636296-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/13/2016 02:38 PM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> So, I've updated this piece a couple of times since the draft that you
>> reviewed, and by now it reads:
>>
>>        "big_key" (since Linux 3.13)
>>               This key type is similar to the "user" key type, but it may
>>               hold  a  payload  of up to 1 MiB in size.  This key type is
>>               useful for tasks such as holding Kerberos ticket caches.
> 
> I'm not sure that "tasks" is quite the word I'd use here (it's overloaded).
> Perhaps "purposes"?

Fixed.

>>               The payload data may be stored in  the  swap  space  rather
>>               than in kernel memory if the data size exceeds the overhead
>>               of storing the data encrypted in swap space.  (A tmpfs file
>>               is  used,  which requires filesystem structures to be allo‐
>>               cated in the kernel; The size of  these  structures  deter‐
>>               mines  the  size  threshold  above  which the tmpfs storage
>>               method  is  used.)   Since  Linux  4.8,  payload  data   is
>>               encrypted,  to  prevent  it  being written unencrypted into
>>               swap space.
> 
> I would either drop the first "encrypted" ("storing the data encrypted") since

I already dropped that first "encrypted".

> you mention this later or move it earlier to be after the word "stored" ("may
> be stored encrypted").
> 
> Note that with the "Since Linux 4.8 ..." sentence, the encryption is only
> applied if it is stored into tmpfs.

Thanks for that tip.

> Also, the payload isn't directly stored into swapspace, but is rather stored
> into tmpfs, from where it can be swapped.  This is important since you can use
> this type of key without any swapspace available to your system.

Yes, the text still needs some work... How about:


       "big_key" (since Linux 3.13)
              This key type is similar to the "user" key type, but it may
              hold  a  payload  of up to 1 MiB in size.  This key type is
              useful for purposes such as holding Kerberos ticket caches.

              The payload data may  be  stored  in  a  tmpfs  filesystem,
              rather  than in kernel memory, if the data size exceeds the
              overhead of storing the data in the  filesystem.   (Storing
              the  data in a filesystem requires filesystem structures to
              be allocated in the kernel.  The size of  these  structures
              determines the size threshold above which the tmpfs storage
              method is used.)  Since Linux  4.8,  the  payload  data  is
              encrypted when stored in tmpfs, to prevent it being written
              unencrypted into swap space.

?

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
