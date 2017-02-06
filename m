From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] netlink.7: Update libnl homepage URL
Date: Mon, 6 Feb 2017 11:21:27 +0100
Message-ID: <20170206102127.vjgvzo4ufz7wmttk@jwilk.net>
References: <20170204104956.4620-1-jwilk@jwilk.net>
 <d32fc5df-204d-fe83-b2dc-27935de4bcc0@gmail.com>
 <5895CE95.1050303@bfs.de>
 <CAKgNAkjo6djahZnWhXicZEt9LTfqrwwvcB8nz=AnbokTsW2uMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjo6djahZnWhXicZEt9LTfqrwwvcB8nz=AnbokTsW2uMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 2017-02-06, 08:28:
>>>>-.UR http://people.suug.ch\:/~tgr\:/libnl/
>>>>+.UR http://www.infradead.org\:/~tgr\:/libnl/
>>>> information about libnl
>>>> .UE
>>
>>does not work for me. (can not connect)

Yeah, the server appears to be down. :/
I'll ask on the libnl mailing list what's going on.

>>google finds https://www.infradead.org/~tgr/libnl/
>>             ^^^^^^
>>does not work for me either perhaps a temporally problem.

The URL I used is in the latest libnl source, so one can presume it's official. 
I know that Google can be overzealous about HTTP->HTTPS upgrades, so I decided 
to be conservative and use the HTTP one.

>Jakub, did you test the URL at the time you wrote the patch?

I did a few days before that. According to my browser cache the site was still 
up on 2017-01-31.

-- 
Jakub Wilk
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
