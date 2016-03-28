From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ptrace(2): wrong kernel version for PTRACE_SEIZE and others
Date: Mon, 28 Mar 2016 16:55:14 +1300
Message-ID: <CAKgNAkg-MfedjbfFqjP7OjXuyN_akats1GJpZPfRk68TgEh8Fg@mail.gmail.com>
References: <CACh33FrJRvC-ZQkBD2DZjW-YYnqNY5iCu_DtB8x+Jz_w80tMPg@mail.gmail.com>
 <20160322111629.GA13320@altlinux.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160322111629.GA13320-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Dmitry,

On 23 March 2016 at 00:16, Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Mar 18, 2016 at 05:21:28PM -0400, Patrick Donnelly wrote:
>> The ptrace(2) man page says that PTRACE_SEIZE, PTRACE_LISTEN, and
>> PTRACE_INTERRUPT was introduced in Linux 3.4. In fact, this was added
>> in 3.1:
>>
>> $ git diff v3.0 v3.1 include/linux/ptrace.h | grep SEIZE
>> +#define PTRACE_SEIZE           0x4206
>> +/* flags in @data for PTRACE_SEIZE */
>> +#define PTRACE_SEIZE_DEVEL     0x80000000 /* temp flag for development */
>
> Yes, PTRACE_SEIZE was introduced by commit v3.1-rc1~308^2~28, but
> it had to be used along with a temporary flag PTRACE_SEIZE_DEVEL,
> which was removed later by commit v3.4-rc1~109^2~20.
>
> That is, between v3.0 and v3.4 we had a test mode of PTRACE_SEIZE API,
> which was not compatible with the current PTRACE_SEIZE API introduced
> in Linux 3.4.

So, it sounds like the page is good as it stands, right?

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
