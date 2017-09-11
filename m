From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/15] Updates of in-kernel documentation pointers
Date: Mon, 11 Sep 2017 13:56:07 +0200
Message-ID: <CACGkJduPq+ETSw95FikQU2daBQeLmb4tbJLb00Sa1QrKj=35=g@mail.gmail.com>
References: <20170911030347.GA24854@asgard.redhat.com> <20170911114747.GA3463@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911114747.GA3463-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Sep 11, 2017 at 1:47 PM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Mon, Sep 11, 2017 at 05:03:47AM +0200, Eugene Syromyatnikov wrote:
>> Hello.
>>
>> I've noticed that some of Linux kernel in-tree documentation pointers
>> are no longer valid and decided to check the validity for the rest of
>> them with some one-liner. As it turned out, there are quite a few of
>> them, in part due to latest ReST conversion effort. This patch set aims
>> at amending documentation pointers that are no longer valid with the
>> information about current location. I'm not quite sure about
>> wording/formatting, and do not guarantee that I haven't miss anything,
>> so I hope that this could be at least useful as a starting point.
>
> Do these pointers even have a place in man pages?  I'd much rather
> have anything that matters added to the man page instead.

Well, the kernel documentation documents kernel side of things. Some
of these pointers indeed due to some sort of sloppiness (mtrr andkeys
references in proc.5, for example), but others are indeed useful,
since contain significant amount of information needed for the full
understanding of the topic (like crypto or key management APIs).
Moreover, this documentation is better maintained by kernel developers
for some reason, so there are more chances that it stays actual. I see
them (especially in "See also" section) as a documents for additional
information on the topic, like RFCs and stuff.

-- 
Eugene Syromyatnikov
mailto:evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:esyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
