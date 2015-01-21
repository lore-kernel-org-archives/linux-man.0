From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 09:40:48 +0100
Message-ID: <CAKgNAki9Vc4Pkb_ac0MnzUZ6=p=1P3QgH7ELU2OZpZGG3ACWiQ@mail.gmail.com>
References: <1421826012-12616-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
 <54BF5D5E.7010908@gmail.com> <54BF6083.7090302@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BF6083.7090302-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 21 January 2015 at 09:17, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> On 01/21/2015 04:03 PM, Michael Kerrisk (man-pages) wrote:
>> On 01/21/2015 08:40 AM, Ma Shimiao wrote:
>>> As annotation in glibc manual is more detailed, change the
>>> thread-safety information to be the same as glibc manual.
>>
>> Thanks, Ma Shimiao. I've applied, but with a question below.
>>
>>
>>>
>>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>> ---
>>>  man3/termios.3 | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/man3/termios.3 b/man3/termios.3
>>> index 371bdf7..8eb04be 100644
>>> --- a/man3/termios.3
>>> +++ b/man3/termios.3
>>> @@ -979,15 +979,14 @@ For an explanation of the terms used in this section, see
>>>  .TS
>>>  allbox;
>>>  lb lb lb
>>> -lw37 l l.
>>> +l l l.
>>>  Interface   Attribute       Value
>>>  T{
>>>  .BR tcgetattr (),
>>>  .BR tcsetattr (),
>>> -.BR tcsendbreak (),
>>>  .BR tcdrain (),
>>> +.br
>>>  .BR tcflush (),
>>> -.BR tcflow (),
>>>  .BR cfmakeraw (),
>>>  .BR cfgetispeed (),
>>>  .BR cfgetospeed (),
>>> @@ -995,6 +994,10 @@ T{
>>>  .BR cfsetospeed (),
>>>  .BR cfsetspeed ()
>>>  T}  Thread safety   MT-Safe
>>> +T{
>>> +.BR tcsendbreak (),
>>> +.BR tcflow ()
>>> +T}  Thread safety   MT-Unsafe race:tcattr(filedes)/bsd
>>
>> What does "bsd" mean here?
> /bsd means if the glibc is built for BSD(Berkeley Software Distribution) kernel, the function
> is MT-Unsafe. Otherwise, the function is MT-Safe.

Yes, but these are the *Linux* man pages. So, this information is more
confusing than useful, I would say.

The pages should describe the Linux situation. So, something needs to
be fixed. Should the patch be reverted, or should it be revised?

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
