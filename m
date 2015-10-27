From: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>
Subject: Re: [patch] document that O_TMPFILE works with shm_open
Date: Tue, 27 Oct 2015 23:19:38 +0100
Message-ID: <87vb9sc5tx.fsf@mid.deneb.enyo.de>
References: <562B2CD9.80901@dancol.org> <87ziz4c665.fsf@mid.deneb.enyo.de>
	<562FF70C.5030600@dancol.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562FF70C.5030600-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org> (Daniel Colascione's message of
	"Tue, 27 Oct 2015 15:13:32 -0700")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* Daniel Colascione:

> On 10/27/2015 03:12 PM, Florian Weimer wrote:
>> * Daniel Colascione:
>>
>>> This test program works fine. (Watch it work in strace.) This patch is
>>> against git master. It's okay to document accidental features, right?
>>>
>>> int
>>> main()
>>> {
>>>     int shmfd = shm_open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
>>>     ftruncate(shmfd, 1000);
>>>     mmap(NULL, 1000, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, 0);
>>>
>>>     return 0;
>>> }
>>
>> This looks more like a bug to me.  I wouldn't count on it continuing
>> to work.  glibc already tightened the rules for the name once.
>
> I don't think they can break compatibility like that, and besides: it's
> a useful feature, not a bug.

Names not starting with '/' do not have well-defined behavior with
shm_open.  Applications shouldn't rely on that.

> Is it better for people to blindly open files in /dev/shm? Because
> that's what they do today.

memfd_create is the official interface for this purpose.  But neither
O_TMPFILE or memfd_create is very widely supported.

Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
