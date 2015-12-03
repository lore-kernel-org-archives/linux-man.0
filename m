From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtld-audit.7: tfix
Date: Thu, 03 Dec 2015 07:02:42 +0100
Message-ID: <565FDB02.3070604@gmail.com>
References: <1446509897-21059-1-git-send-email-namhyung@gmail.com> <565F18F7.4060704@gmail.com> <20151203010355.GA4554@sejong>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151203010355.GA4554@sejong>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Namhyung Kim

On 12/03/2015 02:03 AM, Namhyung Kim wrote:
> Hi Michael,
> 
> On Wed, Dec 02, 2015 at 05:14:47PM +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Namhyung Kim,
>>
>> I need some explanation here. This is not a simple 
>> typo fix, I believe. Why do you think the current text 
>> is wrong?
> 
> Actually la_pltenter() is called regardless of the value of framesizep
> but la_pltexit() is called only if la_pltenter() returns with non-zero
> framesizep set.  I spent long time to figure out why la_pltexit() is
> not called at all.
> 
> Quoting comments in glibc/sysdeps/x86_64/dl-trampoline.h:
> 
>   /* There's nothing in the frame size, so there
>      will be no call to the _dl_call_pltexit. */
> 
> and
> 
>   /* At this point we need to prepare new stack for the function
>      which has to be called.  We copy the original stack to a
>      temporary buffer of the size specified by the 'framesize'
>      returned from _dl_profile_fixup */
> 
> 
> I think it's because it needs to preserve 'inregs' to be passed to
> la_pltexit().
> 
> The _dl_profile_fixup() sets the '*framesizep' to maximum value of
> what la_pltenter() sets.  Please see glibc/elf/dl-runtime.c file.

Thanks -- that's the kind of info I need for the commit message!
I've committed your patch, with that text. Thanks for all of
the info.

Cheers,

Michael


>>
>> On 11/03/2015 01:18 AM, Namhyung Kim wrote:
>>> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  man7/rtld-audit.7 | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/man7/rtld-audit.7 b/man7/rtld-audit.7
>>> index d0f7563..643bc57 100644
>>> --- a/man7/rtld-audit.7
>>> +++ b/man7/rtld-audit.7
>>> @@ -400,7 +400,7 @@ If different
>>>  invocations for this symbol return different values,
>>>  then the maximum returned value is used.
>>>  The
>>> -.BR la_pltenter ()
>>> +.BR la_pltexit ()
>>>  function is called only if this buffer is
>>>  explicitly set to a suitable value.
>>>  
>>>
>>
>>
>> -- 
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
