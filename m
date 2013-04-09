From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Tue, 09 Apr 2013 20:08:18 +0200
Message-ID: <51645912.5080602@redhat.com>
References: <515EF542.8090200@redhat.com> <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

On 04/07/2013 12:15 PM, Michael Kerrisk (man-pages) wrote:
> Hi Peter,
>
> On Fri, Apr 5, 2013 at 6:01 PM, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi Michael,
>>
>> it looks like the clone(2) man page is describing glibc implementation
>> and not the system call. So I guess it should be moved to the section 3
>> and a new man page for clone(2) syscall should be created in section 2.
>>
>> The clone(2) syscall is defined like this:
>>
>> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>>                   int __user *, parent_tidptr,
>>                   int __user *, child_tidptr,
>>                   int, tls_val)
>>
>> (I'm sorry, but I don't have a patch this time.)
>
> The general tendency is to document all system calls in section 2, and
> if there are some differences caused by wrapper functions, then they
> are noted on the page.
>
> I admint that clone(2) is an unusual case. The signature given at the
> top of the page is for the wrapper (and later the difference to the
> syscall raw interface are described). However, the details are
> primarily about the underlying kernel interface, so I'm inclined to
> leave the page where it is.
>

Ah, I see now. So, basically there are 2 problems:
  * it's not clear that in the synopsis is library call
  * system call is buried down in the page

Would it be viable to somehow have both signatures in the synopsis?
(I've checked some random man pages in section 2, but didn't find
anything similar..)

My aim here is, that when I'm opening man page in section 2, the first
thing I'm expecting to see is syscall signature. In clone(2), it's not
even clear that this is a library call.

peter
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
