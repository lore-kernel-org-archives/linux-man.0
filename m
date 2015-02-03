From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 03 Feb 2015 19:05:33 +0900
Message-ID: <87bnlbe2du.fsf@mail.parknet.co.jp>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
	<1422042884-10824-1-git-send-email-xypron.glpk@gmx.de>
	<CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
	<87k2zze5tg.fsf@mail.parknet.co.jp>
	<CAKgNAkhrvdAauGAQOukGQ6B8MJ3kbYWivvrzzMJMaQOKsCq4sA@mail.gmail.com>
	<87fvane3ch.fsf@mail.parknet.co.jp>
	<CAKgNAkh81o6FGY-M5HX5Qt+kk9S8SPW+WcqOZBrA+5PdEn+RGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkh81o6FGY-M5HX5Qt+kk9S8SPW+WcqOZBrA+5PdEn+RGg@mail.gmail.com>
	(Michael Kerrisk's message of "Tue, 3 Feb 2015 10:54:53 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:

> Thanks for the clarification. I have one other question. Currently the
> man page does not document two fields in the __fat_dirent structure:
> d_ino and d_offset. d_ino is presumably the inode number. But, what is
> d_offset?

d_ino and d_off (I guess, d_off you meant) is used only for long
filename part in dirents. And,

	d_off == seek offset
        d_ino == inode number

same with getdents(), but again it is valid only on long name dirent.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
