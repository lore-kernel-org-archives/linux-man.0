From: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: proc(5): minor text updates
Date: Mon, 13 Aug 2012 19:13:37 +0200
Message-ID: <502935C1.60901@googlemail.com>
References: <50202153.6030808@googlemail.com> <CAKgNAkhrmpZuF45iOA52akABSm4hUy4ygR=vEg4XQ_4Ri7DjRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhrmpZuF45iOA52akABSm4hUy4ygR=vEg4XQ_4Ri7DjRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 08/13/12 09:35, Michael Kerrisk (man-pages) wrote:
>> while reading the /proc/[pid]/stat part in proc(5), I noticed two minor
>> issues that should be fixed:
>> 
>> 1. The text reads: "flags %u (%lu before Linux 2.6.22) kernel flags word
>> of the process. For bit meanings, see  the  PF_*  defines  in
>> <linux/sched.h>."
>> 
>> PF_* is obvisously wrong. It should be CLONE_*.
> 
> I haven't looked closely, but I think PF_* is correct. Why do you think
> it's wrong?

To my understanding, flags contains process flags (i.e., CLONE_*), which
are defined in <linux/sched.h>. PF_* flags, on the other hand, specify
protocol flags. Those are not related to <linux/sched.h> at all, but defined
in <bits/socket.h>

Best regards
Tolga Dalman


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
