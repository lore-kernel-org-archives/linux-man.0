From: Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_{SET,GET}_CHILD_SUBREAPER
Date: Fri, 11 Jan 2013 13:22:25 +0100
Message-ID: <CAPXgP12dBRrbCEzWq52cRMXtqSDr6RfHoETcAFw-1sfnTkTVrg@mail.gmail.com>
References: <1344233940-2680-4-git-send-email-shawnlandden@gmail.com>
 <50240ad3.6ae4440a.5977.ffffc0ce@mx.google.com> <CAKgNAkj3=v7uYEj7EBYnEbAJU6E_9Vh6Civn-VLWXsjJgJ=QSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj3=v7uYEj7EBYnEbAJU6E_9Vh6Civn-VLWXsjJgJ=QSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jan 10, 2013 at 11:51 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +All children of this process will inherit a flag if they should
>> +look for a child_subreaper process at exit. Set
>> +.I arg2

This is a non-interesting kernel implementation detail, a simple
optimization in the kernel code flow, which should not be documented
here.

It actually is a bit misguiding, I think, because it might give the
impression to the reader, that this can be influenced with the prctl.
Children processes cannot escape the sub-reaper parent, they can only
become a new sub-reaper themselves.

I'll check with Lennart later today for a reworded sentence.

Thanks,
Kay
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
