From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [pull request] Delete man pages that will migrate to the Linux
 man-pages project
Date: Tue, 13 Dec 2016 15:50:09 +0100
Message-ID: <CAKgNAki0M5qT-Cim+vemGRJxfoSf+9Xeg1Tjz6DfsAgDkETfgA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As discussed face-to-face and by email, there are a number of
man pages in keyutils that document kernel APIs. The more natural
home for these pages is Linux man-pages. I've already migrated
the pages listed below into Linux man-pages, and subsequently
enhanced various pages. They'll be released with the next release of
man-pages (around the end of Feb 2017).

The following changes since commit ce92e974b8ecff19cf430b7b58a09b8190645b5c:

  TEST: Fix endianness determination (2016-02-26 10:07:00 +0000)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/mtk/keyutils.git
remove_migrated_man7

for you to fetch changes up to aedfce27baf51a776dc93e38b61df30eaee16003:

  man: Delete man pages that will migrate to the Linux man-pages
project (2016-12-13 15:41:45 +0100)

----------------------------------------------------------------
Michael Kerrisk (1):
      man: Delete man pages that will migrate to the Linux man-pages project

 man/keyrings.7             | 416 ----------------------------------------------
 man/persistent-keyring.7   |  67 --------
 man/process-keyring.7      |  53 ------
 man/session-keyring.7      |  85 ----------
 man/thread-keyring.7       |  50 ------
 man/user-keyring.7         |  63 -------
 man/user-session-keyring.7 |  65 --------
 7 files changed, 799 deletions(-)
 delete mode 100644 man/keyrings.7
 delete mode 100644 man/persistent-keyring.7
 delete mode 100644 man/process-keyring.7
 delete mode 100644 man/session-keyring.7
 delete mode 100644 man/thread-keyring.7
 delete mode 100644 man/user-keyring.7
 delete mode 100644 man/user-session-keyring.7


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
