From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] perf_event_open.2: document new comm_exec flag
Date: Sun, 17 Aug 2014 10:27:59 -0500
Message-ID: <53F0C9FF.9010302@gmail.com>
References: <alpine.DEB.2.11.1408061401400.1325@vincent-weaver-1.umelst.maine.edu> <53EE5D84.5050809@gmail.com> <alpine.DEB.2.11.1408160654480.32274@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1408160654480.32274-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/16/2014 05:58 AM, Vince Weaver wrote:
> On Fri, 15 Aug 2014, Michael Kerrisk (man-pages) wrote:
>>> +If the additional
>>> +.I comm_exec
>>> +flag can be set (starting with Linux 3.16)
>>
>> Would that last line be better as:
>>
>>     flag is set (possible since Linux 3.16)
>>
> 
> It's tricky wording, as you can always set the flag, but the actual open 
> call will fail pre-3.16 if the flag is set.
> 
> Maybe 
> 	"flag is successfully set (possible since Linux 3.16)"
> 
> might be better?

Thanks. So, I've now made it 

[[
If the 
.I comm_exec
flag is also successfully set (possible since Linux 3.16),
then the misc flag
.B PERF_RECORD_MISC_COMM_EXEC
can be used to differentiate the
.BR exec (2)
case from the others.
]]

Okay?

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
