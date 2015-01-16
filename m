From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: user_namespaces.7: tfix
Date: Fri, 16 Jan 2015 07:57:55 +0100
Message-ID: <54B8B673.5010104@gmail.com>
References: <CALhU9t=9sJhNpEUGyr_2Tsvv_DTE-g4KsPSPkqqShruCR-T0KQ@mail.gmail.com> <54B8B3F8.6080504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B8B3F8.6080504-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Ooops -- I misreplied on this one. See below.

On 01/16/2015 07:47 AM, Michael Kerrisk (man-pages) wrote:
> Thanks, Akihiro. Applied.
> 
> Cheers,
> 
> Michael
> 
> 
> On 01/15/2015 06:26 PM, Akihiro Motoki wrote:
>> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
>> index ce4955b..30c5a7d 100644
>> --- a/man7/user_namespaces.7
>> +++ b/man7/user_namespaces.7
>> @@ -292,7 +292,7 @@ flags
>>  and the "atime" flags
>>  .RB ( MS_NOATIME ,
>>  .BR MS_NODIRATIME ,
>> -.BR MS_RELATIME)
>> +.BR MS_REALTIME)

MS_RELATIME is correct (see mount(2)).

But, there is a formatting problem here. That line should be 

.BR MS_RELATIME )

Fixed now.

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
