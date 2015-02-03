From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 03 Feb 2015 17:51:23 +0900
Message-ID: <87k2zze5tg.fsf@mail.parknet.co.jp>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
	<1422042884-10824-1-git-send-email-xypron.glpk@gmx.de>
	<CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
	(Michael Kerrisk's message of "Tue, 3 Feb 2015 09:25:50 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:

> Hello Heinrich and Ogawa,

Hi,

> On 23 January 2015 at 20:54, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>> The ioctl(2) system call may be used to retrieve information about
>> the fat file system and to set file attributes.
>>
>> This new manpage describes the details.
>
> @Ogawa, as the FAT maintainer, might you be willing to review this page?


               for (;;) {

                   /*
                    * Read next directory entry.
                    */
                   ret = ioctl( fd, VFAT_IOCTL_READDIR_BOTH, entry);

                   /*
                    * If an error occurs, the return value is -1.
                    * If d_reclen is zero, the end of the directory
                    * list has been reached.
                    */
                   if (ret == -1 || entry[0].d_reclen == 0)
                       break;

Quick reviewed, and looks good. However, entry[0].d_reclen == 0 works as
backward compatibility though. The example might be good to use usual
way of getdents().

I.e., "ret" means
	-1 == error
        0  == EOD
        0  >  how many bytes read

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
