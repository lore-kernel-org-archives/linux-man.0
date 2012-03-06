From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Wed, 7 Mar 2012 09:07:38 +1300
Message-ID: <CAKgNAkg1Mhwcs_-LroUCF57e2GKDHPKsJRYKt5QW=Z1tGA8Ojw@mail.gmail.com>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org>
 <1330518197-12825-2-git-send-email-gorcunov@openvz.org> <CAKgNAkiOY-p7duD_wfed_Tk8T8SR5r1JCTa=0ne3-VQ30mQE-g@mail.gmail.com>
 <20120306182210.GJ29367@moon> <CAKgNAkjejoxs43UVgAR+YW7JZ1btCpMr+=K4jrZz=Ktv-TnS8w@mail.gmail.com>
 <20120306200111.GM29367@moon>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120306200111.GM29367@moon>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Mar 7, 2012 at 9:01 AM, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Mar 07, 2012 at 08:52:30AM +1300, Michael Kerrisk (man-pages) wrote:
> ...
>> >
>> > If you prefer to have it done earlier -- no problem, I'll cook
>> > a patch today instead on top of everything we've already
>> > merged into linux-next. What would you prefer?
>>
>> It would make sense if the capability requirements were finalized
>> before 3.3 is released. Changing them after 3.3 creates (at least a
>> little) pain for userspace.
>>
>
> OK. I'll update and send a patch out.

Take a look at http://man7.org/linux/man-pages/man7/capabilities.7.html

The two most obvious alternatives are CAP_SYS_RESOURCE and
CAP_SYS_NICE. Maybe CAP_SYS_NICE is better? I say this because of the
(slight) similarity to existing operations in the CAP_SYS_NICE list.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
