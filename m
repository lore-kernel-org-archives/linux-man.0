From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [update report]proc.5: account pmd page tables to the process
Date: Tue, 5 May 2015 18:39:11 +0200
Message-ID: <CAKgNAkjPEQ+yV_eVrcEdnJxthOQhO7GHvhUf+tAEP+4tmX4rAA@mail.gmail.com>
References: <CAKgNAkgRMB3K0di=8BMzRDw4Qn1ZLCFO_AMTYQ=Q6topC5oogw@mail.gmail.com>
 <20150430111448.44B11A5@black.fi.intel.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430111448.44B11A5-mPwCgTtGw1Jrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Weijie Yang <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 30 April 2015 at 13:14, Kirill A. Shutemov
<kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Michael Kerrisk (man-pages) wrote:
>> [CC += Kirill]
>>
>> Hello Weijie Yang, and Kirill,
>>
>> Kirill, your commit changed the user-space ABI but there was nothing
>> in the commit message about that, nor did it CC linux-api@. It makes
>> my life easier when those things happen ;-).
>>
>> On 28 April 2015 at 10:47, Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > Since kernel v4.0, pmd page account is added into /proc/[pid]/status
>> >
>> > See detail:
>> > commit dc6c9a35b66b520cf67e05d8ca60ebecad3b0479
>> > Author: Kirill A. Shutemov <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> > Date:   Wed Feb 11 15:26:50 2015 -0800
>> >
>> >     mm: account pmd page tables to the process
>> >
>> >
>> > I don't find a description for it when I read the latest man-page, so I send this email.
>> > Maybe there is already a plan for it and I miss it, anyway, I send this report.
>>
>> I added the following to the proc(5) entry for /proc/PID/status:
>>
>>       VmPMD :  Page middle directory size (since Linux 4.0).
>
> I'm not native speaker, but I think "directory" should be plural --
> there are more than one directory.
>
> And I would rather say "Size of second level page tables".

Thanks, Kirill. I change the text to what you wrote.

> PMD is not really in middle since 4-level page tables was introduced and
> definitely will not be in middle when we get 5-level page tables.

Oh -- I didn't realize we were getting another level of PTs!

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
