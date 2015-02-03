From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 3 Feb 2015 10:55:55 +0100
Message-ID: <CAKgNAkjgChZ_R8Qbg29rHKdarV2rbwa2=rf7TgxniZOFePOW-A@mail.gmail.com>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
 <1422042884-10824-1-git-send-email-xypron.glpk@gmx.de> <5984550D-1518-490C-9A3F-3F9B1FA2EA00@dilger.ca>
 <CAKgNAki1EnYx+chg1eouwF54youb_tjQ+hW9Ea_M_=cvccu1nA@mail.gmail.com> <775BBA28-BEDF-4F53-A845-D11F4337026B@dilger.ca>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <775BBA28-BEDF-4F53-A845-D11F4337026B@dilger.ca>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andreas Dilger <adilger@dilger.ca>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Ogawa Hirofumi <hirofumi@mail.parknet.co.jp>, Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 3 February 2015 at 10:48, Andreas Dilger <adilger@dilger.ca> wrote:
> On Feb 3, 2015, at 2:21 AM, Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:
>> On 3 February 2015 at 09:49, Andreas Dilger <adilger@dilger.ca> wrote:
>>> On Jan 23, 2015, at 12:54 PM, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>> +The bits of the bit mask are
>>>> +.TP
>>>> +.B ATTR_RO
>>>> +This bit specifies that the file or directory is read-only.
>>>
>>> It's too bad that these constants have such generic names. It would
>>> be better to use MSDOS_ATTR_* or FAT_ATTR_*, since these are also
>>> exposed to userspace, but are only used by FAT.
>>
>> Agreed. Too late now, I guess, though.
>
> It wouldn't be unreasonable to #define FAT_ATTR_* versions of these
> constants for use with new kernels, and eventually deprecate the
> ATTR_* usage as older kernels become obsoleted.  Once the FAT_ATTR_*
> versions had been around for a year or three (enough for a major vendor
> release cycle to get them into some large fraction of users hands) they
> could start being documented in the man pages and the old versions
> documented only for backward compatibility (as with old APIs like
> strcpy(3) or mktemp(3)).
>
> Given that FAT ioctls are not widely used by applications, the
> actual ABI (numeric constants) isn't changing, and the workaround
> is simple, I'd expect that the time before deprecating the old
> constants could be fairly short.

True. And now that we're actually documenting this stuff, it would be
a good time to make the change, so that the new names appear in the
docs.

Hirofumi, what do you think?

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
