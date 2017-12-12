From: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/1] s390_sthyi.2: New page for s390-specific
 s390_sthyi(2)
Date: Tue, 12 Dec 2017 13:41:57 +0800
Message-ID: <67628aaf-1611-6b00-81d8-f644dc643748@linux.vnet.ibm.com>
References: <20171123134527.23505-1-haoqf@linux.vnet.ibm.com>
 <8c6f1263-8797-4065-250c-45ef0b74ebfb@gmail.com>
 <e6b0882b-520a-786d-2759-e0ed442e9262@linux.vnet.ibm.com>
 <CAKgNAki7JYz9uZvDHcPcQa3_UxEAimqeOi=RqOQQOfogXa7mdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki7JYz9uZvDHcPcQa3_UxEAimqeOi=RqOQQOfogXa7mdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, raspl-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org



在 2017/12/12 12:22, Michael Kerrisk (man-pages) 写道:
> Hello QingFeng,
>
> On 12 December 2017 at 03:40, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>>
>> 在 2017/12/12 3:00, Michael Kerrisk (man-pages) 写道:
>>> On 11/23/2017 02:45 PM, QingFeng Hao wrote:
>>>> Signed-off-by: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>>> ---
>>> Thank you for this page, QingFeng!
>>>
>>> I've applied your patch, and made a few tweaks. You may want to look
>>> at the revised version in Git.
>> Michael,
>> Really appreciate your wonderful changes on this man-page, which made it
>> much better!
> You're welcome!
>
>> Just one question about "*buffer" in section "RETURN VALUE"
>> that why using "*buffer" instead of "buffer" here? Is it meant to indicate
>> that
>> it's a pointer?
> Yes, that's the intention. I could also have written something like
> "the location pointed to by buffer", but "*buffer" seemed more
> compact.
>
> Reflecting on this further, I wonder about changing the name of that
> argument in the man page from "buffer" to (say) "resp_buffer". The
> problem is that the term "buffer" (which I realize is what is used in
> the kernel source code) is very generic. A more descriptive name in
> the man page would be helpful I think. (I even think it would be more
> helpful in the source code, but that's another story.) What do you
> think?
I agree to use resp_buffer to reflect that it's for the response. Thanks!
>
> Cheers,
>
> Michael
>

-- 
Regards
QingFeng Hao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
