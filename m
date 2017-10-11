From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ld.so(8) need clarification
Date: Wed, 11 Oct 2017 09:53:49 +0800
Message-ID: <CAJYFCiMV-ymfv=XugRZRUrdQQT1PnF-HmLdOBUk2z2P5UL4gGg@mail.gmail.com>
References: <CAJYFCiOX0rt6sRioUqQei2dyz_F9+43DbQub3Ru5GLSS_efqAQ@mail.gmail.com>
 <CAKgNAkgAvX_V59JpjT48Lgtiqco4a8p0myZfjBV7z-jOp5K8tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgAvX_V59JpjT48Lgtiqco4a8p0myZfjBV7z-jOp5K8tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks Michael,

2017-10-11 0:58 GMT+08:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello Yubin,
>
> On 10 October 2017 at 15:48, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi,
>> In ld.so(8), when explaining whether a process is in the so-called
>> "secure execution mode", there are three circumstances:
>>
>>    *  The process's real and effective user IDs differ, or the real and
>>       effective group IDs differ.  This typically occurs as a result of
>>       executing a set-user-ID or set-group-ID program.
>>
>>    *  A process with a non-root user ID executed a binary that conferred
>>       permitted or effective capabilities.
>>
>>    *  A nonzero value may have been set by a Linux Security Module.
>>
>> I am confused with the second circumstance. What does it mean by
>> "confer permitted or effective capabilities"?
>
> Maybe this is a language issue. Doe it make more sense as:
>
> " A process with a non-root user ID executed a binary that conferred
> capabilities to the process's permitted or effective capability set."

Yes this makes more sense. But I am still confused with why this is. I
mean, "a binary that conferred capabilities to the process's permitted
or effective capability set", is a very very normal scenario. What
does it really mean by "the process's permitted or effective
capability set". For me, that is just _any_ capability set, which is
not that rational...

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
