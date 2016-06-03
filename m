From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mmap.2: improve example
Date: Fri, 3 Jun 2016 06:55:19 -0500
Message-ID: <70538406-784a-5b19-0b5e-46b9ee6182dc@gmail.com>
References: <1464890187-4141-1-git-send-email-rahulbedarkar89@gmail.com>
 <06bc8862-f4b2-c024-3852-e1db3d2ae5fb@gmail.com>
 <CA+NV+Vn9_9eDLvNWhgH7pLFyf+Bjd-fU6Cu0POb3vF-Qb-CnTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+NV+Vn9_9eDLvNWhgH7pLFyf+Bjd-fU6Cu0POb3vF-Qb-CnTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/03/2016 02:46 AM, Rahul Bedarkar wrote:
> Hello Michael,
> 
> On Fri, Jun 3, 2016 at 4:59 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Rahul,
>>
>>
>> Given that handle_error() calls exit(), and that triggers close()
>> on all FDs and munmap() on all mappings, I'm not sure this patch
>> improves things. Can you say some more on why you think it is
>> needed?
> 
> I think it is always better to free resources after use to avoid
> memory leaks later. But doing that in such
> simple example might be debatable.

Yep.

> May be at-least at the end we should call munmap() and close(). That
> will cover munmap() usage as well.

Yes, by way of example, I think it doesn't hurt to add the munmap() 
call especially. Added.

Thanks for the input.

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
