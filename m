From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: adjust description of the fanotify queue
Date: Wed, 7 May 2014 21:59:00 +0200
Message-ID: <CAKgNAkiat3Uu8YLyrCs-_dMO36MhdTaQsrkhbFCRF65RCT+OfA@mail.gmail.com>
References: <53686BA4.6050505@gmail.com> <1399401666-24806-1-git-send-email-xypron.glpk@gmx.de>
 <5369EC70.1040009@gmail.com> <536A8344.50804@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A8344.50804-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On Wed, May 7, 2014 at 9:02 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> On 07.05.2014 10:18, Michael Kerrisk (man-pages) wrote:
>>
>>
>> I've also pushed a few other fixes to the pages. I'd be happy if you could
>> take a look at these commits in particular, to check I injected no errors:
>>
>> 3253bbc
>
>> +When calling
>> +.BR fanotify_mark (2),
>> +the caller may specify (via the
>> +.I event_f_flags
>
> This is incorrect. fanotify_mark has no argument event_f_flags.
> event_f_flags is an argument of fanotify_init(2).

So just s/fanotify_mark/fanotify_init/, in the above patch, oder?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
