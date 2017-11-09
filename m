From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] acct.2: wfix
Date: Thu, 9 Nov 2017 09:24:04 +0100
Message-ID: <51b60a7e-8f3b-379a-cd4f-c2a8c55f3af7@gmail.com>
References: <9bbfbda5-b614-314d-dad9-ad2ea789d4d1@gmail.com>
 <a843da9a-b6a3-b698-9fbf-460ad5b1e361@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a843da9a-b6a3-b698-9fbf-460ad5b1e361-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun Lim,

On 11/09/2017 09:06 AM, Michael Kerrisk (man-pages) wrote:
> Hello Seonghun Lim,
> 
> This is a nice series of patches that you've sent. But none
> of the patches applies against upstream. Looking at the source
> of the mail messages, there are some strange character sequences
> at the start of various lines. Could you fix up
> and resubmit the patch series please?

Okay -- I've found a way to manually fix the patches that is not too 
burdensome. But there's definitely some character set problem with
your patches... No need to resubmit these patches though.

Cheers,

Michael

> On 11/08/2017 08:00 AM, Seonghun Lim wrote:
>>  man2/acct.2 | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/man2/acct.2 b/man2/acct.2
>> index 27b0c5cf4..f9efe437f 100644
>> --- a/man2/acct.2
>> +++ b/man2/acct.2
>> @@ -107,7 +107,7 @@ was too long.
>>  The system-wide limit on the total number of open files has been reached.
>>  .TP
>>  .B ENOENT
>> -The specified filename does not exist.
>> +The specified file does not exist.
>>  .TP
>>  .B ENOMEM
>>  Out of memory.
>>
>>
>>
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
