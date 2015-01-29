From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Documenting RENAME_WHITEOUT
Date: Thu, 29 Jan 2015 11:01:08 +0100
Message-ID: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Miklos,

I just noticed that your RENAME_WHITEOUT flag went into Linux 3.18:
commit 0d7a855526dd672e114aff2ac22b60fc6f155b08
commit 787fb6bc9682ec7c05fb5d9561b57100fbc1cc41

Would you be willing to write some text for the rename(2)/renameat2(2)
man page that described this flag. In that text it would be great to
have an explanation of what a whiteout is and why they are useful.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
