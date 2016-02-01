From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] aio.7: Improve example
Date: Mon, 1 Feb 2016 15:25:54 +0100
Message-ID: <56AF6AF2.9090009@gmail.com>
References: <1454320018-14176-1-git-send-email-agruenba@redhat.com>
 <56AF4AF9.9000807@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56AF4AF9.9000807-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2016 01:09 PM, walter harms wrote:
> 
> 
> Am 01.02.2016 10:46, schrieb Andreas Gruenbacher:
>> When aio_sigevent.sigev_notify is set to SIGEV_SIGNAL, signal handlers
>> called for asychronous I/O operations will have si->si_code set to
>> SI_ASYNCIO.  Check to make sure that si->si_value.sival_ptr is defined.
>>
>> Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  aio.7 | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/aio.7 b/aio.7
>> index 1f861da..21193fd 100644
>> --- a/aio.7
>> +++ b/aio.7
>> @@ -281,12 +281,14 @@ quitHandler(int sig)
>>  static void                 /* Handler for I/O completion signal */
>>  aioSigHandler(int sig, siginfo_t *si, void *ucontext)
>>  {
>> -    write(STDOUT_FILENO, "I/O completion signal received\\n", 31);
>> +    if (si->si_code == SI_ASYNCIO) {
>> +        write(STDOUT_FILENO, "I/O completion signal received\\n", 31);
> 
> what about the replace write with dprintf ? dprintf is POSIX since 2008.

Hi Walter,

The problem there is that dprintf() is not async-signal-safe.

Cheers,

Michael



> re,
>  wh
> 
>>  
>> -    /* The corresponding ioRequest structure would be available as
>> -           struct ioRequest *ioReq = si\->si_value.sival_ptr;
>> -       and the file descriptor would then be available via
>> -           ioReq\->aiocbp\->aio_fildes */
>> +        /* The corresponding ioRequest structure would be available as
>> +               struct ioRequest *ioReq = si\->si_value.sival_ptr;
>> +           and the file descriptor would then be available via
>> +               ioReq\->aiocbp\->aio_fildes */
>> +    }
>>  }
>>  
>>  int
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
