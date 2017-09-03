From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getrlimit.2: Mention unit used by RLIMIT_CORE and
 RLIMIT_FSIZE
Date: Sun, 3 Sep 2017 13:32:59 +0200
Message-ID: <dd17fde2-80cf-096a-3c74-2cdbb375a217@gmail.com>
References: <20170901202743.9678-1-bauerman@linux.vnet.ibm.com>
 <07aa1031-91b5-f1ca-b23f-858c06c3a9f8@gmail.com>
 <87fuc4semh.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fuc4semh.fsf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/03/2017 04:24 AM, Thiago Jung Bauermann wrote:
> 
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
>> Hello Thiago,
>>
>> On 09/01/2017 10:27 PM, Thiago Jung Bauermann wrote:
>>> It would have been obvious that these limits are in bytes, except that
>>> "ulimit -a" in at least bash, dash and zsh says that they're in blocks.
>>> This confused me, so I had to check the kernel source code.
>>>
>>> My understanding is that they are indeed in bytes, so mention this
>>> information in the man page.
>>
>> Thanks. That was a silly deficiency on the man page. Patch applied.
> 
> Thanks!
> 
>> I also fixed a similar problem with RLIMIT_DATA.
> 
> I didn't occur to me to check the other resources. Thanks for doing that.

No worries. 

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
