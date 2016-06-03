From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] assert.3: improved description
Date: Fri, 3 Jun 2016 06:41:49 -0500
Message-ID: <54b3e0ef-578a-4efe-1f1d-17c26967a776@gmail.com>
References: <1464858451.5804.3.camel@redhat.com>
 <dce9e3be-8461-2d09-197d-424a64eed8b7@gmail.com>
 <1464930530.2843.0.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464930530.2843.0.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/03/2016 12:08 AM, Nikos Mavrogiannopoulos wrote:
> On Thu, 2016-06-02 at 18:35 -0500, Michael Kerrisk (man-pages) wrote:
>> Hi Nikos,
>>
>> On 06/02/2016 04:07 AM, Nikos Mavrogiannopoulos wrote:
>>>
>>> Removed text referring to text not being helpful to users. Provide
>>> the error text instead to allow the reader to determine whether it
>>> is helpful.
>>> Recommend against using NDEBUG for programs to excibit
>>> deterministic behavior.
>>> Moved description ahead of recommendations.
>> The patch concept seems good to me, butfor some reason it does not
>> apply.
>> Could you check against latest git please?
> 
> I've rebased it against current master. Attached in case my mailer
> broke the patch.

Thanks, Nikos. Applied. I also did some further changes, so
you might want to take a look.

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
