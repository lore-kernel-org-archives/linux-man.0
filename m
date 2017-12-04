From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mount.2: Add EINVAL error condition when MS_BINDing
 MNT_LOCKED submounts
Date: Mon, 4 Dec 2017 15:01:52 -0500
Message-ID: <CABV8kRzrL1B9AOtG3vKG_O1nTvGKf2hWUqB7hx9ecXPOr2Kb=w@mail.gmail.com>
References: <20171127224417.GA5122@juliacomputing.com> <b35b0de4-ef4c-702e-b2d0-a78608fe745b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b35b0de4-ef4c-702e-b2d0-a78608fe745b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Dec 4, 2017 at 2:55 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Keno,
>
> Question below....
>
>> diff --git a/man2/mount.2 b/man2/mount.2
>> index 87cb1a9..8d2a347 100644
>> --- a/man2/mount.2
>> +++ b/man2/mount.2
>> @@ -650,6 +650,14 @@ or
>>  .BR EINVAL
>>  An attempt was made to bind mount an unbindable mount.
>>  .TP
>> +.BR EINVAL
>> +In an unpriviledged mount namespace, a bind operation
>
> What is meant by "an unprivileged mount namespace"?

Hi Michael,

I believe the only way to create an unprivileged mount namespace is to
do so from a user namespace
created by an unprivileged user (that's how I ran into it).

Thanks,
Keno
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
