From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: <sys/memfd.h> header
Date: Fri, 3 Nov 2017 21:04:58 +0100
Message-ID: <c37978b1-0fa3-fa3b-9d11-db2d8a22e7a3@redhat.com>
References: <a989051a-3dcd-9fe6-ab23-5d9fd5d3442b@redhat.com>
 <CAKgNAkjeMPPReMa+-_QpL1xZUtBy7yspBkPepG1F4LW6WO9H+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjeMPPReMa+-_QpL1xZUtBy7yspBkPepG1F4LW6WO9H+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/03/2017 09:01 PM, Michael Kerrisk (man-pages) wrote:
> [CC += David Herrmann]
> 
> Hi Florian,
> 
> On 3 November 2017 at 20:22, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> memfd_create(2) mentions a <sys/memfd.h>.  Is this a typo for
>> <linux/memfd.h>?
> 
> Offhand, I do not know. This header file was listed in the original
> draft of the page that I received from David Herrmann. (I did much
> reworking of the page, but overlooked this detail.) Perhaps it was a
> typo, or perhaps it was David's estimation that there would eventually
> be such a glibc header.
> 
>> I want to implement the system call wrapper, but we're probably going to put
>> it into <sys/mman.h> and have it include <linux/memfd.h> for _GNU_SOURCE.
> 
> I'm agnostic about it. Maybe David will have some thoughts.

Thanks.

My <sys/mman.h> approach is probably not such a great idea because we 
can't include <linux/memfd.h> because the kernel headers may not have 
it.  So if we put memfd_create into <sys/mman.h>, then we'd have to 
duplicate the constants.  In contrast, a new header could indeed include 
<linux/memfd.h>.

Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
