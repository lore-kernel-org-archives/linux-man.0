From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Correct description of null-termination in PR_[GS]ET_NAME
Date: Tue, 28 Oct 2014 15:08:09 +0100
Message-ID: <CAKgNAkjvyrMyYVGy2HcCFd9Bvyw681HgrU3Kpw_q91UdFE05HQ@mail.gmail.com>
References: <mvmr3y1u1t8.fsf@hawking.suse.de> <544F9996.7090906@gmail.com> <mvmk33kmgrc.fsf@hawking.suse.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <mvmk33kmgrc.fsf-8jEJWzg51KSXcDkGTvBoYw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Oct 28, 2014 at 3:05 PM, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> I added here:
>>
>>   (If the length of the string, including the terminating null byte,
>>   exceeds 16 bytes, the string is silently truncated.)
>>
>> Okay?
>
> Ok.


Thanks for the confirmation, Andreas.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
