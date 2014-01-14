From: Alexey Perevalov <a.perevalov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Deferrable timers support for timerfd API
Date: Tue, 14 Jan 2014 10:44:29 +0400
Message-ID: <52D4DCCD.8040109@samsung.com>
References: <1389609835-24377-1-git-send-email-a.perevalov@samsung.com>
 <52D40681.3030801@samsung.com> <877ga34wd1.fsf@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <877ga34wd1.fsf-KWJ+5VKanrL29G5dvP0v1laTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/13/2014 09:36 PM, Andi Kleen wrote:
> Alexey Perevalov <a.perevalov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> writes:
>
>> Hello all,
>>
>> one remark - timerfd is not documented in linux Documentation
>> directory at all.
>> I think it's better to have such description.
> The documentation is the manpage in man-pages.
>
> Ideally you change would come with the changed manpage
> too.
>
> -Andi
>
Hello Andi,
  thank you,

I found ./man2/timerfd_create.2 from 
http://git.kernel.org/pub/scm/docs/man-pages/man-pages is outdated.
TFD_TIMER_CANCEL_ON_SET isn't described, just mention "since linux 3.0"
Clockids CLOCK_REALTIME_ALARM, CLOCK_BOOTTIME_ALARM isn't mentioned at all.

I'm not technical writer, but I'll try to describe _ALARM clockids and 
flags introduced by Anton's patchset.


-- 
Best regards,
Alexey Perevalov
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
