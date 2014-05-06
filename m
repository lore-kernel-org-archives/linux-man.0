From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Tue, 06 May 2014 12:45:30 +0200
Message-ID: <5368BD4A.5080902@gmail.com>
References: <1399291463-13683-1-git-send-email-lczerner@redhat.com> <536787C0.9070204@gmail.com> <alpine.LFD.2.00.1405051504210.2223@localhost.localdomain> <CAKgNAkg0-za69pesggjyEzSPEwQ60TtgEbhoUoZsg6F_9qsMbQ@mail.gmail.com> <alpine.LFD.2.00.1405061156290.2255@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1405061156290.2255-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?THVrw6HFoSBDemVybmVy?= <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> [[
>> Zeroing is done within the filesystem preferably by converting the r=
ange into
>> unwritten extents.
>> This approach means that the specified range will not be physically =
zeroed
>> out on the device (except for partial blocks at the either end of th=
e range),
>> and I/O is (otherwise) required only to update file metadata.
>> ]]
>=20
> Perfect. Just get rid of "file" in the "file metadata" and I think
> it's ok. The reason is that those are also file system metadata in
> the case you're actually allocating blocks.

Done! Thanks for your patient help, Luk=C3=A1=C5=A1.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
