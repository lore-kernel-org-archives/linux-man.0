From: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] s390_sthyi.2: New page for s390-specific
 s390_sthyi(2)
Date: Wed, 22 Nov 2017 11:02:54 +0800
Message-ID: <f6423fd8-c2e9-e1e9-9543-1acc6bcc2a94@linux.vnet.ibm.com>
References: <20171120133420.4700-1-haoqf@linux.vnet.ibm.com>
 <8b4188fa-bdda-c3eb-5184-cecf78267f0f@gmail.com>
 <10afe17f-9874-06c6-acd3-7da8fe14af55@linux.vnet.ibm.com>
 <CAKgNAkiRRqLpADiObHVGqxfgwYSqU23LuMEnThQmU1xXTTNMZA@mail.gmail.com>
 <20171121102314.GB4046@osiris>
 <CAKgNAkjmx9aNsFpeXDbum1m8zkCV3EYGrrdXs8Z7V1RZnJTsuw@mail.gmail.com>
 <20171121115102.GC4046@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171121115102.GC4046@osiris>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Stefan Raspl <raspl-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org



ÔÚ 2017/11/21 19:51, Heiko Carstens Ð´µÀ:
> Hello Michael
>
>> On 21 November 2017 at 11:23, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Tue, Nov 21, 2017 at 09:48:02AM +0100, Michael Kerrisk (man-pages) wrote:
>>>>>> What does "On other cases" mean? When do those cases happen?
>>>>>> Could you reword please.
>>>>> The case is:
>>>>> If the STHYI facility is enabled and the system call fails to execute the
>>>>> underlying
>>>>> STHYI instruction, the value of condition code is returned, which currently
>>>>> is only
>>>>> 3 indicating "unsupported function code".
>>>>> Is this OK to put it here?
>>>> Let me see if I understand correctly. There are three possible return
>>>> values for this system call:
>>>>
>>>> 0 ==> success
>>>> -1 ==> failure (and errno is set)
>>>> [condition code value is returned -- e,g,, 3]
>>>>
>>>> This last case is a kind of failure in the system call, right?
>>>>
>>>> If this is correct, this is a highly unusual--possibly even
>>>> unique--model for the system call return value. Most (in fact, I think
>>>> all) system calls indicate errors by returning -1. Values >= 0 always
>>>> mean success. I think it may be worth revisiting this design, to make
>>>> it more consistent with the usual conventions. For example, why not
>>>> handle the last case by returning -1, setting errno to some value
>>>> (maybe ENOTSUP), and return the condition code in *buffer?.
>>> Well, I would have written this differently: on success the return value
>>> matches the condition code of the STHYI instructions, which is a value
>>> between 0-3 (that is: emulation succeeded). If a condition code, which is
>>> not 0, is an error or not, may not be the same in the future, if the
>>> instruction gets extended.
>>>
>>> That being said, if you think this still doesn't make much sense, we might
>>> have to reconsider the interface.
>> When you put it as above, the interface feels less odd. But, in that
>> case, I think the return value should be documented more as you word
>> it above. Something like:
>>
>> "On success the return value matches the condition code of the STHYI
>> instructions, which is a value between 0-3 (that is: emulation
>> succeeded)."
>>
>> Followed by an explanation of the meaning of 0 and any of the values >
>> 0 that may be returned.
> Yes, I agree with you.
Thanks a lot and I'll change it accordingly.

-- 
Regards
QingFeng Hao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
