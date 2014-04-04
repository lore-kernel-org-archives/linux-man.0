From: Stef Bon <stefbon@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Fri, 4 Apr 2014 22:24:02 +0200
Message-ID: <CANXojcx18esEq6CHjiqpiYCMh635cVsSqfmBnfZ=25ngztNHzw@mail.gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
	<871txeifsv.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871txeifsv.fsf@x220.int.ebiederm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: mtk.manpages@gmail.com, John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, radu.voicilas@gmail.com, daniel@veillard.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net
List-Id: linux-man@vger.kernel.org

2014-04-03 17:38 GMT+02:00 Eric W. Biederman <ebiederm@xmission.com>:

>
> Other pitfalls.
>
> Inotify only report events that a user space program triggers through
> the filesystem API.  Which means inotify is limited for remote
> filesystems

I'm working on enabling fsnotify for fuse. The sending of a watch/mask
to userspace works, and the fuse filesystem can forward the watch to
it's backend.
Reporting delete events back to the kernel works with the help of one
existing call fuse_lowlevel_notify_delete. There is no existing call
to report a create, so I'm working on that.

( at this moment I'm trying to enable the most simple events : delete
and create of an entry in a directory which is watched).

Stef Bon
