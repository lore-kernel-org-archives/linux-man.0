From: Zhu Yanhai <zhu.yanhai@gmail.com>
Subject: readahead() blocks until the specified data has been read ?
Date: Fri, 4 Nov 2011 14:39:55 +0800
Message-ID: <CAC8teKXWTSAMvregJX5U6pZF8kMp=W8y3LO2ppu72A0jTQ6mpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-man@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi all,
In the man page for man 2 readahead, it reads "readahead() blocks
until the specified data has been read"
(http://www.kernel.org/doc/man-pages/online/pages/man2/readahead.2.html),
however obviously readahead() doesn't work like this, as it's not a
synchronous IO submitter. Is the man-page out-of-dated?

Thanks,
Zhu Yanhai
