From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Thread-safety of iconv()
Date: Thu, 18 Sep 2014 09:14:41 -0400
Message-ID: <541ADAC1.2090108@redhat.com>
References: <5416B235.8020309@redhat.com> <541A80BD.8050509@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541A80BD.8050509-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/18/2014 02:50 AM, Peng Haitao wrote:
> On 09/15/2014 05:32 PM, Marko Myllynen wrote:
>> Hi Michael, Haitao,
>>
>> iconv(3) states:
>>
>> ATTRIBUTES
>>    Multithreading (see pthreads(7))
>>        The iconv() function is thread-safe.
>>
>> But iconv_open(3) says:
>>
>> A conversion descriptor contains a conversion  state.   After  creation
>> using iconv_open(), the state is in the initial state.  Using iconv(3)
>> modifies the descriptor's conversion state.  (This implies that a  con-
>> version descriptor can not be used in multiple threads simultaneously.)
>> To bring the state back to the initial state, use iconv(3) with NULL as
>> inbuf argument.
>>
>> This looks a bit unclear, do you think you could clarify iconv(3) and/or
>> iconv_open(3) a bit in thread-safety regard?

It is conditionally thread safe :-)

>>
> 
> Yes, I will clarify it.
> 
> When calling iconv() as iconv(cd, inbuf, ...) and iconv(cd, NULL, ...) 
> in multiple threads simultaneously, Segmentation fault may occur.
> 
> So, I think the glibc's level "MT-Safe race:cd" is good.
> http://www.gnu.org/software/libc/manual/html_mono/libc.html#index-iconv-1

The `cd' object is opaque to the user, and therefore in the glibc manual
Alex and I felt it was appropriate to call out that it *is* thread safe
to call this function but that the `iconv_t`-type object `cd` has itself
no locking and can be corrupted by multiple calls with the same object,
hence `race:cd` e.g. there is a data-race calling this function with the
same cd object.

Alex, please correct me if I'm wrong, but I think that sums it up.

Cheers,
Carlos.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
