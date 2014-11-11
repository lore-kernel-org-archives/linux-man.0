From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [bug report] fadvise64.2: Linux actually returns ESPIPE on FIFO/pipe
Date: Tue, 11 Nov 2014 10:01:26 +0100
Message-ID: <CAKgNAkgxCf-KVd05J7dwB+AZcX+-aK=7xQFiryTyNT7fMOD=NA@mail.gmail.com>
References: <000001cffd7f$cc610ce0$652326a0$%yang@samsung.com> <CAL1ERfM1P4OYDDwWGJS0+XArDByaE2mUvPCRbhg8Ri-RsLutDA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1ERfM1P4OYDDwWGJS0+XArDByaE2mUvPCRbhg8Ri-RsLutDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Weijie Yang <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Nov 11, 2014 at 8:33 AM, Weijie Yang <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Nov 11, 2014 at 3:18 PM, Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> In man-page fadvise64.2(and its variants), the following is outdated:
>>
>> "ESPIPE The specified file descriptor refers to a pipe or FIFO.  (Linux actually returns EINVAL in this case.)"
>>
>>
>> In Linux 2.6.12, kernel was modified to match the POSIX: return ESPIPE on FIFO/pipe
>
> I'm very sorry, the version is 2.6.15.

Hello Weijie Yang,

Thanks for the report. I've amended the page. In fact, the kernel
version was 2.6.16.

See http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=e0f1f1765bdde2d683103ae6a2502e3cadeebca6

Cheers,

Michael

>> See detail:
>>
>> commit 87ba81dba431232548ce29d5d224115d0c2355ac
>> Author: Valentine Barshak <vbarshak-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
>> Date:   Sun Jan 8 01:03:44 2006 -0800
>>
>>     [PATCH] fadvise: return ESPIPE on FIFO/pipe
>>
>>     The patch makes posix_fadvise return ESPIPE on FIFO/pipe in order to be
>>     fully POSIX-compliant.
>>
>>     Signed-off-by: Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>
>>     Signed-off-by: Linus Torvalds <torvalds-3NddpPZAyC0@public.gmane.org>
>>
>> diff --git a/mm/fadvise.c b/mm/fadvise.c
>> index 5f19e87..d257c89 100644
>> --- a/mm/fadvise.c
>> +++ b/mm/fadvise.c
>> @@ -37,6 +37,11 @@ asmlinkage long sys_fadvise64_64(int fd, loff_t offset, loff_t len, int advice)
>>         if (!file)
>>                 return -EBADF;
>>
>> +       if (S_ISFIFO(file->f_dentry->d_inode->i_mode)) {
>> +               ret = -ESPIPE;
>> +               goto out;
>> +       }
>> +
>>         mapping = file->f_mapping;
>>         if (!mapping || len < 0) {
>>                 ret = -EINVAL;
>>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
