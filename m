From: Darren Hart <dvhltc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: Futex manpages out of date
Date: Fri, 15 Jan 2010 09:13:12 -0800
Message-ID: <4B50A228.8070401@us.ibm.com>
References: <4B509EA1.8060509@us.ibm.com> <1263575484.4244.445.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263575484.4244.445.camel@laptop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinakar Guniguntala <dino-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, John Kacur <jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Peter Zijlstra wrote:
> On Fri, 2010-01-15 at 08:58 -0800, Darren Hart wrote:
>> The futex man-pages (2,7) from version 3.15-1 and at least a few earlier
>> versions are considerably out of date with respect to the current
>> implementation. They don't document newer op codes, such as:
>>
>> FUTEX_WAIT_BITSET
>> FUTEX_WAKE_BITSET
>> FUTEX_WAKE_OP
>> FUTEX_LOCK_PI
>> FUTEX_UNLOCK_PI
>> FUTEX_WAIT_REQUEUE_PI
>> FUTEX_CMP_REQUEUE_PI
>>
>> These new wait op codes now use absolute timeouts, while the original
>> FUTEX_WAIT uses a relative timeout. Lastly, and most importantly, glibc
>> has removed the futex() wrapper to syscall(SYS_futex, ...). With that in
>> mind, would people prefer that we simply remove the futex man-pages
>> (2,7)?
> 
> A readable text about the interaction between the futex value and the
> various futex ops and how to build proper locking primitives with them
> would be helpful I think, however doing that in the form of a locking
> library (as has been suggested at KS) seems plenty fine to me.
> 
> Readable code is much better than rambling English at conveying this
> stuff.

Perhaps as part of futex-test? An example set of locking primitives 
would be a good way to test the syscall independently of glibc...


-- 
Darren Hart
IBM Linux Technology Center
Real-Time Linux Team
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
