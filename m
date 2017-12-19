From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mount.2: Add EINVAL error condition when MS_BINDing
 MNT_LOCKED submounts
Date: Tue, 19 Dec 2017 14:53:49 +0100
Message-ID: <2eafb02c-d3f3-b3f0-0a63-98eb73150e79@gmail.com>
References: <20171127224417.GA5122@juliacomputing.com>
 <b35b0de4-ef4c-702e-b2d0-a78608fe745b@gmail.com>
 <CABV8kRzrL1B9AOtG3vKG_O1nTvGKf2hWUqB7hx9ecXPOr2Kb=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABV8kRzrL1B9AOtG3vKG_O1nTvGKf2hWUqB7hx9ecXPOr2Kb=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Keno,

On 12/04/2017 09:01 PM, Keno Fischer wrote:
> On Mon, Dec 4, 2017 at 2:55 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Keno,
>>
>> Question below....
>>
>>> diff --git a/man2/mount.2 b/man2/mount.2
>>> index 87cb1a9..8d2a347 100644
>>> --- a/man2/mount.2
>>> +++ b/man2/mount.2
>>> @@ -650,6 +650,14 @@ or
>>>  .BR EINVAL
>>>  An attempt was made to bind mount an unbindable mount.
>>>  .TP
>>> +.BR EINVAL
>>> +In an unpriviledged mount namespace, a bind operation
>>
>> What is meant by "an unprivileged mount namespace"?
> 
> Hi Michael,
> 
> I believe the only way to create an unprivileged mount namespace is to
> do so from a user namespace
> created by an unprivileged user (that's how I ran into it).

Thanks. I applied your patch, and added some words to clarify 
the term "unprivileged mount namespace": 

    (i.e., a mount namespace owned by a user namespace
    that was created by a unprivileged user)

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
