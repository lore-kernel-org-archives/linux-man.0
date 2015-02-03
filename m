From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 03 Feb 2015 19:10:52 +0900
Message-ID: <877fvze24z.fsf@mail.parknet.co.jp>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
	<1422042884-10824-1-git-send-email-xypron.glpk@gmx.de>
	<5984550D-1518-490C-9A3F-3F9B1FA2EA00@dilger.ca>
	<CAKgNAki1EnYx+chg1eouwF54youb_tjQ+hW9Ea_M_=cvccu1nA@mail.gmail.com>
	<775BBA28-BEDF-4F53-A845-D11F4337026B@dilger.ca>
	<CAKgNAkjgChZ_R8Qbg29rHKdarV2rbwa2=rf7TgxniZOFePOW-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkjgChZ_R8Qbg29rHKdarV2rbwa2=rf7TgxniZOFePOW-A@mail.gmail.com>
	(Michael Kerrisk's message of "Tue, 3 Feb 2015 10:55:55 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andreas Dilger <adilger@dilger.ca>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:

>> Given that FAT ioctls are not widely used by applications, the
>> actual ABI (numeric constants) isn't changing, and the workaround
>> is simple, I'd expect that the time before deprecating the old
>> constants could be fairly short.
>
> True. And now that we're actually documenting this stuff, it would be
> a good time to make the change, so that the new names appear in the
> docs.
>
> Hirofumi, what do you think?

I have no strong opinion. I'm not sure whether it has value to change
this ancient stuff though. If someone wants to do, I have no objection
and will do ack.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
