From: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] getrlimit.2: Mention unit used by RLIMIT_CORE and RLIMIT_FSIZE
Date: Sat, 02 Sep 2017 23:24:54 -0300
Message-ID: <87fuc4semh.fsf@linux.vnet.ibm.com>
References: <20170901202743.9678-1-bauerman@linux.vnet.ibm.com> <07aa1031-91b5-f1ca-b23f-858c06c3a9f8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <07aa1031-91b5-f1ca-b23f-858c06c3a9f8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hello Thiago,
>
> On 09/01/2017 10:27 PM, Thiago Jung Bauermann wrote:
>> It would have been obvious that these limits are in bytes, except that
>> "ulimit -a" in at least bash, dash and zsh says that they're in blocks.
>> This confused me, so I had to check the kernel source code.
>> 
>> My understanding is that they are indeed in bytes, so mention this
>> information in the man page.
>
> Thanks. That was a silly deficiency on the man page. Patch applied.

Thanks!

> I also fixed a similar problem with RLIMIT_DATA.

I didn't occur to me to check the other resources. Thanks for doing that.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
